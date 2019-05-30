package com.shoestar.client.cscenter.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

//import com.shoestar.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class FAQVO {
	private int faq_no = 0;
	private String faq_title="";
	private String faq_content="";
	
	//@DateTimeFormat(pattern = "yyyy-MM-dd 24HH:")
	private Date faq_date=null;
	private int fc_no=0;
	private String fc_name="";
}
