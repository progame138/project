package com.shoestar.client.prod.vo;

import com.shoestar.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ProdInsFilterVO extends CommonVO {
	private String mainImage;
}
