package com.shoestar.client.range_discount.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class Range_DiscountVO {
	private int ev_no;	// 이벤트 번호
	private int rd_no; // 범위 할인 번호
	private int rd_title; // 범위 할인 제목
	private String rd_content; // 범위 할인 내용
	private int rd_discount; // 범위 할인 (100 이하는 %, 1000이상은 원)

	
}
