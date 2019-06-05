package com.shoestar.client.prod.vo;

import lombok.Data;

@Data
public class ProdStockVO {
	private int pi_no;
	private int ps_size;
	private int ps_qty;
	private String ps_status;
}