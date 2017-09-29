package com.situ.mall.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.situ.mall.dao.OrderDao;
import com.situ.mall.service.IOrderService;

@Service("orderService")
public class OrderServiceImpl implements IOrderService {

	@Resource(name="orderDao")
	private OrderDao orderDao;
	
	
}
