package com.shoestar.client.prod.vo;

import com.shoestar.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ProdFilterVO extends CommonVO {
	// 검색을 위한 필터값
	private int size;
	private int color;
	private int priceBottom;
	private int priceTop;
	
	// 검색 후 표시할 정보값
	private String pct_name; // 분류 이름
	private int pd_discount; // 할인율
}
