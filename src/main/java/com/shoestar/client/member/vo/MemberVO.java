package com.shoestar.client.member.vo;

import java.sql.Timestamp;
import java.util.Date;

import com.shoestar.client.login.vo.LoginVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class MemberVO extends LoginVO{
	/*private String mem_id;
	private String mem_pwd;
	private String mem_name;*/
	private int mem_birth;
	private String mem_sex;
	private String mem_addr1;
	private String mem_addr2;
	private String mem_phone;
	private String mem_email;
	private int cls_no;
	private String mem_zip;
	private Date mem_rdate;
	private int mem_no;
	
	private int idx;
	private String oldUserpwd;
	private String pinno;
	private Timestamp joinDate;


}
