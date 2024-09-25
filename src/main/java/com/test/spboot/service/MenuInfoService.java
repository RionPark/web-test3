package com.test.spboot.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.test.spboot.mapper.MenuInfoMapper;
import com.test.spboot.vo.MenuInfoVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MenuInfoService {
	private static final String UPLOAD_PATH = "C:\\dev\\workspace\\spboot\\src\\main\\webapp\\upload\\";
	@Autowired
	private MenuInfoMapper miMapper;
	
	public List<MenuInfoVO> selectMenus(MenuInfoVO menu){
		List<MenuInfoVO> list = miMapper.selectMenus(menu);
		return list;
	}
	
	public MenuInfoVO selectMenu(int miNum){
		MenuInfoVO menu = miMapper.selectMenu(miNum);
		return menu;
	}
	
	public int insertMenu(MenuInfoVO menu) {
		try {
			MultipartFile miFile = menu.getMiFile();
			if(miFile != null) {
				String name = miFile.getOriginalFilename();
				int idx = name.lastIndexOf(".");
				String ext = name.substring(idx);
				name = System.nanoTime() + ext;
				
				File f = new File(UPLOAD_PATH + name);
				miFile.transferTo(f);
				menu.setMiPath("/upload/" + name);
			}
			int result = miMapper.insertMenu(menu);
			return result;
		}catch(Exception e) {
			log.error("upload error=>{}",e);
		}
		return 0;
	}
	
	public int updateMenu(MenuInfoVO menu) {
		
		int result = miMapper.updateMenu(menu);
		return result;
	}
	
	public int deleteMenu(int miNum) {
		int result = miMapper.deleteMenu(miNum);
		return result;
	}
}
