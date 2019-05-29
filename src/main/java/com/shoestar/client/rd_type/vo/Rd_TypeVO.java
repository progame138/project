package com.shoestar.client.rd_type.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class Rd_TypeVO {
	private int rd_no; // 범위 할인 번호
	private int pct_no; // 신발 카테고리 번호
}
