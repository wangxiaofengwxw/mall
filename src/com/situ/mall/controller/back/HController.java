package com.situ.mall.controller.back;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.service.IProductService;

@Controller
@RequestMapping(value="/Hproduct")
public class HController {

	@Resource(name = "productService")
	private IProductService productService;
	
	@RequestMapping(value="/toH")
	public String toH() {
		return "index";
	}
	
	
}
