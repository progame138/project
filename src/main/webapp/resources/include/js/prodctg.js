/**
 * 상품 분류 정보를 읽어오고 메뉴바를 구축하는 자바스크립트 모음
 * @author 배정훈
 */

/** 상품 리스트를 읽어오는 URL */
const PROD_LIST_URL = "/product/showList";

/**
 * 상품 카테고리 정보를 읽고 상품 정보 리스트를 표시하는 함수
 * @param prodCtgVO 상품 카테고리 정보
 * @param requestParam 링크에 추가할 요청 정보
 * @returns 상품 카테고리 정보를 
 */
function createProdCtgLink(prodCtgVO, requestParam) {
	var requestToAppend = "";
	
	// 성별과 나이 정보 가져오기
	try {
		if(requestParam.startsWith("&") || requestParam == "") {
			requestToAppend = requestParam;
		} else {
			requestToAppend = "&" + splitRequest(requestParam, "pd_sex", "pd_age");
		}
	} catch (e) {
	}
	
	var pcli = $("<li>");
	var pca = $("<a>").attr({
		"href" : PROD_LIST_URL + "?pct_no=" + prodCtgVO.pct_no + requestToAppend,
	}).text(prodCtgVO.pct_name);
	
	if(getRequestValue("pct_no") == prodCtgVO.pct_no) {
		pca.addClass("filterToggled");
	}
	
	var pcnt = $("<span>").text(" (" + prodCtgVO.pd_count + ")").addClass("ctgCount");
	
	pcli.append(pca.append(pcnt));
	
	return pcli;
}

/**
 * 요청값에서 명시된 요청만 남겨서 돌려주는 함수
 * @param requestParam 요청값 전체
 * @param allowThese 가져올 요청 파라미터
 * @returns
 */
function splitRequest(requestParam, ...allowThese) {
	var requestToAppend = "";
	
	$.each(requestParam.replace("?","").split("&"), function(index, stack) {
		for(var paramIndex in allowThese) {
			if(stack.toLowerCase().startsWith(allowThese[paramIndex].toLowerCase())) {
				requestToAppend = requestToAppend + "&" + stack;
				break;
			}
		}
	});
	
	if(requestToAppend != "") {
		requestToAppend = requestToAppend.substring(1, requestToAppend.length);
	}
	
	return requestToAppend;
}


function getRequestValue(targetRequest) {
	var paramReg = new RegExp(".*&?"+targetRequest+"=(\\d+).*", "g");
	var regResult = paramReg.exec(window.location.search);
	return regResult != null ? regResult[1] : null;
}

/**
 * 가격 필터를 포함한 링크를 필터리스트 내에 존재하는 a 태그의 속성에 명시
 * @param target 목표로 할 ul
 */
function resetPriceList(target) {
	target.children("li").each(function() {
		var targetFilter = $(this).find(".priceFilter");
		
		var priceBottom = targetFilter.attr("data-priceb");
		var priceTop = targetFilter.attr("data-pricet");
		
		var requestTo = PROD_LIST_URL + "?" + splitRequest(window.location.search, "pd_sex", "pd_age", "pct_no", "color", "size");
		var priceFilter = createPriceFilterRequest(priceBottom, priceTop);
		
		targetFilter.attr("href", requestTo + priceFilter);
		if(priceFilter == "") {
			targetFilter.addClass("filterToggled");
		}
	});
}

/**
 * 가격 필터를 요청 쿼리형식으로 리턴하는 함수
 * @param priceBottom 최저가
 * @param priceTop 최대가
 * @returns 요청 쿼리
 */
function createPriceFilterRequest(priceBottom, priceTop) {
	var requestString = "";
	
	requestBottom = getRequestValue("priceBottom");
	requestTop = getRequestValue("priceTop");
	
	if(!jQuery.isEmptyObject(priceBottom) && priceBottom != "" && !isNaN(priceBottom)) {
		if(requestBottom != priceBottom)
			requestString = requestString + "&priceBottom=" + priceBottom;
	}
	if(!jQuery.isEmptyObject(priceTop) && priceTop != "" && !isNaN(priceTop)) {
		if(requestTop != priceTop)
			requestString = requestString + "&priceTop=" + priceTop;
	}
	
	return requestString;
}

/**
 * 사이즈 필터를 적용할 li 생성 함수
 * @param pSize 생성할 사이즈
 * @returns jQuery li 태그
 */
function createSizeLink(pSize) {
	var reqSize = getRequestValue("size");
	
	var psli = $("<li>");
	var psa = $("<a>").attr({
		"href" : PROD_LIST_URL + "?" + splitRequest(window.location.search, "pd_sex", "pd_age", "pct_no",
				"color", "priceBottom", "priceTop")
	}).text(pSize);
	
	var sizeReqChunk = "&size=" + pSize;
	if(reqSize != null && reqSize == pSize) {
		sizeReqChunk = "";
		psa.addClass("filterToggled");
	}
	psa.attr("href", psa.attr("href") + sizeReqChunk);
	
	psli.append(psa.append());
	
	return psli;
}