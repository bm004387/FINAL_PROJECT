package com.springboot.tourvisit.api;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.json.simple.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import jdk.nashorn.internal.parser.JSONParser;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
public class apicontroller{
	@RequestMapping("apitest.do")
	public String apitest(){
		return "apitest/apitest";
	}
		
	
	@RequestMapping("api.do")
public void callDetail(HttpServletRequest request, HttpServletResponse response) throws IOException{
			
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
    
		
   
         String BASE_URL = "https://apis.data.go.kr/B551011/KorService/";
         String apiUri = "areaBasedList";
         String serviceKey = "?serviceKey=Lte9EaFEKl77Nf7DNWMbLTbLKPzbziOIHqfdh9EfekbiV9YBUQBtp9HchlcWxDH7IJ0YFxO7TQWh5VKTnmCi%2BQ%3D%3D";
         String defaultQueryParam = "&MobileOS=ETC&MobileApp=AppTest&_type=json";
         String numOfRows = "&numOfRows=10";
         String pageNo = "&pageNo=1";
         String listYN = "&listYN=Y";
         String arrange = "&arrange=C";
        
        String addr ="";
        addr += BASE_URL;
        addr += apiUri;
        addr += serviceKey;
        addr += defaultQueryParam;
        addr += numOfRows;
        addr += pageNo;
        addr += listYN;
        addr += arrange;
        
        URL url = new URL(addr);
        
        System.out.println(addr);
        
        InputStream in = url.openStream();
        
        ByteArrayOutputStream bos1 = new ByteArrayOutputStream();
        IOUtils.copy(in,bos1);
        in.close();
        bos1.close();
        
        String mbos = bos1.toString("UTF-8");
        byte[] b = mbos.getBytes("UTF-8");
        String s = new String(b, "UTF-8");
        System.out.println(s);
        
        
        
       
       
}
}