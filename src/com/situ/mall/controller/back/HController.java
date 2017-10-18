package com.situ.mall.controller.back;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.situ.mall.common.ServerResponse;
import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.IProductService;
import com.situ.mall.util.SwitchingTime;

@Controller
@RequestMapping(value="/Hproduct")
public class HController {

	@Resource(name = "productService")
	private IProductService productService;
	
	@RequestMapping(value="/toH")
	public String toH() {
		return "index";
	}
	
	@RequestMapping(value = "/list")
	public String list(Model model) {
		List<Product> list = productService.findAll();
		model.addAttribute("list", list);
		return "h_product_list";
	}
	
	@RequestMapping(value = "/toAdd")
	public ModelAndView toAdd() {
		List<Category> oneList = productService.findOneCategory();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("oneList", oneList);
		modelAndView.setViewName("h_product_add");
		return modelAndView;
	}
	
	@RequestMapping(value = "/add")
	@ResponseBody
	public ServerResponse  add(Product product, String createTime, String updateTime,Model model) {
		System.out.println(createTime);
		System.out.println(updateTime);
		product.setCreate_time(SwitchingTime.toSwitchingTime(createTime));
		product.setUpdate_time(SwitchingTime.toSwitchingTime(updateTime));
		return productService.add(product);
	}
	
	@RequestMapping(value="toCategoryList")
	public ModelAndView toCategoryList() {
		ModelAndView modelAndView = new ModelAndView();
		List<Category> oneList = productService.findOneCategory();
		modelAndView.addObject("oneList", oneList);
		modelAndView.setViewName("h_product_category");
		return modelAndView;
	}
	
	@RequestMapping(value="/toSearchProduct")
	public ModelAndView toSearchProduct() {
		ModelAndView modelAndView = new ModelAndView();
		List<Category> oneList = productService.findOneCategory();
		modelAndView.addObject("oneList", oneList);
		modelAndView.setViewName("h_product_search");
		return modelAndView;
	}
	
	@RequestMapping(value="searchProduct")
	public ModelAndView searchProduct(Product product, String createTime, String updateTime) {
		product.setCreate_time(SwitchingTime.toSwitchingTime(createTime));
		product.setUpdate_time(SwitchingTime.toSwitchingTime(updateTime));
		List<Product>list = productService.searchProduct(product);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", list);
		modelAndView.setViewName("h_product_list");
		return modelAndView;
	}
}
