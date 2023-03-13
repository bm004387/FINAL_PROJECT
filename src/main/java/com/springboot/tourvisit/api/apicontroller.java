package com.springboot.tourvisit.api;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.hibernate.annotations.DynamicInsert;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.springboot.tourvisit.api.ApiVO;
import com.springboot.tourvisit.board.model.BoardVO;

import lombok.RequiredArgsConstructor;

import com.springboot.tourvisit.api.ApiService;


@RequiredArgsConstructor
@Controller
public class apicontroller{
	
	@Autowired
	final ApiService apiService;
	
	@RequestMapping(value="tourList.do")
	public String selecttourList(@ModelAttribute("ApiVO")ApiVO vo, HttpServletRequest request, HttpSession session, Model model) throws Exception{
		try {
			// 목록 조회
			System.out.println("apicontroller");
			List<ApiVO> tourlist = apiService.selectApiList();
		      System.out.println(tourlist);
			
			model.addAttribute("tourlist", tourlist);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "tour/tourListR";
	}
	
	@RequestMapping(value="toursearch.do")
	public String selecttoursearchList(@ModelAttribute("ApiVO")ApiVO vo,@RequestParam(value = "keyword", defaultValue = "") String keyword, HttpServletRequest request, HttpSession session, Model model) throws Exception{
		
			System.out.println("검색값 확인"+keyword);
			List<ApiVO> tourlist = apiService.selectApisearchList(keyword);
		     
			
			model.addAttribute("tourlist", tourlist);
		
		
		return "tour/toursearch";
	}
	

	@RequestMapping("api.do")
public void callDetail(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception{
			
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		
		// 초기 데이타 입력을 위해서 TourAPI 를 받아 1000건을 DB 에 입력함
   /*
         String BASE_URL = "https://apis.data.go.kr/B551011/KorService/";
         String apiUri = "areaBasedList";
         String serviceKey = "?serviceKey=Lte9EaFEKl77Nf7DNWMbLTbLKPzbziOIHqfdh9EfekbiV9YBUQBtp9HchlcWxDH7IJ0YFxO7TQWh5VKTnmCi%2BQ%3D%3D";
         String defaultQueryParam = "&MobileOS=ETC&MobileApp=AppTest&_type=json";
         String numOfRows = "&numOfRows=1000";
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
        		ApiVO vo = new ApiVO();
        	
        		
        		//long readcount = (long)jsonObj.get("readcount");
        		
        		
        		String contentid = "";
        		contentid = (String)jsonObj.get("contentid");
        		if(contentid != null && !contentid.equals(""))
        		{vo.setContentid(contentid); }else {contentid = "NOID";}
        		
        		
        		String booktour =""; 
        		booktour = (String)jsonObj.get("booktour");
        		if(booktour != null && !booktour.equals(""))
        		{vo.setBooktour(booktour);} else{booktour = "NOHOME";}
        		
        		String createdtime = "";
        		createdtime = (String)jsonObj.get("createdtime");
        		if(createdtime != null && !createdtime.equals(""))
        		{vo.setCreatedtime(createdtime);} else{createdtime = "NOTIME";}
        		
        		String homepage = "";
        		homepage = (String)jsonObj.get("homepage");
        		if(homepage != null && !homepage.equals(""))
        		{vo.setHomepage(homepage);} else{homepage = "NOHOME";}
        		 
        		
        		String modifiedtime = "";
        		modifiedtime = (String)jsonObj.get("modifiedtime");
        		if(modifiedtime != null && !modifiedtime.equals(""))
        		{vo.setModifiedtime(modifiedtime);} else{modifiedtime = "NOMODITIME";}
        		
        		String tel = "";
        		tel = (String)jsonObj.get("tel");
        		if(tel != null && !tel.equals(""))
        		{vo.setTel(tel);} else{tel = "NOTEL";}
        		
        		String telname = "";
        		telname = (String)jsonObj.get("telname");
        		if(telname != null && !telname.equals(""))
        		{vo.setTelname(telname);} else{telname = "NOTELNAME";}
        		
        		String title = "";
        		title =	(String)jsonObj.get("title");
        		if(title != null && !title.equals(""))
        		{vo.setTitle(title);} else{title = "NOTITLE";}
        		
        		String firstimage = "";
        		firstimage = (String)jsonObj.get("firstimage");
        		if(firstimage != null && !firstimage.equals(""))
        		{vo.setFirstimage(firstimage);} else{firstimage = "NOIMAGE";}
        		
        		String firstimage2 = "";
        		firstimage2 = (String)jsonObj.get("firstimage2");
        		if(firstimage2 != null && !firstimage2.equals(""))
        		{vo.setFirstimage2(firstimage2);} else{firstimage2 = "NOIMAGE2";}
        		
        		String areacode = "";
        		areacode = (String)jsonObj.get("areacode");
        		if(areacode != null && !areacode.equals(""))
        		{vo.setAreacode(areacode);} else{areacode = "NOAREACODE";}
        		
        		String sigungucode = "";
        		sigungucode = (String)jsonObj.get("sigungucode");
        		if(sigungucode != null && !sigungucode.equals(""))
        		{vo.setSigungucode(sigungucode);} else{sigungucode = "NOSIGUNCODE";}
        		
        		String cat1 = "";
        		cat1 = (String)jsonObj.get("cat1");
        		if(cat1 != null && !cat1.equals(""))
        		{vo.setCat1(cat1);} else{cat1 = "NOCAT1";}
        		
        		String cat2 = "";
        		cat2 = (String)jsonObj.get("cat2");
        		if(cat2 != null && !cat2.equals(""))
        		{vo.setCat2(cat2);} else{cat2 = "NOCAT2";}
        		
        		String cat3 = "";
        		cat3 = (String)jsonObj.get("cat3");
        		if(cat3 != null && !cat3.equals(""))
        		{vo.setCat3(cat3);} else{cat3 = "NOCAT3";}
        		
        		
        		String addr1 = "";
        		addr1 = (String)jsonObj.get("addr1");
        		if(addr1 != null && !addr1.equals(""))
        		{vo.setAddr1(addr1);} else{addr1 = "NOAddr1";}
        		
        		
        		String addr2 = "";
        		addr2 = (String)jsonObj.get("addr2");
        		if(addr2 != null && !addr2.equals(""))
        		{vo.setAddr2(addr2);} else{addr2 = "NOAddr2";}
        		
        		String zipcode = "";
        		zipcode = (String)jsonObj.get("zipcode");
        		if(zipcode != null && !zipcode.equals(""))
        		{vo.setZipcode(zipcode);} else{zipcode = "NOZIPCODE";}
        		
        		String mapx = "";
        		mapx = (String)jsonObj.get("mapx");
        		if(mapx != null && !mapx.equals(""))
        		{vo.setMapx(mapx);} else{mapx = "NOMAPX";}
        		
        		String mapy = "";
        		mapy = (String)jsonObj.get("mapy");
        		if(mapy != null && !mapy.equals(""))
        		{vo.setMapy(mapy);} else{mapy = "NOMAPy";}
        		
        		String mlevel = "";
        		mlevel = (String)jsonObj.get("mlevel");
        		if(mlevel != null && !mlevel.equals(""))
        		{vo.setMlevel(mlevel);} else{mlevel = "NOmlevel";}
        		
        		 
        		String overview = "";
        		overview = (String)jsonObj.get("overview");
        		if(overview != null && !overview.equals(""))
        		{vo.setOverview(overview);} else{overview = "NOoverview";}
        		
        		String contenttypeid = "";
        		contenttypeid = (String)jsonObj.get("contenttypeid");
        		if(contenttypeid != null && !contenttypeid.equals(""))
        		{vo.setContenttypeid(contenttypeid);} else{contenttypeid = "NOcontenttypeid";}
        		
        		System.out.println(vo.toString());
        		
        		
        		
        		apiService.insert(vo);
        			
        	
        
				        	}
				        }
    */
		 
				        
				       
				       
				}
			
}