package com.test.spboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.spboot.mapper.GoodsInfoMapper;
import com.test.spboot.vo.GoodsInfoVO;

@Service
public class GoodsInfoService {

	@Autowired
	private GoodsInfoMapper giMapper;
	
	public List<GoodsInfoVO> selectGoodsList(GoodsInfoVO goods){
		return giMapper.selectGoodsList(goods);
	}
	
	public GoodsInfoVO selectGoods(int giNum) {
		return giMapper.selectGoods(giNum);
	}

	public int insertGoods(GoodsInfoVO goods) {
		return giMapper.insertGoods(goods);
	}
	public int updateGoods(GoodsInfoVO goods) {
		return giMapper.updateGoods(goods);
	}
	public int deleteGoods(int giNum) {
		return giMapper.deleteGoods(giNum);
	}
}
