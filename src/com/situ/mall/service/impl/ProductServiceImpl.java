package com.situ.mall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.situ.mall.dao.ProductDao;
import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.IProductService;

@Service("productService")
public class ProductServiceImpl implements IProductService {

	@Resource(name="productDao")
	private ProductDao productDao;
	
	@Override
	public List<Product> findAll() {
		return productDao.findAll();
	}

	@Override
	public boolean add(Product product) {
		int rowCount = productDao.add(product);
		return rowCount > 0 ? true : false;
	}

	@Override
	public List<Category> findCategory() {
		return productDao.findCategory();
	}

	@Override
	public List<Category> findOneCategory() {
		return productDao.findOneCategory();
	}

	@Override
	public List<Category> findTwo(int oneId) {
		return productDao.findTwo(oneId);
	}

	@Override
	public List<Product> searchProduct(Product product) {
		return productDao.searchProduct(product);
	}


}
