package com.situ.mall.controller.back;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.IProductService;
import com.situ.mall.util.SwitchingTime;

@Controller
@RequestMapping(value="/product")
public class ProductController {

	@Resource(name = "productService")
	private IProductService productService;

	@RequestMapping(value = "/list")
	public String list(Model model) {
		List<Product> list = productService.findAll();
		model.addAttribute("list", list);
		return "product_list";
	}

	@RequestMapping(value = "/findTwo")
	@ResponseBody
	public List<Category> findTwo(int oneId) {
		return productService.findTwo(oneId);
	}

	@RequestMapping(value = "/toAdd")
	public ModelAndView toAdd() {
		List<Category> oneList = productService.findOneCategory();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("oneList", oneList);
		modelAndView.setViewName("product_add");
		return modelAndView;
	}

	/*@RequestMapping(value = "/uploadPic")
	@ResponseBody
	public Map<String, Object> uploadPic(MultipartFile pictureFile) {
		// 为了防止重名生成随机的名字
		String name = UUID.randomUUID().toString().replace("-", "");
		// jpg,png
		String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
		String fileName = name + "." + ext;// 数据库里面
		String filePath = "E:\\pic\\" + fileName;
		try {
			pictureFile.transferTo(new File(filePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fileName", fileName);
		return map;
	}*/

	@RequestMapping(value = "/add")
	public String add(Product product, String createTime, String updateTime,Model model) {
		product.setCreate_time(SwitchingTime.toSwitchingTime(createTime));
		product.setUpdate_time(SwitchingTime.toSwitchingTime(updateTime));
		System.out.println("------------------------------------------" + product);
		boolean isSuccess = productService.add(product);
		return "redirect:/product/list.action";
	}
	
	@RequestMapping(value="/toSearchProduct")
	public ModelAndView toSearchProduct() {
		ModelAndView modelAndView = new ModelAndView();
		List<Category> oneList = productService.findOneCategory();
		modelAndView.addObject("oneList", oneList);
		modelAndView.setViewName("product_search");
		return modelAndView;
	}
	
	@RequestMapping(value="searchProduct")
	public ModelAndView searchProduct(Product product, String createTime, String updateTime) {
		product.setCreate_time(SwitchingTime.toSwitchingTime(createTime));
		product.setUpdate_time(SwitchingTime.toSwitchingTime(updateTime));
		List<Product>list = productService.searchProduct(product);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", list);
		modelAndView.setViewName("product_list");
		return modelAndView;
	}
	
	@RequestMapping(value="toCategoryList")
	public ModelAndView toCategoryList() {
		ModelAndView modelAndView = new ModelAndView();
		List<Category> oneList = productService.findOneCategory();
		modelAndView.addObject("oneList", oneList);
		modelAndView.setViewName("product_category");
		return modelAndView;
	}
	
}
