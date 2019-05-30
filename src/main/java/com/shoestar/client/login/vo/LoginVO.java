package com.shoestar.client.login.vo;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class LoginVO {
	
	private int mem_no;
	private String mem_id="";
	private String mem_pwd="";
	private String mem_name="";
	private int mem_birth;
	private String mem_sex="";
	private String mem_addr1="";
	private String mem_addr2="";
	private String mem_phone="";
	private String mem_email="";
	private int cls_no;
	private String mem_zip="";
	private Date mem_rdate;
	

}
