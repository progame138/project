/**
 * 상품 정보를 읽어오는 자바스크립트 모음
 * @author 배정훈
 */

/** 상품 리스트를 읽어오는 URL */
var PROD_LIST_URL = "/product/showList";

/** 상품 이미지 저장소의 URL */
var PROD_IMAGE_STORATE_URL = "/shoestarStorage/prod";

/**
 * 상품정보를 매개변수로 이미지와 가격등이 표시되는 div를 만들어내는 함수
 * @param prodVO 상품 정보를 담은 ProdVO JSON 객체
 * @returns jQuery div 객체
 */
function createProductDiv(prodVO) {
	
	// 이미지 부분
	var pImageSection = $("<div>").addClass("prodImage");
	var pImage = $("<img>").attr({
		"src" : PROD_IMAGE_STORATE_URL + prodVO.pim_no_main,
		"alt" : prodVO.pd_name
		});
	
	// 신규, 인기, 세일, 품절등 정보 표시란
	var pEventSection = $("<div>").addClass("prodEvent");
	// 세일가 표시
	pEventSection.append(createDiscountLabel(prodVO, false));
	// 기타 상태
	switch (prodVO.pd_status.toLowerCase()) {
	case "n": // 신규
		pEventSection.append($("<span>").text("신규").addClass("prodStat prodStat_new"));
		break;
	case "h": // 인기
		pEventSection.append($("<span>").text("인기").addClass("prodStat prodStat_hot"));
		break;
	case "b": // 둘 다
		pEventSection.append($("<span>").text("신규").addClass("prodStat prodStat_new"));
		pEventSection.append($("<span>").text("인기").addClass("prodStat prodStat_hot"));
		break;
	default: // 아무것도 아니면
		break;
	}
	
	// 이름 표시
	var pNameSection = $("<div>").text(prodVO.pd_name).addClass("prodName");
	
	// 가격 표시
	
	var pOuterMostContainer = $("<div>").addClass("prodContainer");
}

/**
 * 상품 정보를 입력하면 할인율을 계산해서 콜백함수로 넘겨주는 함수
 * @param prodVO 상품 정보를 담은 prodVO JSON 객체
 * @param callback 호출할 콜백 함수
 * @param callbackParam 콜백 함수로 넘길 파라미터
 * @returns 정수로 변환한 할인율 (15% => 15)
 */
function getProductDiscount(prodVO, callback, callbackParam) {
	var d
}

/**
 * 상품 정보를 토대로 할인율 라벨을 만드는 함수
 * @param prodVO 상품 정보를 담은 prodVO JSON 객체
 * @param enlarge 라벨의 크기를 키울지 여부. 기본 값은 false.
 * @param dcRate 할인율 직접 입력
 * @returns 할인율 %를 표시한 jQuery div 객체. 할인이 존재하지 않을 경우 null
 */
function createDiscountLabel(prodVO, enlarge, dcRate) {
	var discountRate;
	
	if(isNaN(dcRate)) {
		try {
			discountRate = getProductDiscount(prodVO); // todo
		} catch (e) {
			discountRate = 0;
		}
		if(discountRate == 0) {
			return null;
		}
	} else {
		discountRate = dcRate;
	}
	
	var dcLabel = $("<span>").addClass("prodStat prodStat_dc").attr("data-discount_pdno",prodVO.pd_no);
	if(enlarge) {
		dcLabel.addClass("prodStat_enlarge");
	}
	
	return dcLabel;
}

/**
 * 
 * @param dcLabel
 * @param discountRate
 * @returns
 */
function configureDiscountLabel(dcLabel, discountRate) {
	if(discountRate == 0) {
		dcLabel.addClass("");
	}
}