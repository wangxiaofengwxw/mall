package com.situ.mall.controller.back;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.situ.mall.service.IOrderService;

@Controller
@RequestMapping(value="/order")
public class OrderController {

	@Resource(name="orderService")
	private IOrderService orderService;
	
	@RequestMapping(value="/list")
	public ModelAndView getList() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("order_list");
		return modelAndView;
	}
	
}
