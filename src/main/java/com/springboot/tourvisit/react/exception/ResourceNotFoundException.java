package com.springboot.tourvisit.react.exception;

public class ResourceNotFoundException extends RuntimeException{

	private static final long serialVersionUID = 1L;
	
	public ResourceNotFoundException(String  messege) {
		super(messege);
	}
}
