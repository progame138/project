/**
 * 상품 정보를 읽어오는 자바스크립트 모음
 * @author 배정훈
 */

/** 상품 리스트를 읽어오는 URL */
var PROD_LIST_URL = "/product/showList";

/** 상품 이미지 저장소의 URL */
var PROD_IMAGE_STORATE_URL = "/shoestarStorage/prod/";

/** 상품 이미지 저장소의 URL */
var PROD_THUMB_STORATE_URL = "/shoestarStorage/prod/thumb/";

/**
 * 상품정보를 매개변수로 이미지와 가격등이 표시되는 div를 만들어내는 함수
 * @param prodVO 상품 정보를 담은 ProdVO JSON 객체
 * @returns jQuery div 객체
 */
function createProductDiv(prodVO) {
	// 이미지 부분
	var pImageSection = $("<div>").addClass("prodImage text-center");
	var imgUrl;
	if(prodVO.pim_main == null) {
		imgUrl = PROD_THUMB_STORATE_URL + "default.jpg";
	} else {
		imgUrl = PROD_THUMB_STORATE_URL + prodVO.pim_main;
	}
	var pImage = $("<img>").attr({
		"src" : imgUrl,
		"alt" : prodVO.pd_name
		}).addClass("img-rounded");
	pImageSection.append(pImage);
	
	// 신규, 인기, 세일, 품절등 정보 표시란
	var pEventSection = $("<div>").addClass("prodEvent");
	// 세일가 표시
	pEventSection.append(createDiscountLabel(prodVO, false)).addClass("prodEvent");
	// 기타 상태
	var prodStatNew = $("<span>").text("신규").addClass("prodStat prodStat_new");
	var prodStatHot = $("<span>").text("인기").addClass("prodStat prodStat_hot");
	if(!jQuery.isEmptyObject(prodVO.pd_status)) {
		switch (prodVO.pd_status.toLowerCase()) {
		case "n": // 신규
			pEventSection.append(prodStatNew);
			break;
		case "h": // 인기
			pEventSection.append(prodStatHot);
			break;
		case "b": // 둘 다
			pEventSection.append(prodStatNew);
			pEventSection.append(prodStatHot);
			break;
		default: // 아무 것도 안하기
			break;
		}
	}
	
	// 이름 표시
	var pNameSection = $("<div>").text(prodVO.pd_name).addClass("prodName text-left");
	// 분류  표시
	var pCtgSection = $("<div>").text(prodVO.pct_name).addClass("prodCtg text-left");
	
	// 가격 표시
	var pPriceSection = $("<div>").addClass("priceSection text-right");
	var pNormalPrice = $("<span>").text(prodVO.pd_price).addClass("prodPrice prodPrice_normal");
	pPriceSection.append(pNormalPrice);
	// 할인 정보 존재 시 콜백 함수를 통한 표시
	getProductDiscount(prodVO, function(targetPriceSection, dcRate) {
		var normalPrice = targetPriceSection.find("span.prodPrice_normal");
		normalPrice.removeClass("prodPrice_normal").addClass("prodPrice_depricate");
		
		var discountPrice = $("<span>").text(calculateDiscount(normalPrice.text(), dcRate)).addClass("prodPrice prodPrice_discount");
		targetPriceSection.append(discountPrice);
	}, pPriceSection);
	
	// 별점 표시
	var pRatingSection = $("<div>").addClass("ratingSection");
	pRatingSection.append(createRatingLabel(prodVO, false));
	
	// 조립
	var pColumn = $("<div>").addClass("prodContainer");
	pColumn.append(pImageSection).append(pEventSection).append(pNameSection).append(pCtgSection).append(pPriceSection).append(pRatingSection);
	
	return pColumn;
}

/**
 * 상품 정보를 입력하면 할인율을 계산해서 콜백함수로 넘겨주는 함수
 * @param prodVO 상품 정보를 담은 prodVO JSON 객체
 * @param callback 호출할 콜백 함수
 * @param callbackParam 콜백 함수로 넘길 파라미터
 * @returns 정수로 변환한 할인율 (15% => 15)
 */
function getProductDiscount(prodVO, callback, callbackParam) {
	//TODO: 할인 정보 ajax로 받아서 대조하고 콜백으로 넘겨주기 callback(callbackParam, discountRate)
}

/**
 * 상품 정보를 토대로 할인율 라벨을 만드는 함수
 * @param prodVO 상품 정보를 담은 prodVO JSON 객체
 * @param enlarge 라벨의 크기를 키울지 여부. 기본 값은 false.
 * @param dcRate 할인율 직접 입력
 * @returns 할인율 %를 표시한 jQuery div 객체. 할인이 존재하지 않을 경우 sr-only로 숨겨짐
 */
function createDiscountLabel(prodVO, enlarge, dcRate) {
	// 리턴할 객체
	var dcLabel = $("<span>").addClass("prodStat prodStat_dc sr-only");
	
	// 할인 정보 담기
	if(isNaN(dcRate)) {
		try {
			getProductDiscount(prodVO, dcCallback, dcLabel);
		} catch (e) {
		}
	} else {
		dcCallback(dcLabel, dcRate);
	}
	
	// 크기 조절
	if(typeof enlarge === "boolean" && enlarge) {
		dcLabel.addClass("prodStat_enlarge");
	}
	
	return dcLabel;
}

/** 할인율을 레이블에 입력하기 위한 함수 */
var dcCallback = function(targetLabel, discountRate) {
	if(discountRate != 0) {
		targetLabel.removeClass("sr-only").text("-" + discountRate + "%");
	}
};


/**
 * 상품 정보를 토대로 평점 평균을 계산하고 라벨로 만들어주는 함수
 * @param prodVO 상품 정보를 담은 prodVO JSON 객체
 * @param 라벨의 크기를 키울지 여부. 기본 값은 false.
 * @returns 평점을 표시한 jQuery div 객체. 평점이 존재하지 않을 경우 sr-only로 숨겨짐
 */
function createRatingLabel(prodVO, enlarge) {
	
	// TODO: 평점 관련 작업
	
	// 크기 조절
	if(typeof enlarge === "boolean" && enlarge) {
		//TODO: 크게 만들기
	}
	return null;
}

/**
 * 원가와 할인율을 입력하면 할인가를 계산해주는 함수
 * @param normalPrice 원가
 * @param discountRate 할인율. 15%일 시 15 입력
 * @returns 할인가
 */
function calculateDiscount(normalPrice, discountRate) {
	if(discountRate < 1) {
		discountRate = discountRate * 100;
	}
	return Math.floor(parseInt(normalPrice) * discountRate / 1000) * 10;
}