package com.shoestar.client.event.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class Coupon_InsVO {
	private int ci_no; // 쿠폰지급 번호
	private String ci_use; // 사용 여부
	private int cp_no; // 쿠폰 번호
	private int mem_no; // 회원 번호
}
