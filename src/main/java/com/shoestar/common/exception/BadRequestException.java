package com.shoestar.common.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * 요청이 잘못됐을 경우 던지는 400 에러
 * @author 배정훈
 */
@ResponseStatus(value=HttpStatus.BAD_REQUEST)
public class BadRequestException extends RuntimeException {
	private static final long serialVersionUID = 8402159583774555884L;

	public BadRequestException() {
		super();
	}
	
	public BadRequestException(String msg) {
		super(msg);
	}
}
