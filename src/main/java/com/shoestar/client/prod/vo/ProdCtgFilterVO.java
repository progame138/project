package com.shoestar.client.prod.vo;

import lombok.Data;

@Data
public class ProdCtgFilterVO {
	// 검색을 위한 변수
	private String pd_sex; // 성별 조건
	private String pd_age; // 연령 조건
	
	// 검색 후 정보 표시를 위한 변수
	private int pd_count; // 상품의 수
}
