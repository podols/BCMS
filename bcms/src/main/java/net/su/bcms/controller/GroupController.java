package net.su.bcms.controller;

import java.util.ArrayList ;
import java.util.List ; 
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.su.bcms.service.GroupService;
import net.su.bcms.valueObject.GroupValueObject;
import net.su.login.valueObject.MemValueObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class GroupController {
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);
	
	@Resource
	private GroupService groupService;
		// 그룹 회원 리스트, 그룹명 리스트
	   @RequestMapping(value = "/groupListForm.do", method={RequestMethod.GET, RequestMethod.POST})
	   public String groupListForm(GroupValueObject groupValueObject, Model model, HttpSession session)throws Exception {
		   
		   session.getAttribute("userLoginInfo");
			MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
			groupValueObject.setMemSeq(userLoginInfo.getMemSeq());

		   List<GroupValueObject> groupList = groupService.gropSelect(groupValueObject);
	    	model.addAttribute("groupList", groupList);
	 
	       List<GroupValueObject> groupWholeList = groupService.groupWholeList(groupValueObject);   	
	    	model.addAttribute("groupWholeList", groupWholeList);
	    		        
	      return "group/groupListForm";
	   }
	   
	   // 그룹명 등록 jsp창 띄우기
	   @RequestMapping(value = "/groupAddition.do", method={RequestMethod.GET, RequestMethod.POST})
	   public String groupAddition(Locale locale)throws Exception {
		   logger.info("groupAddition", locale);
		   
	      return "group/groupAdditionForm";
	   }
	   // 그룹명 등록
	    @RequestMapping(value="/groupInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String groupInsert(GroupValueObject groupValueObject, Model model, HttpSession session, MemValueObject memValueObject)throws Exception{
	    	
	    	session.getAttribute("userLoginInfo");
			MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
			groupValueObject.setMemSeq(userLoginInfo.getMemSeq());
	    		
	    	groupService.groupInsert(groupValueObject);
	    	
	    	
	    	return "group/groupListForm";
		}
	    
	    
	    // 그룹리스트 조회
	    @RequestMapping(value="groupWholeList.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String groupWholeList(GroupValueObject groupValueObject, Model model, HttpSession session, MemValueObject memValueObject)throws Exception{
	    		
	    	   List<GroupValueObject> groupWholeList = groupService.groupWholeList(groupValueObject);   	
	    	   model.addAttribute("groupWholeList", groupWholeList);
	    	   
	    	return "group/groupListForm";
		}
	    
	    // 그룹 팝업 조회
	    @RequestMapping(value="groupMemSelect.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String groupMemSelect(GroupValueObject groupValueObject, Model model, HttpSession session)throws Exception{
	    	
			   session.getAttribute("userLoginInfo");
			   MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
			   groupValueObject.setMemSeq(userLoginInfo.getMemSeq());

			   List<GroupValueObject> groupList = groupService.gropSelect(groupValueObject);
		    	model.addAttribute("groupList", groupList);
		    	
	    	   
	    	return "group/groupMemInsertPopup";
		}
	    
	    // 회원 선택시 
	    @RequestMapping(value="checkMemSession.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String checkMemSession(HttpSession session, @RequestParam(value="mem[]") List<Integer> memList)throws Exception{

		     List<Integer> memInfo = memList;
		      session.setAttribute("memInfos", memInfo);
	    	return "group/groupListForm";
		}
	    
	    // 그룹 회원 추가
	    @RequestMapping(value="groupMemInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String groupMemInsert(HttpSession session, @RequestParam(value="group[]") List<Integer> groupList)throws Exception{

//		     List<Integer> groupInfo = groupList;
//		      session.setAttribute("groupInfos", groupInfo);
		     List<Integer> memInfo =  (List<Integer>) session.getAttribute("memInfos");
		     groupService.groupMemInsert(memInfo, groupList);
	    	return "group/groupListForm";
		}
	    
	    // 그룹 회원 삭제
	    @RequestMapping(value="gropMemDelete.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String gropMemDelete(HttpSession session, @RequestParam(value="mem[]") List<Integer> memList, GroupValueObject groupValueObject)throws Exception{
	    	
	    	List<Integer> memInfo = memList;
		      session.setAttribute("memInfos", memInfo);
		 
		      groupService.groupMemDelete(memInfo);
	    	return "group/groupListForm";
		}
	    
	    //그룹명 삭제
	    @RequestMapping(value="/groupDelete.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String groupDelete(GroupValueObject groupValueObject)throws Exception{
	    	
	    
	    	groupService.groupDelete(groupValueObject);
	    	return "redirect:/groupListForm.do";
		}
	    
	    //그룹명 수정
	    @RequestMapping(value="/gropUpdateCommit.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String gropUpdateCommit(GroupValueObject groupValueObject)throws Exception{
	    	  	
	    	int UpdateCount = groupValueObject.getUpdateCount() - 1;
	    	String updateGropNme = groupValueObject.getUpdateGropNme();
	    	String[] result = updateGropNme.split(",");
	    	groupValueObject.setUpdateGropNme(result[UpdateCount]);
	    	
	    	groupService.gropUpdateCommit(groupValueObject);
	    	return "redirect:/groupListForm.do";
		}
	    
}
