package com.situ.mall.dao;

import java.util.List;

import com.situ.mall.pojo.Cart;
import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Order;
import com.situ.mall.pojo.Product;
import com.situ.mall.pojo.Shipping;
import com.situ.mall.pojo.User;

public interface IndexDao {

	Product findById(Integer id);

	User findUser(User user);

	List<Category> findCategory();

	List<Product> searchProduct(String name);

	List<Cart> findCart();

	List<Cart> getList(int id);

	int addCart(Cart cart);

	List<Shipping> findShipping(Integer userId);

	List<Order> findOrder(int id);

}
