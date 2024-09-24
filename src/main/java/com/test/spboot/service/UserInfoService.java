package com.test.spboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.spboot.mapper.UserInfoMapper;
import com.test.spboot.vo.GoodsInfoVO;
import com.test.spboot.vo.ResultList;
import com.test.spboot.vo.UserInfoVO;

@Service
public class UserInfoService {	
	@Autowired
	private UserInfoMapper uiMapper;
	
	public ResultList<UserInfoVO> selectUsers(UserInfoVO userInfo) {
		if(userInfo.getCount()==0) {
			userInfo.setCount(10);
		}
		if(userInfo.getPage()!=0) {
			int start = (userInfo.getPage()-1) * 10;
			userInfo.setStart(start);
		}
		ResultList<UserInfoVO> rl = new ResultList<>();
		List<UserInfoVO> users = uiMapper.selectUsers(userInfo);
		rl.setList(users);
		int totalCnt = uiMapper.selectUsersTotal(userInfo);
		rl.setCount(totalCnt);
		return rl;
	}
	
	public UserInfoVO selectUser(int uiNum) {
		return uiMapper.selectUser(uiNum);
	}

	public int deleteUser(int uiNum) {
		return uiMapper.deleteUser(uiNum);
	}
	public int insertUser(UserInfoVO userInfo) {
		return uiMapper.insertUser(userInfo);
	}
	public int updateUser(UserInfoVO userInfo) {
		return uiMapper.updateUser(userInfo);
	}
}
