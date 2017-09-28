package com.situ.mall.conversion;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.fasterxml.jackson.databind.util.Converter;

public class DateConveter implements Converter<String, Date> {
    public Date convert(String source) {
       try {
           if(null != source){//2017-07-14
               DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
               return df.parse(source);
           }
       } catch (Exception e) {
           e.toString();
       }
       return null;
    }

	@Override
	public JavaType getOutputType(TypeFactory arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public JavaType getInputType(TypeFactory arg0) {
		// TODO Auto-generated method stub
		return null;
	}
}

