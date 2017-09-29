package com.situ.mall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.situ.mall.dao.CartDao;
import com.situ.mall.pojo.Cart;
import com.situ.mall.service.ICartService;

@Service("cartService")
public class CartServiceImpl implements ICartService {

	@Resource(name="cartDao")
	private CartDao cartDao;

	@Override
	public List<Cart> getList() {
		return cartDao.getList();
	}
}
