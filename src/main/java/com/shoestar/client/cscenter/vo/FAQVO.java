package com.shoestar.client.cscenter.vo;

import java.sql.Date;

import com.shoestar.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class FAQVO {
	private int faq_no = 0;
	private String faq_title="";
	private String faq_content="";
	private Date faq_date;
	private int fc_no=0;
	private String fc_name="";
}
