package com.test.spboot.mapper;

import java.util.List;

import com.test.spboot.vo.UserInfoVO;

public interface UserInfoMapper {
	public int selectUsersTotal(UserInfoVO userInfo);
	public List<UserInfoVO> selectUsers(UserInfoVO userInfo);
	public UserInfoVO selectUser(int uiNum);
	public int deleteUser(int uiNum);
	public int insertUser(UserInfoVO userInfo);
	public int updateUser(UserInfoVO userInfo);
}