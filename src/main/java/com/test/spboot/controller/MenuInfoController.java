package com.test.spboot.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.test.spboot.service.MenuInfoService;
import com.test.spboot.vo.MenuInfoVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class MenuInfoController {
	
	@Autowired
	private MenuInfoService miService;
	
	@GetMapping("/menus")
	public List<MenuInfoVO> getMenus(MenuInfoVO menu){
		List<MenuInfoVO> list = miService.selectMenus(menu);
		return list;
	}
	
	@GetMapping("/menus/{miNum}")
	public MenuInfoVO getMenu(@PathVariable int miNum) {
		MenuInfoVO menu = miService.selectMenu(miNum);
		return menu;
	}
	
	@PostMapping("/menus")
	public int addMenu(MenuInfoVO menu) throws IllegalStateException, IOException {
		int result = miService.insertMenu(menu);
		return result;
	}
}
