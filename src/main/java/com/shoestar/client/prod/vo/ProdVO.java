package com.shoestar.client.prod.vo;

import java.sql.Date;

import com.shoestar.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ProdVO extends CommonVO {
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
	private int pim_no_main;
	
	// 검색을 위한 필터값
	private int size;
	private int color;
	private int priceBottom;
	private int priceTop;
}