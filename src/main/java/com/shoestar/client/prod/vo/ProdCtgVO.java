package com.shoestar.client.prod.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Prod 카테고리 전담 VO
 * @author 배정훈
 */
@Data
@EqualsAndHashCode(callSuper=false)
public class ProdCtgVO extends ProdCtgFilterVO {
	private int pct_no;
	private String pct_name;
}
