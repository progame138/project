package com.shoestar.client.member.vo;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.shoestar.client.login.vo.LoginVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class MemberVO extends LoginVO{
	/*private String mem_id;
	private String mem_pwd;
	private String mem_name;*/
	@DateTimeFormat(pattern = "yyMMdd")
	private Date mem_birth;
	private Date mem_rdate;
	private String mem_sex;
	private String mem_addr1;
	private String mem_addr2;
	private String mem_addr3;
	private String mem_phone;
	private String mem_email;
	private int cls_no;
	private String mem_zip;
	
	private String oldUserPwd;

}
