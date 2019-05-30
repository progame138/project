package com.shoestar.common.vo;

import lombok.Data;

@Data
public class CommonVO {
	/** 페이지 번호 */
	private int pageNum;
	/** 한 페이지에서 보여줄 레코드 수 */
	private int amount;
	/** 검색 단어 */
	private String keyword;
	/** 검색 타입 */
	private String search;
	
	/** 기본 생성자. 페이지 번호와 레코드 수가 각각 1, 20으로 자동 설정된다. */
	public CommonVO() {
		this.pageNum = 1;
		this.amount = 20;
	}
	
	/**
	 * 페이지 번호와 보여줄 레코드 수를 설정하는 설정자
	 * @param pageNum 페이지 번호
	 * @param amount 보여줄 레코드 수
	 */
	public CommonVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
