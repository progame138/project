package com.shoestar.client.prod.vo;

import com.shoestar.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ProdVO extends CommonVO {
	private Integer pd_no;
	private String pd_name;
	private String pd_sex;
	private String pd_age;
	private Integer pct_no;
	private Integer co_no;
	private Integer pd_price;
	private String pd_fabric;
	private String pd_country;
	private String pd_year;
	private String pd_manu;
	private String pd_import;
	private String pi_no;
	private String pd_date;
	private String pd_status;
	private String pim_no_main;
}