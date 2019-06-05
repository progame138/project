package com.shoestar.client.prod.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ProdInsVO extends ProdInsFilterVO {
	private int pi_no;
	private int pd_no;
	private int pcl_no;
}