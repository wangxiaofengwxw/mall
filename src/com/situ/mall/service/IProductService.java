package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;

public interface IProductService {

	List<Product> findAll();

	boolean add(Product product);

	List<Category> findCategory();

	List<Category> findOneCategory();

	List<Category> findTwo(int oneId);

	List<Product> searchProduct(Product product);

}
