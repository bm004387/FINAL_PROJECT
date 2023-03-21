package com.springboot.tourvisit.cart;

import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import com.springboot.tourvisit.api.ApiService;
import com.springboot.tourvisit.api.ApiVO;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class CartController {

	@Autowired
	final TourcartService tourcartservice;
	
	@RequestMapping(value="tourcartinsert.do")
	public String tourcartinsert(@ModelAttribute("ApiVO")ApiVO vo,@RequestParam(value = "contentid", defaultValue = "") String contentid,@RequestParam(value = "memberid", defaultValue = "") String memberid, HttpServletRequest request, HttpSession session, Model model) throws Exception{
		
		if(contentid!=null) {
			System.out.println("여행상품 확인"+contentid);
			System.out.println("사용자 확인"+memberid);
			List<cartVO> cartList = tourcartservice.tourcartinsert(contentid,memberid,"1000");
		}else {
			System.out.println("NULL 값 입니다");
		}
			
			//model.addAttribute("tourlist", tourlist);
		
		
		return "tour/tourListR";
	}
	
	@RequestMapping(value="tourcartlist.do")
	public String tourcartlist(@ModelAttribute("ApiVO")ApiVO vo,@RequestParam(value = "memberid", defaultValue = "") String memberid, HttpServletRequest request, HttpSession session, Model model) throws Exception{
		
		List<cartDTO> cartlist = tourcartservice.tourcartselect(memberid);
			
		model.addAttribute("cartlist", cartlist);
			//model.addAttribute("tourlist", tourlist);
		
		
		return "tour/tourcart";
	}
	@RequestMapping(value="tourcartpay.do")
	public String tourcartpay(@RequestParam(value = "memberid", defaultValue = "") String memberid, HttpServletRequest request, HttpSession session, Model model) throws Exception{
		
		List<cartDTO> cartlist = tourcartservice.tourpayinsert(memberid);
			
		//model.addAttribute("cartlist", cartlist);
			//model.addAttribute("tourlist", tourlist);
		
		
		return null;
	}
	
}