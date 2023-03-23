package com.springboot.tourvisit.pay;

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
import com.springboot.tourvisit.cart.cartVO;
import com.springboot.tourvisit.cart.tourpayendVO;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class payController {

	@Autowired
	final TourpayService tourpayservice;
	
	
	
	@RequestMapping(value="tourpaylist.do")
	public String tourpaylist(@ModelAttribute("ApiVO")ApiVO vo,@RequestParam(value = "memberid", defaultValue = "") String memberid, HttpServletRequest request, HttpSession session, Model model) throws Exception{
		
		List<paylistDTO> paylist = tourpayservice.tourplayselect(memberid);
			
		model.addAttribute("paylist", paylist);
			//model.addAttribute("tourlist", tourlist);
		
		
		return "tour/tourpay";
	}
	
	@RequestMapping(value="tourpayimportinsert.do")
	public String tourpayiminsert(@ModelAttribute("paymentInfo")tourpayendVO vo, HttpServletRequest request, HttpSession session, Model model) throws Exception{
		
		System.out.println(vo.toString());
			//model.addAttribute("tourlist", tourlist);
		
		
		return "tour/tourpay";
	}
	
	
	
}