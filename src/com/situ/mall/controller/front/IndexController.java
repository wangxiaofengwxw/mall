package com.situ.mall.controller.front;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.situ.mall.pojo.Cart;
import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Order;
import com.situ.mall.pojo.Product;
import com.situ.mall.pojo.ProductTotal;
import com.situ.mall.pojo.Shipping;
import com.situ.mall.pojo.User;
import com.situ.mall.service.IIndexService;
import com.situ.mall.util.SwitchingTime;
import com.sun.org.apache.regexp.internal.recompile;
import com.sun.org.glassfish.gmbal.ManagedAttribute;

@Controller
@RequestMapping(value="/index")
public class IndexController {

	@Resource(name="indexService")
	private IIndexService indexService;
	
	@RequestMapping(value="/toIndex")
	public ModelAndView toIndex() {
		List<Category>list1  = indexService.findCategory();
		List<Category>list2  = indexService.findCategory();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list1", list1);
		modelAndView.addObject("list2", list2);
		modelAndView.setViewName("index");
		return modelAndView;
	}
	
	@RequestMapping(value="/toLogin")
	public String toLogin() {
		return "login";
	}
	
	@RequestMapping(value="/login")
	public ModelAndView login(User user,HttpServletRequest req) {
		User isUser = indexService.findUser(user);
		ModelAndView modelAndView = new ModelAndView();
		if(isUser == null) {
			modelAndView.setViewName("login");
			return modelAndView;
		}
		modelAndView.addObject("isUser", isUser);
		modelAndView.setViewName("index");
		ServletContext servletContext = req.getServletContext();
		servletContext.setAttribute("isUser", isUser);
		return modelAndView;
	}
	
	@RequestMapping(value="/toDetail")
	public ModelAndView toDetail(Integer id) {
		System.err.println("---------------------------------------------------"+id);
		Product product = indexService.findById(id);
		String subImages = product.getSub_images();
		String[] arraySub = subImages.split("\\,");
		for (String string : arraySub) {
			System.out.println(string);
		}
		ModelAndView modelAndView = new ModelAndView();
		//System.out.println(product);
		modelAndView.addObject("product", product);
		modelAndView.addObject("arraySub", arraySub);
		modelAndView.setViewName("detail");
		return modelAndView;
	}
	
	@RequestMapping(value="/list")
	public ModelAndView searchProduct(String name) {
		List<Product>list = indexService.searchProduct(name);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", list);
		modelAndView.setViewName("list");
		return modelAndView;
	}
	
	@RequestMapping(value="/Cart")
	public ModelAndView toCart(HttpServletRequest req) {
		ServletContext servletContext = req.getServletContext();
		User user =  (User) servletContext.getAttribute("isUser");
		int id = user.getId();
		List<Cart>list = indexService.findCart(id);
		double price = 0.0;
		for (Cart cartList : list) {
			BigDecimal j = cartList.getProduct().getPrice();
			double p = j.doubleValue();
			double i = p *  cartList.getQuantity();
			price += i;
		}
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", list);
		modelAndView.addObject("price", price);
		modelAndView.setViewName("cart");
		return modelAndView;
	}
	
	@RequestMapping(value="/toCart")
	public ModelAndView toCart(Cart cart,HttpServletRequest req) {
		boolean isAdd = indexService.addCart(cart);
		ServletContext servletContext = req.getServletContext();
		User user =  (User) servletContext.getAttribute("isUser");
		int id = user.getId();
		List<Cart>list = indexService.findCart(id);
		double price = 0.0;
		for (Cart cartList : list) {
			BigDecimal j = cartList.getProduct().getPrice();
			double p = j.doubleValue();
			double i = p *  cartList.getQuantity();
			price += i;
		}
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", list);
		modelAndView.addObject("price", price);
		modelAndView.setViewName("cart");
		return modelAndView;
	}
	
	 @RequestMapping(value="/total")
	    public @ResponseBody String requestJson(@RequestBody ProductTotal productTotal) {
		 System.out.println("-----------------"+productTotal);
		 int id = Integer.parseInt(productTotal.getAid()) ;
		 double price = Double.parseDouble(productTotal.getAprice());
		 int total = (int) (id * price);
		 String str = Integer.toString(total);
		 return str;
	    }

	 @RequestMapping(value="/toPayment")
	 public ModelAndView toPayment(double tatolPrice,Integer userId) {
		 List<Shipping>list = indexService.findShipping(userId);
		 /*for (Shipping shipping : list) {
			 System.out.println(shipping);
		}*/
		 ModelAndView modelAndView = new ModelAndView();
		 modelAndView.addObject("list", list);
		 modelAndView.addObject("tatolPrice", tatolPrice);
		 modelAndView.setViewName("payment");
		 return modelAndView;
	 }
	 
	 @RequestMapping(value="/toOrder")
	 public ModelAndView toOrder() {
		 System.out.println("+++++++++++++++++++++++++++");
		 int id = 22;
		 List<Order>list = indexService.findOrder(id);
		 for (Order order : list) {
			System.out.println(order);
		}
		 ModelAndView modelAndView = new ModelAndView();
		 modelAndView.addObject("list", list);
		 modelAndView.setViewName("order");
		 return modelAndView;
	 }
	 
}
