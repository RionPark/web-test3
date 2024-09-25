package com.test.spboot.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MenuInfoVO {
	private Integer miNum;
	private String miName;
	private Integer miPrice;
	private String miDesc;
	private String miPath;
	private MultipartFile miFile;
}
