package com.test.spboot.mapper;

import java.util.List;

import com.test.spboot.vo.MenuInfoVO;

public interface MenuInfoMapper {
	public List<MenuInfoVO> selectMenus(MenuInfoVO menu);
	public MenuInfoVO selectMenu(int miNum);
	public int insertMenu(MenuInfoVO menu);
	public int updateMenu(MenuInfoVO menu);
	public int deleteMenu(int miNum);
}
