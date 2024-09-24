package com.test.spboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.test.spboot.service.UserInfoService;
import com.test.spboot.vo.ResultList;
import com.test.spboot.vo.UserInfoVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class UserInfoController {
	@Autowired
	private UserInfoService uiService;
	
	@GetMapping("/users")
	public ResultList<UserInfoVO> getUsers(UserInfoVO userInfo){
		ResultList<UserInfoVO> rl =  uiService.selectUsers(userInfo);
		return rl;
	}
	
	@GetMapping("/users/{uiNum}")
	public UserInfoVO getUser(@PathVariable("uiNum")int uiNum) {
		return uiService.selectUser(uiNum);
	}
	
	@DeleteMapping("/users/{uiNum}")
	public int removeUser(@PathVariable("uiNum") int uiNum) {
		return uiService.deleteUser(uiNum);
	}
	
	@PostMapping("/users")
	public int addUser(@RequestBody UserInfoVO userInfo) {
		return uiService.insertUser(userInfo);
	}

	@PutMapping("/users")
	public int modifyUser(@RequestBody UserInfoVO userInfo) {
		return uiService.updateUser(userInfo);
	}
	
}
