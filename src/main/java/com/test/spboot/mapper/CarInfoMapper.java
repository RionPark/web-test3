package com.test.spboot.mapper;

import java.util.List;

import com.test.spboot.vo.CarInfoVO;

public interface CarInfoMapper {
	public int selectCarTotal(CarInfoVO carInfo);
	public List<CarInfoVO> selectCars(CarInfoVO carInfo);
	public CarInfoVO selectCar(int ciNum);
	public int insertCar(CarInfoVO carInfo);
	public int updateCar(CarInfoVO carInfo);
	public int deleteCar(int ciNum);
}
