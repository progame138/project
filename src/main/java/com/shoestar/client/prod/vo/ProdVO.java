package com.shoestar.client.prod.vo;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Prod Àü´ã VO
 * @author ¹èÁ¤ÈÆ
 */
@Data
@EqualsAndHashCode(callSuper=false)
public class ProdVO extends ProdFilterVO {
	private int pd_no;
	private String pd_name;
	private String pd_sex;
	private String pd_age;
	private int pct_no;
	private int co_no;
	private int pd_price;
	private String pd_fabric;
	private String pd_country;
	private String pd_year;
	private String pd_manu;
	private String pd_import;
	private int pi_no;
	private Date pd_date;
	private String pd_status;
	private String pim_main;
}