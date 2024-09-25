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

import com.test.spboot.service.CarInfoService;
import com.test.spboot.vo.CarInfoVO;
import com.test.spboot.vo.ResultList;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class CarInfoController {
	// /cars
	
	/* GET : 복수, 단수 조회
	 * POST : 단수 추가
	 * PUT : 단수 수정
	 * DELETE : 단수 삭제
	 */
	@Autowired
	private CarInfoService ciService;
	
	@GetMapping("/cars")
	public ResultList<CarInfoVO> getCars(CarInfoVO carInfo){
		
		return ciService.selectCars(carInfo);
	}
	@GetMapping("/cars/{ciNum}")
	public CarInfoVO getCar(@PathVariable("ciNum")int ciNum) {
		log.info("ciNum=>{}", ciNum);
		return ciService.selectCar(ciNum);
	}

	@PostMapping("/cars")
	public int insertCar(@RequestBody CarInfoVO  carInfo) {
		log.info("carInfo=>{}", carInfo);
		return ciService.insertCar(carInfo);
	}

	@PutMapping("/cars")
	public int updateCar(@RequestBody CarInfoVO  carInfo) {
		return ciService.updateCar(carInfo);
	}
	
	@DeleteMapping("/cars/{ciNum}")
	public int removeCar(@PathVariable int ciNum) {
		return ciService.deleteCar(ciNum);
	}
}
