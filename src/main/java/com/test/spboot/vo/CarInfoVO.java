package com.test.spboot.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CarInfoVO {
	private Integer ciNum;
	private String ciName;
	private String ciYear;
	private int start;
	private int count;
	private int page;
}
