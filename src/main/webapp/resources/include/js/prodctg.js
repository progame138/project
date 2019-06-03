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
			requestToAppend = "&" + splitRequest(requestParam);
		}
	} catch (e) {
	}
	
	var pcli = $("<li>");
	var pca = $("<a>").attr({
		"href" : PROD_LIST_URL + "?pct_no=" + prodCtgVO.pct_no + requestToAppend,
	}).text(prodCtgVO.pct_name);
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
			if(stack.toLowerCase().startsWith(allowThese[paramIndex])) {
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

/**
 * 가격 필터를 포함한 링크를 필터리스트 내에 존재하는 버튼의 속성에 명시
 * @param target 목표로 할 ul
 */
function resetPriceList(target) {
	target.children("li").each(function() {
		var targetBtn = $(this).find(".priceFilter");
		
		//targetBtn.attr("href", createPriceFilterRequest(priceBottom, priceTop));
		targetBtn.click(function(event) {
			var pb = targetBtn.attr("data-priceb");
			var pt = targetBtn.attr("data-pricet");
		});
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
	
	if(!jQuery.isEmptyObject(priceBottom) && priceBottom != "" && !isNaN(priceBottom)) {
		requestString = requestString + "&priceBottom=" + priceBottom;
	}
	if(!jQuery.isEmptyObject(priceTop) && priceTop != "" && !isNaN(priceTop)) {
		requestString = requestString + "&priceTop=" + priceTop;
	}
	
	return requestString;
}


function toggleSubmitButton(targetForm) {
	
}