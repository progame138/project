package com.shoestar.client.cscenter.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;



import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class QNAVO{
	private int mem_no = 0;
	private int od_no = 0;
	private int qna_no = 0;
	private String qna_title = "";
	private String qna_content = "";
	private MultipartFile file;
	private String qna_file;
	private Date qna_date = null;
	private String qna_ctgr = "";
	private String r_cnt = "";
}
