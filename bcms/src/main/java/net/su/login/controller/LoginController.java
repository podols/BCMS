package net.su.login.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.su.bcms.valueObject.NmeCardValueObject;
import net.su.login.service.MemService;
import net.su.login.valueObject.MemValueObject;
import net.su.login.valueObject.CompnValueObject;
import net.su.logger.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {

	@Resource
	private MemService memService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		System.out.println("HomeController의 Home.do 작동");
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate);
		
		return "redirect:/loginForm.do";
	}
	
	//로그인 화면
	@RequestMapping(value = "/loginForm.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String loginForm(HttpSession session) throws Exception {
		System.out.println("LoginController의 loginForm.do 작동");
		//session.setAttribute("memInfo", null);
		Logger.info(null);
		return "login/loginForm";
	}
	
	//로그인
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(MemValueObject memValueObject, HttpSession session, Model model) throws Exception {
		System.out.println("HomeController의 login.do 작동"+memValueObject.getMemId()+"::"+memValueObject.getMemPw());
		int confirm = memService.confirm(memValueObject);
		String jsp = "login/loginForm";
		if(confirm==1) {
			MemValueObject loginUser = memService.selectMemInfo(memValueObject);
			session.setAttribute("userLoginInfo", loginUser);
			jsp = "redirect:/nmeCardSelectForm.do";
		}
		else {
			model.addAttribute("errorMsg", "ID와 PW를 확인해 주세요.");
		}
		return jsp;
	}
	
	//로그아웃
	@RequestMapping(value = "/logout.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpSession session) throws Exception {
		System.out.println("LoginController의 loginForm.do 작동");
		session.setAttribute("userLoginInfo", null);
		
		return "redirect:/loginForm.do";
	}
	
	//회원가입 화면
	@RequestMapping(value = "/memInsertForm.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String memInsertForm(HttpSession session,@ModelAttribute("compnValueObject") CompnValueObject compnValueObject ,ModelMap model) throws Exception {
		System.out.println("LoginController의 memInsertForm.do 작동");
		
		List<CompnValueObject> compnList = memService.compnList(compnValueObject);
		List<CompnValueObject> depmtList = memService.depmtList(compnValueObject);
		
		model.addAttribute("compnList", compnList);
		model.addAttribute("depmtList", depmtList);
		
		return "login/memInsertForm";
	}
	
	//회원가입 insert
	@RequestMapping(value = "/insertMembership.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String insertMembership(HttpSession session, MemValueObject memValueObject) throws Exception {
		System.out.println("LoginController의 insertMembership.do 작동");
		System.out.println(memValueObject.getMemSeq()+"회원 seq");
		
		memService.insertMembership(memValueObject);
		
		return "login/loginForm";

	}
	
	//회원정보 상세보기
	@RequestMapping(value = "/memSelectViewForm.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String memSelectViewForm(HttpSession session, MemValueObject memValueObject, Model model,CompnValueObject compnValueObject) throws Exception {
		System.out.println("memSelectViewForm.do 작동");
		session.getAttribute("userLoginInfo");
		MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
		memValueObject.setMemSeq(userLoginInfo.getMemSeq());

		MemValueObject memSelectViewForm = memService.memSelectViewForm(memValueObject);
		List<CompnValueObject> compnList = memService.compnList(compnValueObject);
		List<CompnValueObject> depmtList = memService.depmtList(compnValueObject);
		
		model.addAttribute("compnList", compnList);
		model.addAttribute("depmtList", depmtList);
		model.addAttribute("memSelectViewForm", memSelectViewForm);
		
		return "login/memSelectViewForm";
	}
	//회원정보 수정
	@RequestMapping(value = "/updateMembership.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateMembership(HttpSession session, MemValueObject memValueObject, Model model) throws Exception {
		System.out.println("updateMembership.do 작동");
		session.getAttribute("userLoginInfo");
		MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
		memValueObject.setMemSeq(userLoginInfo.getMemSeq());
		memService.updateMembership(memValueObject);
		
		return "redirect:/memSelectViewForm.do";
	}
	
	//아이디 중복확인 팝업
//	@RequestMapping(value = "/idCheck.do", method={RequestMethod.GET, RequestMethod.POST})
//	public String idCheck(String memId, Model model, MemValueObject memValueObject) throws Exception {
//		System.out.println("idCheck.do 작동");
//		int idResult = memService.idCheck(memId);
//		System.out.println(idResult+"CCCCCCCCCCCCCCCCCCCCCCCCCCCCC");
//		model.addAttribute("memId", memId);
//		model.addAttribute("idResult", idResult);
//		return "login/idCheck";
//	}
	
	//아이디 중복체크 ajaxexx
	@RequestMapping(value = "/idCheck.do", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody Map<String, Object> idcheck(Locale locale,Model model, MemValueObject memValueObject) throws Exception {
		System.out.println(memValueObject.getMemId()+"케리어케리어케리어케리어");
		String memId = memValueObject.getMemId(); 
	    Map<String, Object> map = memService.idCheck(memId);
	    Map<String, Object> idCheck = new HashMap<String, Object>();
	    System.out.println("id갯수 얼마? : " + map.get("idCheck"));
	    idCheck.put("idCheck", map.get("idCheck"));
//		if(count==1) {
//			Integer idValue = "아이디가 존재합니다.";
//			map.put("idCount", count);
//			map.put("idValue", idValue);
//			System.out.println(map.get("IdCheck")+"첫번쩋ㅎㅎㅎ");
//			
//		}
//		else {
//			String idValue = "사용가능한 아이디입니다.";
//			model.addAttribute("idCount", count);
//			model.addAttribute("idValue", "사용가능한 아이디입니다.");
//			System.out.println(map.get("IdCheck")+"두번쩋ㅎㅎㅎ");
//		}
//		model.addAttribute("idCount", map.get("idCheck"));
		return idCheck;
	}
	//회사 등록 화면
	@RequestMapping(value = "/compnInsertPopup.do", method={RequestMethod.GET, RequestMethod.POST})
	public String compnPopup(Model model) throws Exception {

		return "login/compnInsertPopup"; 
	}
	
	//회사 등록
	@RequestMapping(value = "/insertCompn.do", method={RequestMethod.GET, RequestMethod.POST})
	public String insertCompn(Model model, MemValueObject memValueObject) throws Exception {
		
		memService.insertCompn(memValueObject);
		
		return "login/compnInsertPopup"; 
	}
	//회사 중복확인
	@RequestMapping(value = "/compnNmeCheck.do", method={RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody Map<String, Object> compnNmeCheck(Model model, MemValueObject memValueObject) throws Exception {
		
		String memCompnNme = memValueObject.getMemCompnNme();
		
	    Map<String, Object> map = memService.compnNmeCheck(memCompnNme);
	    Map<String, Object> compnNmeCheck = new HashMap<String, Object>();
	    System.out.println("id갯수 얼마? : " + map.get("compnNmeCheck"));
	    compnNmeCheck.put("compnNmeCheck", map.get("compnNmeCheck"));
		
		return compnNmeCheck; 
	}
	
	
	//회사 리스트 ajax
	@RequestMapping(value = "/compnAjax.do", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody Map<String, Object> compnAjax(HttpSession session,CompnValueObject compnValueObject ,ModelMap model) throws Exception {
		System.out.println("LoginController의 memInsertForm.do 작동");
		Map<String, Object> compnList = memService.compnAjax(compnValueObject);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("compnList", compnList);
//		List<CompnValueObject> depmtList = memService.depmtList(compnValueObject);
		
//		model.addAttribute("depmtList", depmtList);
		
		return compnList;
	}
	
	
	//부서 등록 화면
	@RequestMapping(value = "/depmtInsertPopup.do", method={RequestMethod.GET, RequestMethod.POST})
	public String depmtInsertPopup(Model model) throws Exception {
		
		return "login/depmtInsertPopup"; 
	}
	
	//부서 등록
	@RequestMapping(value = "/insertDepmt.do", method={RequestMethod.GET, RequestMethod.POST})
	public String insertDepmt(Model model,MemValueObject memValueObject) throws Exception {
		
		memService.insertDepmt(memValueObject);
		
		return "login/depmtInsertPopup"; 
	}
	
	//회사 중복확인
	@RequestMapping(value = "/depmtNmeCheck.do", method={RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody Map<String, Object> depmtNmeCheck(Model model, MemValueObject memValueObject) throws Exception {
		
		String memDepmtNme = memValueObject.getMemDepmtNme();
		
	    Map<String, Object> map = memService.depmtNmeCheck(memDepmtNme);
	    Map<String, Object> depmtNmeCheck = new HashMap<String, Object>();
	    System.out.println("id갯수 얼마? : " + map.get("depmtNmeCheck"));
	    depmtNmeCheck.put("depmtNmeCheck", map.get("depmtNmeCheck"));
		
		return depmtNmeCheck; 
	}
	
}
