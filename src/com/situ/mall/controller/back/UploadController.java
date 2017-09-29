package com.situ.mall.controller.back;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.situ.mall.constant.MallConstant;
import com.situ.mall.util.QiniuUploadUtil;

@Controller
@RequestMapping("/upload")
public class UploadController {
	
	@RequestMapping(value="/uploadPic")
	@ResponseBody
	public Map<String, Object> uploadPic(MultipartFile pictureFile) {
		//���ص����������
		return upload(pictureFile);
		
		//�ϴ�����ţ
		//return uploadByQiniu(pictureFile);
	}

	private Map<String, Object> upload(MultipartFile pictureFile) {
		//Ϊ�˷�ֹ��������һ�����������:aa4fb86a7896458a8c5b34c634011ae3
		String name = UUID.randomUUID().toString().replace("-", "");
		//jpg,png
		String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
		String fileName = name + "." + ext;
		String filePath = "E:\\pic\\" + fileName;
		try {
			pictureFile.transferTo(new File(filePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fileName", fileName);
		map.put("filePath", MallConstant.SERVER_ADDRES + fileName);
		return map;
	}

	private Map<String, Object> uploadByQiniu(MultipartFile pictureFile) {
		String fileName = "";
		try {
			fileName = QiniuUploadUtil.upload(pictureFile.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fileName", fileName);
		map.put("filePath", MallConstant.SERVER_ADDRES + fileName);
		return map;
	}
	
	public static void main(String[] args) {
		String name = UUID.randomUUID().toString().replace("-", "");
		System.out.println(name);
	}
	
}
