package com.situ.mall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.situ.mall.common.ServerResponse;
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
	public ServerResponse add(Product product) {
		try {
			int rowCount = productDao.add(product);
			if (rowCount > 0) {
				return ServerResponse.createSuccess("添加商品成功");
			} else {
				return ServerResponse.createError("添加商品失败");
			}
		} catch (Exception e) {
			return ServerResponse.createError("添加商品失败");
		}
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

	@Override
	public Product findById(Integer id) {
		return productDao.findById(id);
	}


}
