package com.situ.mall.controller.back;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.situ.mall.pojo.Cart;
import com.situ.mall.service.ICartService;

@Controller
@RequestMapping(value="/cart")
public class CartController {

	@Resource(name="cartService")
	private ICartService cartService;
	
	@RequestMapping(value="list")
	public ModelAndView getList() {
		List<Cart>list = cartService.getList();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", list);
		modelAndView.setViewName("cart_list");
		return modelAndView;
	}
	
}
