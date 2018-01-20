package net.su.bcms.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.su.bcms.service.NmeCardService;
import net.su.bcms.valueObject.NmeCardHistrValueObject;
import net.su.bcms.valueObject.NmeCardValueObject;
import net.su.bcms.valueObject.SearchAndPageValueObject;
import net.su.bcms.valueObject.ComnctnNmeCardValueObject;
import net.su.bcms.valueObject.ComnctnSearchAndPageValueObject;
import net.su.login.valueObject.CompnValueObject;
import net.su.login.valueObject.MemValueObject;
import net.su.login.service.MemService;
import net.su.logger.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class NmeCardController {
   
   @Resource
   private NmeCardService nmeCardService;
   
   @Resource
   private MemService memService;
      
   //명함 자격증 목록 보기
   @RequestMapping(value = "/nmeCardLicns.do", method={RequestMethod.GET, RequestMethod.POST})
   public String nmeCardLicns(ModelMap model)throws Exception {
      Logger.info(null);
      List<NmeCardValueObject> selectLicnsList = nmeCardService.selectLicnsList();
      model.addAttribute("selectLicnsList", selectLicnsList);
      System.out.println("야호");
      return "nmeCard/nmeCardLicns";
   }
   
   //명함 등록 화면
   @RequestMapping(value = "/nmeCardInsertForm.do", method={RequestMethod.GET, RequestMethod.POST})
   public String nmeCardInsertForm(@ModelAttribute("compnValueObject") CompnValueObject compnValueObject, @ModelAttribute("nmeCardValueObject") NmeCardValueObject nmeCardValueObject, ModelMap model) throws Exception {
		Logger.info(null);
		List<NmeCardValueObject> selectLicnsList = nmeCardService.selectLicnsList();
		List<CompnValueObject> compnList = memService.compnList(compnValueObject);
		List<CompnValueObject> depmtList = memService.depmtList(compnValueObject);
					
		model.addAttribute("selectLicnsList", selectLicnsList);
		model.addAttribute("compnList", compnList);
		model.addAttribute("depmtList", depmtList);
		return "nmeCard/nmeCardInsertForm";
   }
   
   //명함 등록 완료
   @RequestMapping(value = "/insertNmeCard.do", method={RequestMethod.GET, RequestMethod.POST})
   public String insertNmeCard(NmeCardValueObject nmeCardValueObject, HttpSession session, MemValueObject memValueObject) throws Exception {
	   	Logger.info(null);
		session.getAttribute("userLoginInfo");
		MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
		nmeCardValueObject.setCretrSeq(userLoginInfo.getMemSeq());
		if (nmeCardValueObject.getLicnsSeq() == ""){
			nmeCardService.insertNmeCard(nmeCardValueObject);
			nmeCardValueObject = nmeCardService.selectNmeCardView(nmeCardValueObject);
		}
		else {
			String[] licnsSeqList = nmeCardValueObject.getLicnsSeq().split(",");
			nmeCardService.insertNmeCard(nmeCardValueObject);
			nmeCardValueObject = nmeCardService.selectNmeCardView(nmeCardValueObject);
			nmeCardService.insertLicns(licnsSeqList, nmeCardValueObject.getNmeCardSeq());
		}
		return "redirect:/nmeCardSelectForm.do";
   }
   
   //명함 조회 화면
   @RequestMapping(value = "/nmeCardSelectForm.do", method={RequestMethod.GET, RequestMethod.POST})
	public String nmeCardSelectForm(NmeCardValueObject nmeCardValueObject, SearchAndPageValueObject searchAndPageValueObject, ModelMap model, HttpSession session, MemValueObject memValueObject) throws Exception {
	   Logger.info(null);
	   session.getAttribute("userLoginInfo");
	   MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
       nmeCardValueObject.setCretrSeq(userLoginInfo.getMemSeq());
       nmeCardValueObject.setNmeCardUseAt("Y");
       List<NmeCardValueObject> selectNmeCardList = nmeCardService.selectNmeCardList(nmeCardValueObject);
       model.addAttribute("selectNmeCardList", selectNmeCardList);
       return "nmeCard/nmeCardSelectForm";
	}
   
   //명함 상세조회 화면
   @RequestMapping(value = "/nmeCardSelectViewForm.do", method={RequestMethod.GET, RequestMethod.POST})
	public String nmeCardViewForm(CompnValueObject compnValueObject, @ModelAttribute("nmeCardValueObject") NmeCardValueObject nmeCardValueObject, ModelMap model, HttpSession session,ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception {
	   Logger.info(null);
	   List<NmeCardValueObject> selectLicnsSeq = nmeCardService.selectLicnsSeq(nmeCardValueObject);
	   model.addAttribute("selectLicnsSeq", selectLicnsSeq);
	   nmeCardValueObject = nmeCardService.selectNmeCardView(nmeCardValueObject);
	   model.addAttribute("selectNmeCardView", nmeCardValueObject);
	   List<CompnValueObject> compnList = memService.compnList(compnValueObject);
	   List<CompnValueObject> depmtList = memService.depmtList(compnValueObject);
		
	   model.addAttribute("compnList", compnList);
	   model.addAttribute("depmtList", depmtList);
      
	   session.setAttribute("sessionNmeCardSeq", null);
	   session.setAttribute("sessionNmeCardSeq", nmeCardValueObject);
	   NmeCardValueObject sessionNmeCardSeq = (NmeCardValueObject)session.getAttribute("sessionNmeCardSeq");
	   return "nmeCard/nmeCardSelectViewForm";
   }
   
   //명함 변경내역 조회 화면
   @RequestMapping(value = "/nmeCardHistrSelectForm.do", method={RequestMethod.GET, RequestMethod.POST})
   public String nmeCardHistrSelectForm(SearchAndPageValueObject searchAndPageValueObject, NmeCardValueObject nmeCardValueObject,ModelMap model,HttpSession session) throws Exception {
      Logger.info(null);
      session.getAttribute("userLoginInfo");
      MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
      nmeCardValueObject.setCretrSeq(userLoginInfo.getMemSeq());
      List<NmeCardValueObject> selectNmeCardHistrList = nmeCardService.selectNmeCardHistrList(nmeCardValueObject);
      model.addAttribute("selectNmeCardHistrList", selectNmeCardHistrList);
      return "nmeCard/nmeCardHistrSelectForm";
   }
   
   //명함 변경내역 상세조회 화면
   @RequestMapping(value = "/nmeCardHistrSelectViewForm.do", method={RequestMethod.GET, RequestMethod.POST})
   public String nmeCardHistrViewForm(NmeCardHistrValueObject nmeCardHistrValueObject, ModelMap model, HttpSession session) throws Exception {
      Logger.info(null);
      NmeCardHistrValueObject histrVo = new NmeCardHistrValueObject();
      histrVo.setNmeCardHistrSeq(nmeCardHistrValueObject.getNmeCardHistrSeq());
      histrVo.setNmeCardSeq(nmeCardHistrValueObject.getNmeCardSeq());
      nmeCardHistrValueObject = nmeCardService.selectNmeCardHistrView(nmeCardHistrValueObject);
      List<NmeCardValueObject> selectLicnsList = nmeCardService.selectLicnsList();
      List<NmeCardHistrValueObject> selectLicnsSeqHistr = nmeCardService.selectLicnsSeqHistr(histrVo);
      model.addAttribute("selectNmeCardHistrView", nmeCardHistrValueObject);
      model.addAttribute("selectLicnsList", selectLicnsList);
      model.addAttribute("selectLicnsSeqHistr", selectLicnsSeqHistr);
      return "nmeCard/nmeCardHistrSelectViewForm";
   }
   
   //명함 수정 화면
   @RequestMapping(value = "/nmeCardUpdateForm.do", method={RequestMethod.GET, RequestMethod.POST})
   public String nmeCardUpdateForm(CompnValueObject compnValueObject, @ModelAttribute("nmeCardValueObject") NmeCardValueObject nmeCardValueObject, ModelMap model) throws Exception {
      Logger.info(null);
      NmeCardValueObject selectNmeCardView = nmeCardService.selectNmeCardView(nmeCardValueObject);
      List<NmeCardValueObject> selectLicnsList = nmeCardService.selectLicnsList();
      List<NmeCardValueObject> selectLicnsSeq = nmeCardService.selectLicnsSeq(nmeCardValueObject);
      List<CompnValueObject> compnList = memService.compnList(compnValueObject);
	  List<CompnValueObject> depmtList = memService.depmtList(compnValueObject);
		
	  model.addAttribute("compnList", compnList);
	  model.addAttribute("depmtList", depmtList);
      model.addAttribute("selectNmeCardView", selectNmeCardView);
      model.addAttribute("selectLicnsList", selectLicnsList);
      model.addAttribute("selectLicnsSeq", selectLicnsSeq); 
      return "nmeCard/nmeCardUpdateForm";
   }
   
   //명함 수정 완료 및 변경내역 등록
   @RequestMapping(value = "/updateNmeCard.do", method={RequestMethod.GET, RequestMethod.POST})
   public String updateNmeCard(@ModelAttribute("nmeCardValueObject") NmeCardValueObject nmeCardValueObject, ModelMap model, HttpSession session, MemValueObject memValueObject) throws Exception {
      Logger.info(null);
      if (nmeCardValueObject.getLicnsSeq() != ""){
	      List<NmeCardValueObject> selectLicnsSeq = nmeCardService.selectLicnsSeq(nmeCardValueObject);    
	      ArrayList<String> selectLicnsSeq2 = new ArrayList<String>();
	      for(int i=0; i<selectLicnsSeq.size(); i++){
	    	  selectLicnsSeq2.add(selectLicnsSeq.get(i).getLicnsSeq());
	      }
	      
	      String[] licnsSeqList = selectLicnsSeq2.toArray(new String[selectLicnsSeq2.size()]);
	      String[] licnsSeqList2 = nmeCardValueObject.getLicnsSeq().split(",");
	      int selectNmeCardHistrSeq = nmeCardService.insertNmeCardHistr(nmeCardValueObject);
	      nmeCardService.insertLicnsHistr(licnsSeqList, nmeCardValueObject.getNmeCardSeq(),selectNmeCardHistrSeq);	      
	      nmeCardService.deleteLicns(nmeCardValueObject.getNmeCardSeq());    
	      nmeCardService.insertLicns(licnsSeqList2, nmeCardValueObject.getNmeCardSeq());
	      nmeCardService.updateNmeCard(nmeCardValueObject);
	      nmeCardService.updateNmeCardHistrUpdateCol(nmeCardValueObject, selectNmeCardHistrSeq);
	      
	      session.getAttribute("userLoginInfo");
	      MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
	      nmeCardValueObject.setCretrSeq(userLoginInfo.getMemSeq());
	      model.addAttribute("nmeCardValueObject", nmeCardValueObject);
      }
      else {
    	  List<NmeCardValueObject> selectLicnsSeq = nmeCardService.selectLicnsSeq(nmeCardValueObject);    
	      ArrayList<String> selectLicnsSeq2 = new ArrayList<String>();
	      for(int i=0; i<selectLicnsSeq.size(); i++){
	    	  selectLicnsSeq2.add(selectLicnsSeq.get(i).getLicnsSeq());
	      }
	      
	      String[] licnsSeqList = selectLicnsSeq2.toArray(new String[selectLicnsSeq2.size()]);
	      int selectNmeCardHistrSeq = nmeCardService.insertNmeCardHistr(nmeCardValueObject);
	      nmeCardService.insertLicnsHistr(licnsSeqList, nmeCardValueObject.getNmeCardSeq(),selectNmeCardHistrSeq);	      
	      nmeCardService.deleteLicns(nmeCardValueObject.getNmeCardSeq());
	      nmeCardService.updateNmeCard(nmeCardValueObject);
	      nmeCardService.updateNmeCardHistrUpdateCol(nmeCardValueObject, selectNmeCardHistrSeq);
	      
	      session.getAttribute("userLoginInfo");
	      MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
	      nmeCardValueObject.setCretrSeq(userLoginInfo.getMemSeq());
	      model.addAttribute("nmeCardValueObject", nmeCardValueObject);
      }
      return "redirect:/nmeCardSelectForm.do";
   }
   
   //명함 삭제 완료
   @RequestMapping(value = "/deleteNmeCard.do", method={RequestMethod.GET, RequestMethod.POST})
   public String deleteNmeCard(@RequestParam(value="checkArray[]") List<Integer> deleteList, @ModelAttribute("nmeCardValueObject") NmeCardValueObject nmeCardValueObject, ModelMap model) throws Exception {
      Logger.info(null);
      ArrayList<Integer> deleteArray = new ArrayList<Integer>();
      for(int i=0;i<deleteList.size();i++){
         deleteArray.add(deleteList.get(i));
      }
      nmeCardService.deleteNmeCard(deleteArray);
      return "redirect:/nmeCardSelectForm.do";
   }
   
	//명함 휴지통 조회 화면
	@RequestMapping(value = "/nmeCardBinSelectForm.do", method={RequestMethod.GET, RequestMethod.POST})
	public String nmeCardBinSelectForm(NmeCardValueObject nmeCardValueObject, SearchAndPageValueObject searchAndPageValueObject, ModelMap model, HttpSession session, MemValueObject memValueObject) throws Exception {
		Logger.info(null);
		session.getAttribute("userLoginInfo");
		MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
		nmeCardValueObject.setCretrSeq(userLoginInfo.getMemSeq());
		nmeCardValueObject.setNmeCardUseAt("N");
		nmeCardValueObject.setRecordCountPerPage(8);
		List<NmeCardValueObject> selectNmeCardList = nmeCardService.selectNmeCardList(nmeCardValueObject);
		model.addAttribute("selectNmeCardList", selectNmeCardList);
		return "nmeCard/nmeCardBinSelectForm";
	}

	//명함 휴지통 완전 삭제 완료
	@RequestMapping(value = "/deleteNmeCardBin.do", method={RequestMethod.GET, RequestMethod.POST})
	public String deleteNmeCardBin(@RequestParam(value="checkArray[]") List<Integer> deleteList, @ModelAttribute("nmeCardValueObject") NmeCardValueObject nmeCardValueObject, ModelMap model) throws Exception {
		Logger.info(null);
		ArrayList<Integer> deleteArray = new ArrayList<Integer>();
		for(int i=0;i<deleteList.size();i++){
			deleteArray.add(deleteList.get(i));
		}
		nmeCardService.deleteNmeCardBin(deleteArray);
		return "redirect:/nmeCardSelectForm.do";
	}

	//명함 휴지통 복원
	@RequestMapping(value = "/recvyNmeCardBin.do", method={RequestMethod.GET, RequestMethod.POST})
	public String recvyNmeCardBin(@RequestParam(value="checkArray[]") List<Integer> deleteList, @ModelAttribute("nmeCardValueObject") NmeCardValueObject nmeCardValueObject, ModelMap model) throws Exception {
		Logger.info(null);
		ArrayList<Integer> deleteArray = new ArrayList<Integer>();
		for(int i=0;i<deleteList.size();i++){
			deleteArray.add(deleteList.get(i));
		}
		nmeCardService.recvyNmeCardBin(deleteArray);
		return "redirect:/nmeCardSelectForm.do";
	}
   
   //명함 커뮤니케이션 조회 화면
   @RequestMapping(value = "/nmeCardComnctnSelectForm.do", method={RequestMethod.GET, RequestMethod.POST})
   public String nmeCardComnctnSelectForm(ComnctnSearchAndPageValueObject comnctnSearchAndPageValueObject,ComnctnNmeCardValueObject comnctnNmeCardValueObject,ModelMap model,HttpSession session) throws Exception {
	  session.getAttribute("sessionNmeCardSeq");
	  NmeCardValueObject sessionNmeCardSeq = (NmeCardValueObject)session.getAttribute("sessionNmeCardSeq");
	  comnctnNmeCardValueObject.setNmeCardSeq(sessionNmeCardSeq.getNmeCardSeq());
	  session.getAttribute("userLoginInfo");
	  MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
	  int memSeq=userLoginInfo.getMemSeq();
	  model.addAttribute("memSeq",memSeq);
	  
      List<ComnctnNmeCardValueObject> selectNmeCardComnctnList = nmeCardService.selectNmeCardComnctnList(comnctnNmeCardValueObject);
      model.addAttribute("selectNmeCardComnctnList", selectNmeCardComnctnList);
      int NmeCardSeq2= comnctnNmeCardValueObject.getNmeCardSeq();
      model.addAttribute("NmeCardSeq2",NmeCardSeq2);
      return "nmeCard/nmeCardComnctnSelectForm";
   }
   
   //명함 커뮤니케이션,명함변경내역 버튼 화면
   @RequestMapping(value = "/nmeCardButtonForm.do", method = RequestMethod.POST)
   public String nmeCardButtonForm(@RequestParam("nmeCardSeq") int nmeCardSeq,ModelMap model ) {
      System.out.println("nmeCardController의 nmeCardButtonForm.do 작동");
      model.addAttribute("NmeCardSeq",nmeCardSeq);
      return "nmeCard/nmeCardButtonForm";
   }
   
   //커뮤니케이션 등록 화면
  	@RequestMapping(value = "/nmeCardComnctnInsertForm.do", method = {RequestMethod.GET, RequestMethod.POST})
  	public String nmeCardComnctnInsertForm(ComnctnNmeCardValueObject comnctnNmeCardValueObject, ModelMap model, HttpSession session) throws Exception {
  		List<MemValueObject> selectMemList = nmeCardService.selectMemList();
  		model.addAttribute("selectMemList",selectMemList);
  		return "nmeCard/nmeCardComnctnInsertForm";
  	}
 	//커뮤니케이션 등록 완료
	@RequestMapping(value = "/nmeCardComnctnInsert.do", method={RequestMethod.GET, RequestMethod.POST})
	public String nmeCardComnctnInsert(ModelMap model, ComnctnNmeCardValueObject comnctnNmeCardValueObject, HttpSession session, MemValueObject memValueObject) throws Exception {
		Logger.info(null);
		session.getAttribute("userLoginInfo");
		MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
		session.getAttribute("sessionNmeCardSeq");
		NmeCardValueObject sessionNmeCardSeq = (NmeCardValueObject)session.getAttribute("sessionNmeCardSeq");
		comnctnNmeCardValueObject.setMemSeq(userLoginInfo.getMemSeq());
		comnctnNmeCardValueObject.setComnctnCretrSeq(userLoginInfo.getMemSeq());
		comnctnNmeCardValueObject.setNmeCardSeq(sessionNmeCardSeq.getNmeCardSeq());
		comnctnNmeCardValueObject.setNewspeedType("CC");
		nmeCardService.insertNewSpeedComctn(comnctnNmeCardValueObject);
//		nmeCardService.insertNewSpeedComctnCretr(comnctnNmeCardValueObject);
		
		
		if (comnctnNmeCardValueObject.getComnctnType().equals("meeting")) {
			if (comnctnNmeCardValueObject.getComnctnAtnd() == "") {
				nmeCardService.insertNmeCardComnctn(comnctnNmeCardValueObject);
			}
			else {
				String[] atndSeqList = comnctnNmeCardValueObject.getComnctnAtnd().split(",");
				nmeCardService.insertNmeCardComnctn(comnctnNmeCardValueObject);
				comnctnNmeCardValueObject = nmeCardService.selectNmeCardComnctnView(comnctnNmeCardValueObject);
				nmeCardService.insertAtnd(atndSeqList, comnctnNmeCardValueObject.getComnctnSeq());
			}
		}
		else {
			nmeCardService.insertNmeCardComnctn(comnctnNmeCardValueObject);
		}
		return "redirect:/nmeCardComnctnSelectForm.do";
	}
	//커뮤니케이션 상세보기
	@RequestMapping(value = "/nmeCardComnctnViewForm.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String nmeCardComnctnView(@ModelAttribute("comnctnNmeCardValueObject") ComnctnNmeCardValueObject comnctnNmeCardValueObject, ModelMap model, HttpSession session, MemValueObject memValueObject) throws Exception {
		System.out.println("커뮤니케이션 상세보기 컨트롤러 확인");
		Logger.info(null);
		session.getAttribute("userLoginInfo");
		MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
		session.getAttribute("sessionNmeCardSeq");
		NmeCardValueObject sessionNmeCardSeq = (NmeCardValueObject)session.getAttribute("sessionNmeCardSeq");
		comnctnNmeCardValueObject.setMemSeq(sessionNmeCardSeq.getMemSeq());
	 	int loginSeq = userLoginInfo.getMemSeq();
		comnctnNmeCardValueObject.setNmeCardSeq(sessionNmeCardSeq.getNmeCardSeq());
//		System.out.println(comnctnNmeCardValueObject.getComnctnSeq()+"커뮤니SEQ");
//		System.out.println(comnctnNmeCardValueObject.getNmeCardSeq()+"명함고유값");
//		System.out.println(comnctnNmeCardValueObject.getComnctnCretrSeq()+"생성자 고유값");
		List<ComnctnNmeCardValueObject> selectAtndList = nmeCardService.selectAtndList(comnctnNmeCardValueObject);
	    model.addAttribute("selectAtndList", selectAtndList);
		ComnctnNmeCardValueObject comnctnNmeCardList = nmeCardService.selectNmeCardComnctnView(comnctnNmeCardValueObject);
		model.addAttribute("selectNmeCardComnctnView", comnctnNmeCardList);
		model.addAttribute("loginSeq", loginSeq);
		
		return "nmeCard/nmeCardComnctnViewForm";
	}
	//커뮤니케이션 수정 화면
 	@RequestMapping(value = "/nmeCardComnctnUpdateForm.do", method = {RequestMethod.GET, RequestMethod.POST})
 	public String nmeCardComnctnUpdateForm(@ModelAttribute("comnctnNmeCardValueObject") ComnctnNmeCardValueObject comnctnNmeCardValueObject, ModelMap model, HttpSession session, MemValueObject memValueObject) throws Exception {
 		Logger.info(null);
		session.getAttribute("userLoginInfo");
		MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
		session.getAttribute("sessionNmeCardSeq");
		NmeCardValueObject sessionNmeCardSeq = (NmeCardValueObject)session.getAttribute("sessionNmeCardSeq");
		comnctnNmeCardValueObject.setNmeCardSeq(sessionNmeCardSeq.getNmeCardSeq());
		comnctnNmeCardValueObject.setMemSeq(sessionNmeCardSeq.getMemSeq());
		System.out.println(comnctnNmeCardValueObject.getComnctnSeq()+"커뮤니SEQ");
		System.out.println(comnctnNmeCardValueObject.getNmeCardSeq()+"명함고유값");
		int loginSeq = userLoginInfo.getMemSeq();
		ComnctnNmeCardValueObject comnctnNmeCardList = nmeCardService.selectNmeCardComnctnView(comnctnNmeCardValueObject);
		model.addAttribute("selectNmeCardComnctnView", comnctnNmeCardList);
		model.addAttribute("loginSeq", loginSeq);
 		return "nmeCard/nmeCardComnctnUpdateForm";
	 }
 	//커뮤니케이션 수정완료 화면
 	@RequestMapping(value = "/nmeCardComnctnUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
 	public String nmeCardComnctnUpdate(@ModelAttribute("comnctnNmeCardValueObject") ComnctnNmeCardValueObject comnctnNmeCardValueObject, ModelMap model, HttpSession session, MemValueObject memValueObject) throws Exception {
 		Logger.info(null);
		session.getAttribute("userLoginInfo");
		MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
		session.getAttribute("sessionNmeCardSeq");
		NmeCardValueObject sessionNmeCardSeq = (NmeCardValueObject)session.getAttribute("sessionNmeCardSeq");
		int loginSeq = userLoginInfo.getMemSeq();
		comnctnNmeCardValueObject.setNmeCardSeq(sessionNmeCardSeq.getNmeCardSeq());
		System.out.println(comnctnNmeCardValueObject.getComnctnSeq()+"커뮤니SEQ");
		System.out.println(comnctnNmeCardValueObject.getNmeCardSeq()+"명함고유값");
		System.out.println(comnctnNmeCardValueObject.getComnctnTitl()+"ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ");
		System.out.println(comnctnNmeCardValueObject.getComnctnContn()+"ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ");
		nmeCardService.nmeCardComnctnUpdate(comnctnNmeCardValueObject);
		ComnctnNmeCardValueObject comnctnNmeCardList = nmeCardService.selectNmeCardComnctnView(comnctnNmeCardValueObject);
		model.addAttribute("selectNmeCardComnctnView", comnctnNmeCardList);
		model.addAttribute("loginSeq", loginSeq);
 		return "nmeCard/nmeCardComnctnViewForm";
 		
	 }
   //커뮤니케이션 삭제
   @RequestMapping(value = "/deleteNmeCardComnctn.do", method={RequestMethod.GET, RequestMethod.POST})
   public String deleteNmeCardComnctn(@RequestParam(value="checkArray[]") List<Integer> deleteList, HttpSession session, @ModelAttribute("comnctnNmeCardValueObject") ComnctnNmeCardValueObject comnctnNmeCardValueObject, ModelMap model) throws Exception {
	   ArrayList<Integer> deleteArray = new ArrayList<Integer>();
	   for(int i=0;i<deleteList.size();i++){
		   deleteArray.add(deleteList.get(i));
	   }
		session.getAttribute("userLoginInfo");
		MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
		session.getAttribute("sessionNmeCardSeq");
		NmeCardValueObject sessionNmeCardSeq = (NmeCardValueObject)session.getAttribute("sessionNmeCardSeq");
		comnctnNmeCardValueObject.setMemSeq(userLoginInfo.getMemSeq());
		comnctnNmeCardValueObject.setComnctnCretrSeq(userLoginInfo.getMemSeq());
		comnctnNmeCardValueObject.setNmeCardSeq(sessionNmeCardSeq.getNmeCardSeq());
		comnctnNmeCardValueObject.setNewspeedType("CD");
		for(int i=0;i<deleteList.size();i++){
			nmeCardService.insertNewSpeedComctn(comnctnNmeCardValueObject);
		}
		//nmeCardService.insertNewSpeedComctnCretr(comnctnNmeCardValueObject);
		nmeCardService.deleteNmeCardComnctn(deleteArray);
		return "redirect:/nmeCardComnctnSelectForm.do";
   }
}