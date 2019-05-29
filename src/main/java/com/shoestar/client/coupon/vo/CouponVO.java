package com.shoestar.client.coupon.vo;

import java.sql.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class CouponVO {
	private int cp_no; // 쿠폰 번호
	private String cp_title; // 쿠폰 제목
	private String cp_content; // 쿠폰 내용
	private int cp_discount; // 쿠폰 할인
	private Date cp_date; // 쿠폰 등록일
	private Date cp_edate; // 쿠폰 만료일
	private int ev_no; // 이벤트 번호
}
