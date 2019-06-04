package com.shoestar.client.prod.vo;

import com.shoestar.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ProdInsFilterVO extends CommonVO {
	private String mainImage;
	
	private boolean includeAbnormal = false; // 현재 문제가 있는 상품까지 보여줄지 여부 (pi_status가 null이 아닌 것)
}
