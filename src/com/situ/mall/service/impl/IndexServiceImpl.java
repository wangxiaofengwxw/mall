package com.situ.mall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.situ.mall.dao.CartDao;
import com.situ.mall.dao.IndexDao;
import com.situ.mall.pojo.Cart;
import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Order;
import com.situ.mall.pojo.OrderItem;
import com.situ.mall.pojo.Product;
import com.situ.mall.pojo.Shipping;
import com.situ.mall.pojo.User;
import com.situ.mall.service.IIndexService;

@Service("indexService")
public class IndexServiceImpl implements IIndexService {

	@Resource(name="indexDao")
	private IndexDao indexDao;
	
	@Override
	public Product findById(Integer id) {
		return indexDao.findById(id);
	}

	@Override
	public User findUser(User user) {
		return indexDao.findUser(user);
	}

	@Override
	public List<Category> findCategory() {
		return indexDao.findCategory();
	}

	@Override
	public List<Product> searchProduct(Product pro) {
		return indexDao.searchProduct(pro);
	}

	@Override
	public List<Cart> findCart(int id) {
		return indexDao.getList(id);
	}

	@Override
	public boolean addCart(Cart cart) {
		int row = indexDao.addCart(cart);
		if (row > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<Shipping> findShipping(Integer userId) {
		return indexDao.findShipping(userId);
	}

	@Override
	public List<OrderItem> findOrder(int id) {
		return indexDao.findOrder(id);
	}

	@Override
	public void addOrderItem(OrderItem orderItem) {
		indexDao.addOrderItem(orderItem);
	}

	@Override
	public void addOrder(Order order) {
		indexDao.addOrder(order);
	}
}
