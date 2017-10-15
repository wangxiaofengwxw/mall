package com.situ.mall.dao;

import java.util.List;

import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;

public interface ProductDao {

	List<Product> findAll();

	int add(Product product);

	List<Category> findCategory();

	List<Category> findOneCategory();

	List<Category> findTwo(int oneId);

	List<Product> searchProduct(Product product);

	Product findById(Integer id);
}
