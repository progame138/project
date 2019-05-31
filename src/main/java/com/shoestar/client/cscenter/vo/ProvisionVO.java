package com.shoestar.client.cscenter.vo;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)

public class ProvisionVO {
	private int p_no = 0;
	private String p_title = "";
	private String p_content = "";
	private Date p_date = null;
}
