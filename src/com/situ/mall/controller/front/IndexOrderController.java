package com.situ.mall.controller.front;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.situ.mall.constant.MallConstant;
import com.situ.mall.pojo.Order;
import com.situ.mall.pojo.OrderItem;
import com.situ.mall.pojo.Product;
import com.situ.mall.pojo.Shipping;
import com.situ.mall.pojo.User;
import com.situ.mall.service.IIndexService;
import com.situ.mall.vo.BuyCartVO;
import com.situ.mall.vo.CartItemVO;

@Controller
@RequestMapping("/order")
public class IndexOrderController {

	
@Resource(name="indexService")
	private IIndexService indexService;

    @RequestMapping("/toPayment")
	public ModelAndView toPayment(Integer userId,HttpServletRequest request) {
    	List<Shipping>list = indexService.findShipping(userId);
    	BuyCartVO buyCartVO = getBuyCartVO(request);
		List<CartItemVO> items = buyCartVO.getItems();
		for (CartItemVO item : items) {
			Product product = indexService.findById(item.getProduct().getId());
			item.setProduct(product);
		}
    	ModelAndView modelAndView = new ModelAndView();
    	modelAndView.addObject("buyCartVO", buyCartVO);
    	modelAndView.addObject("list", list);
    	modelAndView.setViewName("payment");
		return modelAndView;
	}
    
    @RequestMapping("/addOrder")
    public String addOrder(HttpServletRequest request,HttpServletResponse response,Integer userId,
    	Integer shippingId,Integer payment_type,BigDecimal postage) {
    	System.out.println("++++++++++++++");
    	System.out.println(userId);
    	System.out.println(shippingId);
    	System.out.println(payment_type);
    	System.out.println(postage);
    	long num = new Date().getTime();
    	System.err.println(num);
    	HttpSession session = request.getSession();
    	User user = (User) session.getAttribute("isUser");
    	
    	//生成订单号，把数据先存到order——itme
    	//1.取出cookie
    	BuyCartVO buyCartVO = getBuyCartVO(request);
		List<CartItemVO> items = buyCartVO.getItems();
	       for (CartItemVO item : items) {
	           Product product = indexService.findById(item.getProduct().getId());
	           item.setProduct(product);
	       }

	       OrderItem orderItem = new OrderItem();
		for (CartItemVO cartItemVO : items) {
			orderItem.setUser(user);
			orderItem.setOrder_no(num);
			orderItem.setProduct_id(cartItemVO.getProduct().getId());
			orderItem.setProduct_name(cartItemVO.getProduct().getName());
			orderItem.setProduct_image(cartItemVO.getProduct().getSub_images());
			orderItem.setCurrent_unit_price(cartItemVO.getProduct().getPrice());
			orderItem.setQuantity(cartItemVO.getAmount());
			//BigDecimal e = a.multiply(b);// 乘
			//int转BigDecimal：BigDecimal bigDecimal = new BigDecimal(int val);
			BigDecimal am = new BigDecimal(cartItemVO.getAmount());
			BigDecimal i = cartItemVO.getProduct().getPrice().multiply(am); 
			orderItem.setTotal_price(i);
			indexService.addOrderItem(orderItem);
		}
    	
    	//再把数据存到order
		Order order = new Order();
		OrderItem orderItem2 = new OrderItem();
		Shipping shipping = new Shipping();
		orderItem2.setOrder_no(num);
		order.setOrderItem(orderItem2);
		order.setUser(user);
		shipping.setId(shippingId);
		order.setShipping(shipping);
		//double转BigDecimal： BigDecimal bd2 = BigDecimal.valueOf(d);//（2）
		BigDecimal big = BigDecimal.valueOf(buyCartVO.getTotalPrice());
		order.setPayment(big);
		order.setPayment_type(payment_type);
		order.setPostage(postage);
		order.setStatus(10);
		indexService.addOrder(order);
		
    	//清除cookie数据
		Cookie cookie = new Cookie(MallConstant.BUY_CART_COOKIE,null);
	    cookie.setPath("/");
	    cookie.setMaxAge(0);
	    response.addCookie(cookie);

	    //跳转
	    return "redirect:/order/toOrderList.shtml";
    }

	private BuyCartVO getBuyCartVO(HttpServletRequest request) {
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		BuyCartVO buyCartVO = null;//这不是new一个对象，只是声明一个变量
		Cookie[] cookies = request.getCookies();
		if (null != cookies && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				if ("buy_cart_cookie".equals(cookie.getName())) {
					String value = cookie.getValue();
					try {
						buyCartVO = objectMapper.readValue(value, BuyCartVO.class);//把json格式转换为java对象
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return buyCartVO;
	}

	@RequestMapping("/toOrderList")
	public ModelAndView toOrderList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("isUser");
		Integer userId = user.getId();
    	//取出order，发送到JSP页面
   	 List<OrderItem>list = indexService.findOrder(userId);
   	ModelAndView modelAndView = new ModelAndView();
   	modelAndView.addObject("list", list);
   	modelAndView.setViewName("order");
   	return modelAndView;

	}
	
	
}
