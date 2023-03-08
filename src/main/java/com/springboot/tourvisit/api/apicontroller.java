package com.springboot.tourvisit.api;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.springboot.tourvisit.api.ApiVO;
import com.springboot.tourvisit.impl.ArticleService;

import lombok.RequiredArgsConstructor;

import com.springboot.tourvisit.api.ApiService;

@RequiredArgsConstructor
@Controller
public class apicontroller{
	@RequestMapping("apitest.do")
	public String apitest(){
		return "apitest/apitest";
	}
		
	
	@RequestMapping("api.do")
public void callDetail(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception{
			
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
    
		final ApiService apiService = null;
		
   
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
        System.out.println("문자열 JSON :" + s);
        
        
        
        JSONParser parser = new JSONParser();
      
        
        Object obj = parser.parse(s);
        System.out.println("Object 변환 JSON " + obj.toString()); // JSON 전체
        JSONObject jsonbody = (JSONObject)obj; //json object 로 변경
       JSONObject jsonbody2 = (JSONObject) jsonbody.get("response");
       JSONObject jsonbody3 = (JSONObject) jsonbody2.get("body");
       JSONObject jsonbody4 = (JSONObject) jsonbody3.get("items");
      // JSONObject jsonbody5 = (JSONObject) jsonbody4.get("item"); //실패,jsonArray 로 받기 시도
       
       JSONArray jsonArrayitem = new JSONArray();
       jsonArrayitem = (JSONArray) jsonbody4.get("item");
       System.out.println("item Array 확인 " + jsonArrayitem);
      // jsonArrayitem.put("item",jsonbody5);
       // System.out.println("Body만 나오는지 확인 " +jsonbody3); // body 안에 pageNo,totalCount,items
      // System.out.println("items만 나오는지 확인 " +jsonbody4); // items 출력 확인
      //  System.out.println("item만 나오는지 확인 " +jsonbody5); // item은 출력 안됨
        
      
     
        
       
        if(jsonArrayitem.size() > 0) {
        	for(int i=0; i<jsonArrayitem.size();i++) {
        		JSONObject jsonObj = (JSONObject) jsonArrayitem.get(i);
        		ApiVO vo = null;
        	
        		
        		//long readcount = (long)jsonObj.get("readcount");
        		String contentid = (String)jsonObj.get("contentid");
        		vo.setContentid(contentid); 
        		String booktour = (String)jsonObj.get("booktour");
        		vo.setContentid(contentid); 
        		String createdtime = (String)jsonObj.get("createdtime");
        		vo.setContentid(contentid); 
        		String homepage = (String)jsonObj.get("homepage");
        		vo.setContentid(contentid); 
        		String modifiedtime = (String)jsonObj.get("modifiedtime");
        		vo.setContentid(contentid); 
        		String tel = (String)jsonObj.get("tel");
        		vo.setContentid(contentid); 
        		String telname = (String)jsonObj.get("telname");
        		vo.setContentid(contentid); 
        		String title = (String)jsonObj.get("title");
        		vo.setContentid(contentid); 
        		String firstimage = (String)jsonObj.get("firstimage");
        		vo.setContentid(contentid); 
        		String firstimage2 = (String)jsonObj.get("firstimage2");
        		vo.setContentid(contentid); 
        		String areacode = (String)jsonObj.get("areacode");
        		vo.setContentid(contentid); 
        		String sigungucode = (String)jsonObj.get("sigungucode");
        		vo.setContentid(contentid); 
        		String cat1 = (String)jsonObj.get("cat1");
        		vo.setContentid(contentid); 
        		String cat2 = (String)jsonObj.get("cat2");
        		vo.setContentid(contentid); 
        		String cat3 = (String)jsonObj.get("cat3");
        		vo.setContentid(contentid); 
        		String addr1 = (String)jsonObj.get("addr1");
        		vo.setContentid(contentid); 
        		String addr2 = (String)jsonObj.get("addr2");
        		vo.setContentid(contentid); 
        		String zipcode = (String)jsonObj.get("zipcode");
        		vo.setContentid(contentid); 
        		String mapx = (String)jsonObj.get("mapx");
        		vo.setContentid(contentid); 
        		String mapy = (String)jsonObj.get("mapy");
        		vo.setContentid(contentid); 
        		String mlevel = (String)jsonObj.get("mlevel");
        		vo.setContentid(contentid); 
        		String overview = (String)jsonObj.get("overview");
        		vo.setContentid(contentid); 
        		
        		
        		
        		apiService.insert(vo);
        	/*	System.out.println((long)jsonObj.get("readcount"));
        		System.out.println((String)jsonObj.get("booktour"));
        		System.out.println((String)jsonObj.get("createdtime"));
        		System.out.println((String)jsonObj.get("homepage"));
        		System.out.println((String)jsonObj.get("modifiedtime"));
        		System.out.println((String)jsonObj.get("tel"));
        		System.out.println((String)jsonObj.get("telname"));
        		System.out.println((String)jsonObj.get("title"));
        		System.out.println((String)jsonObj.get("firstimage"));
        		System.out.println((String)jsonObj.get("firstimage2"));
        		System.out.println((String)jsonObj.get("areacode"));
        		System.out.println((String)jsonObj.get("sigungucode"));
        		System.out.println((String)jsonObj.get("cat1"));
        		System.out.println((String)jsonObj.get("cat2"));
        		System.out.println((String)jsonObj.get("cat3"));
        		System.out.println((String)jsonObj.get("addr1"));
        		System.out.println((String)jsonObj.get("addr2"));
        		System.out.println((String)jsonObj.get("zipcode"));
        		System.out.println((String)jsonObj.get("mapx"));
        		System.out.println((String)jsonObj.get("mapy"));
        		System.out.println((String)jsonObj.get("mlevel"));
        		System.out.println((String)jsonObj.get("overview"));
        		System.out.println((String)jsonObj.get("contentid")); */
        	}
        }
        
       
       
}
}