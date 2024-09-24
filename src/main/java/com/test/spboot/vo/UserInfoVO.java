package com.test.spboot.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserInfoVO {
	
	private int uiNum;
	private int start;
	private int count;
	private int page;
	private String uiName;
	private String uiId;
	private String uiPwd;
	private String uiGender;
	private String uiBirth;
	private String uiHobby;
	private String uiDesc;
	private String credat;
	private String cretim;
}
