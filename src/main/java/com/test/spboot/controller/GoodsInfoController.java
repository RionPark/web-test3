package com.test.spboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.test.spboot.service.GoodsInfoService;
import com.test.spboot.vo.GoodsInfoVO;

@RestController
public class GoodsInfoController {

	@Autowired
	private GoodsInfoService giService;
	
	@GetMapping("/goods")
	public List<GoodsInfoVO> getGoodsList(GoodsInfoVO goods){
		return giService.selectGoodsList(goods);
	}

	@GetMapping("/goods/{giNum}")
	public GoodsInfoVO getGoods(@PathVariable int giNum){
		return giService.selectGoods(giNum);
	}
	
	/*
	 * http method
	 * 조회 : get
	 * 추가 : post
	 * 수정 : put
	 * 삭제 : delete
	 */
	@PostMapping("/goods")
	public int addGoods(@RequestBody GoodsInfoVO goods) {
		return giService.insertGoods(goods);
	}
	@PutMapping("/goods")
	public int modifyGoods(@RequestBody GoodsInfoVO goods) {
		return giService.updateGoods(goods);
	}
	@DeleteMapping("/goods/{giNum}")
	public int removeGoods(@PathVariable int giNum) {
		return giService.deleteGoods(giNum);
	}
}
