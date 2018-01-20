package net.su.base.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.su.base.service.BaseService;
import net.su.base.valueObject.BaseValueObject;
import net.su.login.valueObject.MemValueObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BaseController {
	
	@Resource
	private BaseService baseService;
	
	@RequestMapping(value = "/title.do", method={RequestMethod.GET, RequestMethod.POST})
	public String header(MemValueObject memValueObject, Model model, HttpSession session) throws Exception {
		System.out.println("BasicController의 title.do 작동");
		MemValueObject loginUser = (MemValueObject)session.getAttribute("userLoginInfo");
		model.addAttribute("loginUser", loginUser);
		return "base/title";
	}
	
	
	@RequestMapping(value = "/newSpeed.do", method={RequestMethod.GET, RequestMethod.POST})
	public String newSpeed(Model model,HttpSession session, BaseValueObject baseVo) throws Exception {
		System.out.println("BasicController의 newSpeed.do 작동");
		session.getAttribute("userLoginInfo");
		MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
		baseVo.setReceiveSeq(userLoginInfo.getMemSeq());
		int receiveSeq = baseVo.getReceiveSeq();
		Map<String, Object> map =  baseService.newspeedSelect(receiveSeq);
		model.addAttribute("newspeed", map.get("newspeed"));
		return "base/newSpeed";
	}
	
	@RequestMapping(value = "/newSpeedAjax.do", method={RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody Map<String, Object> newSpeed2(Model model,HttpSession session, BaseValueObject baseVo) throws Exception {
		
		session.getAttribute("userLoginInfo");
		MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
		baseVo.setReceiveSeq(userLoginInfo.getMemSeq());
		
		int receiveSeq = baseVo.getReceiveSeq();
		
		Map<String, Object> map =  baseService.newspeedSelect(receiveSeq);
		Map<String, Object> returnList = new HashMap<String, Object>();
		returnList.put("newList", map.get("newspeed"));
		
		return returnList;
	}
}