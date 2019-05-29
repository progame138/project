package com.shoestar.client.brand.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)

public class CollectionVO {
	// 컬렉션 테이블 - 신발컬렉션
	private int co_no; // 컬렉션 번호
	private String co_name; // 컬렉션 명
	private String co_feature; // 신발 특징
	private String co_function; // 신발 기능
	private String co_year; // 컬렉션 출시년도

}
