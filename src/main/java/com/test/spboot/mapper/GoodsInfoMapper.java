package com.test.spboot.mapper;

import java.util.List;

import com.test.spboot.vo.GoodsInfoVO;

public interface GoodsInfoMapper {
	public List<GoodsInfoVO> selectGoodsList(GoodsInfoVO goods);
	public GoodsInfoVO selectGoods(int giNum);
	public int insertGoods(GoodsInfoVO goods);
	public int updateGoods(GoodsInfoVO goods);
	public int deleteGoods(int giNum);
}
