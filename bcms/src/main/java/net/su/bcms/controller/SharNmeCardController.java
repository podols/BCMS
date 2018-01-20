package net.su.bcms.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.su.bcms.service.NmeCardService;
import net.su.bcms.service.SharNmeCardService;
import net.su.bcms.valueObject.ComnctnNmeCardValueObject;
import net.su.bcms.valueObject.ComnctnSearchAndPageValueObject;
import net.su.bcms.valueObject.NmeCardHistrValueObject;
import net.su.bcms.valueObject.NmeCardValueObject;
import net.su.bcms.valueObject.SearchAndPageValueObject;
import net.su.logger.Logger;
import net.su.login.service.MemService;
import net.su.login.valueObject.CompnValueObject;
import net.su.login.valueObject.MemValueObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class SharNmeCardController {
	
	@Resource
	private SharNmeCardService sharNmeCardService;
	
	@Resource
	private MemService memService;
	
	@Resource
	private NmeCardService nmeCardService;
	
	   //공유명함 조회 화면
	   @RequestMapping(value = "/sharNmeCardSelectForm.do", method={RequestMethod.GET, RequestMethod.POST})
	   public String sharNmeCardSelectForm(NmeCardValueObject nmeCardValueObject, SearchAndPageValueObject searchAndPageValueObject, ModelMap model, HttpSession session, MemValueObject memValueObject) throws Exception {
		  Logger.info(null);
		  session.getAttribute("userLoginInfo");
		  MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
	      nmeCardValueObject.setCretrSeq(userLoginInfo.getMemSeq());
	      nmeCardValueObject.setSharUseAtBinType("N");
	      nmeCardValueObject.setSharType("Y");
	      nmeCardValueObject.setRecordCountPerPage(8);
	      List<NmeCardValueObject> selectSharNmeCardList = sharNmeCardService.selectSharNmeCardList(nmeCardValueObject);
	      model.addAttribute("selectNmeCardList", selectSharNmeCardList);
	      return "sharNmeCard/sharNmeCardSelectForm";
	   }
	   //공유 명함 상세조회 화면
	   @RequestMapping(value = "/sharNmeCardViewForm.do", method={RequestMethod.GET, RequestMethod.POST})
	   public String sharNmeCardViewForm(CompnValueObject compnValueObject, @ModelAttribute("nmeCardValueObject") NmeCardValueObject nmeCardValueObject, ModelMap model, HttpSession session,ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception {
	      Logger.info("sharNmeCardViewForm");
	      List<NmeCardValueObject> selectLicnsSeq = sharNmeCardService.selectLicnsSeq(nmeCardValueObject);
	      model.addAttribute("selectLicnsSeq", selectLicnsSeq);
	      MemValueObject sharNmeCardValueObject1 = (MemValueObject)session.getAttribute("userLoginInfo");
	      int memSeq =sharNmeCardValueObject1.getMemSeq();
	      nmeCardValueObject.setMemSeq(memSeq);
	      int sharSeqCheck = nmeCardValueObject.getSharSeq();
	      
	      nmeCardValueObject = sharNmeCardService.selectSharNmeCardView(nmeCardValueObject);
	      nmeCardValueObject.setSharSeq(sharSeqCheck);
//	      if (nmeCardValueObject.getSharSeq()!=0){
//	    	 
//	      }
//	      System.out.println(nmeCardValueObject.getSharSeq()+"넝검쓰???"+ sharSeqCheck);
	      
	      model.addAttribute("selectNmeCardView", nmeCardValueObject);
	      List<CompnValueObject> compnList = memService.compnList(compnValueObject);
		  List<CompnValueObject> depmtList = memService.depmtList(compnValueObject);
		  model.addAttribute("compnList", compnList);
		  model.addAttribute("depmtList", depmtList);
	      session.setAttribute("sessionNmeCardSeq", null);
	      session.setAttribute("sessionNmeCardSeq", nmeCardValueObject);
	      NmeCardValueObject sessionNmeCardSeq = (NmeCardValueObject)session.getAttribute("sessionNmeCardSeq");
	      
	      
	      
	      return "sharNmeCard/sharNmeCardViewForm";
	   }
	   
	   //명함 삭제 완료
	   @RequestMapping(value = "/deleteSharNmeCard.do", method={RequestMethod.GET, RequestMethod.POST})
	   public String deleteSharNmeCard(@RequestParam(value="checkArray[]") List<Integer> deleteList, @ModelAttribute("nmeCardValueObject") NmeCardValueObject nmeCardValueObject, ModelMap model, HttpSession session) throws Exception {
	      Logger.info(null);
	      MemValueObject sharNmeCardValueObject = (MemValueObject)session.getAttribute("userLoginInfo");
	      int memSeq =sharNmeCardValueObject.getMemSeq();
	      
	      ArrayList<Integer> deleteArray = new ArrayList<Integer>();
	      for(int i=0;i<deleteList.size();i++){
	         deleteArray.add(deleteList.get(i));
	      }
	      
	      sharNmeCardService.deleteSharNmeCard(deleteArray, memSeq);
	      return "redirect:/sharNmeCardSelectForm.do";
	   }
		//명함 휴지통 완전 삭제 완료
		@RequestMapping(value = "/deleteSharNmeCardBin.do", method={RequestMethod.GET, RequestMethod.POST})
		public String deleteSharNmeCardBin(@RequestParam(value="checkArray[]") List<Integer> deleteList, @ModelAttribute("nmeCardValueObject") NmeCardValueObject nmeCardValueObject, ModelMap model,HttpSession session) throws Exception {
			Logger.info(null);
		    MemValueObject sharNmeCardValueObject = (MemValueObject)session.getAttribute("userLoginInfo");
		    int memSeq =sharNmeCardValueObject.getMemSeq();
		    
			ArrayList<Integer> deleteArray = new ArrayList<Integer>();
			for(int i=0;i<deleteList.size();i++){
				deleteArray.add(deleteList.get(i));
			}
			
			System.out.println(nmeCardValueObject.getSharSeq()+"아무값도 없겟지??????????????????????");
			sharNmeCardService.deleteSharNmeCardBin(deleteArray, memSeq);
			return "redirect:/sharNmeCardSelectForm.do";
		}
		//명함 휴지통 복원
		@RequestMapping(value = "/recvySharNmeCardBin.do", method={RequestMethod.GET, RequestMethod.POST})
		public String recvySharNmeCardBin(@RequestParam(value="checkArray[]") List<Integer> deleteList, @ModelAttribute("nmeCardValueObject") NmeCardValueObject nmeCardValueObject, ModelMap model,HttpSession session) throws Exception {
			Logger.info(null);
		    MemValueObject sharNmeCardValueObject = (MemValueObject)session.getAttribute("userLoginInfo");
		    int memSeq =sharNmeCardValueObject.getMemSeq();
			ArrayList<Integer> deleteArray = new ArrayList<Integer>();
			for(int i=0;i<deleteList.size();i++){
				deleteArray.add(deleteList.get(i));
			}
			sharNmeCardService.recvySharNmeCardBin(deleteArray, memSeq);
			return "redirect:/sharNmeCardSelectForm.do";
		}
	   
		//명함 휴지통 조회 화면
		@RequestMapping(value = "/sharNmeCardBinSelectForm.do", method={RequestMethod.GET, RequestMethod.POST})
		public String nmeCardBinSelectForm(NmeCardValueObject nmeCardValueObject, SearchAndPageValueObject searchAndPageValueObject, ModelMap model, HttpSession session, MemValueObject memValueObject) throws Exception {
			Logger.info("sharNmeCardBinSelectForm");
			session.getAttribute("userLoginInfo");
			MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
			nmeCardValueObject.setCretrSeq(userLoginInfo.getMemSeq());
			nmeCardValueObject.setSharType("B");
			nmeCardValueObject.setSharUseAtBinType("B");
			nmeCardValueObject.setRecordCountPerPage(8);
			List<NmeCardValueObject> selectSharNmeCardList = sharNmeCardService.selectSharNmeCardList(nmeCardValueObject);

			model.addAttribute("selectSharNmeCardList", selectSharNmeCardList);
			return "sharNmeCard/sharNmeCardBinSelectForm";
		}
	   		
		//명함 변경내역 조회 화면
		@RequestMapping(value = "/sharNmeCardHistrSelectForm.do", method={RequestMethod.GET, RequestMethod.POST})
		public String sharNmeCardHistrSelectForm(SearchAndPageValueObject searchAndPageValueObject, NmeCardValueObject nmeCardValueObject,ModelMap model,HttpSession session) throws Exception {
			Logger.info(null);
			session.getAttribute("sessionNmeCardSeq");
			NmeCardValueObject sessionNmeCardSeq = (NmeCardValueObject)session.getAttribute("sessionNmeCardSeq");
			nmeCardValueObject.setNmeCardSeq(sessionNmeCardSeq.getNmeCardSeq());
			session.getAttribute("userLoginInfo");
			MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
			nmeCardValueObject.setCretrSeq(userLoginInfo.getMemSeq());
			List<NmeCardValueObject> selectNmeCardHistrList = nmeCardService.selectNmeCardHistrList(nmeCardValueObject);
			model.addAttribute("selectNmeCardHistrList", selectNmeCardHistrList);
			return "sharNmeCard/sharNmeCardHistrSelectForm";
		}
		   //명함 변경내역 상세조회 화면
		   @RequestMapping(value = "/sharNmeCardHistrSelectViewForm.do", method={RequestMethod.GET, RequestMethod.POST})
		   public String sharNmeCardHistrSelectViewForm(NmeCardHistrValueObject nmeCardHistrValueObject, ModelMap model, HttpSession session) throws Exception {
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
		      return "sharNmeCard/sharNmeCardHistrSelectViewForm";
		   }
		   
		   
		   
		   
		   
		   
		   
		   
	   //공유명함 커뮤니케이션 조회 화면
	   @RequestMapping(value = "/sharNmeCardComnctnSelectForm.do", method={RequestMethod.GET, RequestMethod.POST})
	   public String sharNmeCardComnctnSelectForm(ComnctnSearchAndPageValueObject comnctnSearchAndPageValueObject,ComnctnNmeCardValueObject comnctnNmeCardValueObject,ModelMap model,HttpSession session) throws Exception {
		   	System.out.println("공유명함 커뮤니케이션 조회 화면 컨트롤러 확인");
			session.getAttribute("sessionNmeCardSeq");
			NmeCardValueObject sessionNmeCardSeq = (NmeCardValueObject)session.getAttribute("sessionNmeCardSeq");
			comnctnNmeCardValueObject.setNmeCardSeq(sessionNmeCardSeq.getNmeCardSeq());
			session.getAttribute("userLoginInfo");
			MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
			int memSeq=userLoginInfo.getMemSeq();
			model.addAttribute("memSeq",memSeq);
			List<ComnctnNmeCardValueObject> selectSharNmeCardComnctnList = sharNmeCardService.selectSharNmeCardComnctnList(comnctnNmeCardValueObject);
			model.addAttribute("selectSharNmeCardComnctnList", selectSharNmeCardComnctnList);
			String comnctnType= comnctnNmeCardValueObject.getComnctnType();
			model.addAttribute("comnctnType2",comnctnType);
			int NmeCardSeq2= comnctnNmeCardValueObject.getNmeCardSeq();
			model.addAttribute("NmeCardSeq2",NmeCardSeq2);
			return "sharNmeCard/sharNmeCardComnctnSelectForm";
	   }
	   
	 //공유명함 커뮤니케이션,명함변경내역 버튼 화면
	   @RequestMapping(value = "/sharNmeCardButtonForm.do", method = RequestMethod.POST)
	   public String sharNmeCardButtonForm(@RequestParam("nmeCardSeq") int nmeCardSeq,ModelMap model ) {
		   System.out.println("공유명함 커뮤니케이션,명함변경내역 버튼 화면 컨트롤러 확인");
		   model.addAttribute("NmeCardSeq",nmeCardSeq);
		   return "sharNmeCard/sharNmeCardButtonForm";
	   }
	  	
	   //공유명함 커뮤니케이션 삭제
	   @RequestMapping(value = "/deleteSharNmeCardComnctn.do", method={RequestMethod.GET, RequestMethod.POST})
	   public String deleteSharNmeCardComnctn(@RequestParam(value="checkArray[]") List<Integer> deleteList, HttpSession session, @ModelAttribute("comnctnNmeCardValueObject") ComnctnNmeCardValueObject comnctnNmeCardValueObject, ModelMap model) throws Exception {
		   System.out.println("공유명함 커뮤니케이션 삭제 컨트롤러 확인");
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
				sharNmeCardService.insertNewSpeedSharComctn(comnctnNmeCardValueObject);
				sharNmeCardService.insertNewSpeedSharComctnCretr(comnctnNmeCardValueObject);
			}
			sharNmeCardService.deleteSharNmeCardComnctn(deleteArray);
			return "redirect:/sharNmeCardComnctnSelectForm.do";
	   }
	   
	   //공유명함 커뮤니케이션 등록 화면
	  	@RequestMapping(value = "/sharNmeCardComnctnInsertForm.do", method = {RequestMethod.GET, RequestMethod.POST})
	  	public String sharNmeCardComnctnInsertForm(ComnctnNmeCardValueObject comnctnNmeCardValueObject, ModelMap model, HttpSession session) throws Exception {
	  		 System.out.println("공유명함 커뮤니케이션 등록 화면 컨트롤러 확인");
	  		List<MemValueObject> selectMemList = sharNmeCardService.selectMemList();
	  		model.addAttribute("selectMemList",selectMemList);
	  		 return "sharNmeCard/sharNmeCardComnctnInsertForm";
	  	}
	  	
	 	//공유명함 커뮤니케이션 등록
		@RequestMapping(value = "/insertSharNmeCardComnctn.do", method={RequestMethod.GET, RequestMethod.POST})
		public String sharNmeCardComnctnInsert(ModelMap model, ComnctnNmeCardValueObject comnctnNmeCardValueObject, HttpSession session, MemValueObject memValueObject) throws Exception {
			System.out.println("공유명함 커뮤니케이션 등록 컨트롤러 확인");
			session.getAttribute("userLoginInfo");
			MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
			session.getAttribute("sessionNmeCardSeq");
			NmeCardValueObject sessionNmeCardSeq = (NmeCardValueObject)session.getAttribute("sessionNmeCardSeq");
			comnctnNmeCardValueObject.setMemSeq(userLoginInfo.getMemSeq());
			comnctnNmeCardValueObject.setComnctnCretrSeq(userLoginInfo.getMemSeq());
			comnctnNmeCardValueObject.setNmeCardSeq(sessionNmeCardSeq.getNmeCardSeq());
			comnctnNmeCardValueObject.setNewspeedType("CC");
			sharNmeCardService.insertNewSpeedSharComctn(comnctnNmeCardValueObject);
			sharNmeCardService.insertNewSpeedSharComctnCretr(comnctnNmeCardValueObject);
			
			
			if (comnctnNmeCardValueObject.getComnctnType().equals("meeting")) {
				if (comnctnNmeCardValueObject.getComnctnAtnd() == "") {
					sharNmeCardService.insertSharNmeCardComnctn(comnctnNmeCardValueObject);
				}
				else {
					String[] atndSeqList = comnctnNmeCardValueObject.getComnctnAtnd().split(",");
					sharNmeCardService.insertSharNmeCardComnctn(comnctnNmeCardValueObject);
					comnctnNmeCardValueObject = sharNmeCardService.selectSharNmeCardComnctnView(comnctnNmeCardValueObject);
					sharNmeCardService.insertAtnd(atndSeqList, comnctnNmeCardValueObject.getComnctnSeq());
				}
			}
			else {
				sharNmeCardService.insertSharNmeCardComnctn(comnctnNmeCardValueObject);
			}
			return "redirect:/sharNmeCardComnctnSelectForm.do";
		}
		
		//공유명함 커뮤니케이션 상세보기화면 
		@RequestMapping(value = "/sharNmeCardComnctnViewForm.do", method = {RequestMethod.POST, RequestMethod.GET})
		public String sharNmeCardComnctnViewForm(@ModelAttribute("comnctnNmeCardValueObject") ComnctnNmeCardValueObject comnctnNmeCardValueObject, ModelMap model, HttpSession session, MemValueObject memValueObject) throws Exception {
			System.out.println("커뮤니케이션 상세보기 컨트롤러 확인");
			Logger.info(null);
			session.getAttribute("userLoginInfo");
			MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
			session.getAttribute("sessionNmeCardSeq");
			NmeCardValueObject sessionNmeCardSeq = (NmeCardValueObject)session.getAttribute("sessionNmeCardSeq");
			comnctnNmeCardValueObject.setNmeCardSeq(sessionNmeCardSeq.getNmeCardSeq());
			List<ComnctnNmeCardValueObject> selectAtndList = sharNmeCardService.selectAtndList(comnctnNmeCardValueObject);
		    model.addAttribute("selectAtndList", selectAtndList);
			ComnctnNmeCardValueObject selectSharNmeCardComnctnView = sharNmeCardService.selectSharNmeCardComnctnView(comnctnNmeCardValueObject);
			selectSharNmeCardComnctnView.setMemSeq(userLoginInfo.getMemSeq());
			model.addAttribute("selectSharNmeCardComnctnView", selectSharNmeCardComnctnView);
			return "sharNmeCard/sharNmeCardComnctnViewForm";
		}
		
		//공유명함 커뮤니케이션 수정 화면
	 	@RequestMapping(value = "/sharNmeCardComnctnUpdateForm.do", method = {RequestMethod.GET, RequestMethod.POST})
	 	public String sharNmeCardComnctnUpdateForm(@ModelAttribute("comnctnNmeCardValueObject") ComnctnNmeCardValueObject comnctnNmeCardValueObject, ModelMap model, HttpSession session, MemValueObject memValueObject) throws Exception {
	 		System.out.println("공유명함 커뮤니케이션 수정 화면 컨트롤러 확인");
			session.getAttribute("userLoginInfo");
			MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
			session.getAttribute("sessionNmeCardSeq");
			NmeCardValueObject sessionNmeCardSeq = (NmeCardValueObject)session.getAttribute("sessionNmeCardSeq");
			comnctnNmeCardValueObject.setMemSeq(userLoginInfo.getMemSeq());
			comnctnNmeCardValueObject.setNmeCardSeq(sessionNmeCardSeq.getNmeCardSeq());
			ComnctnNmeCardValueObject selectSharNmeCardComnctnView = sharNmeCardService.selectSharNmeCardComnctnView(comnctnNmeCardValueObject);
			model.addAttribute("selectSharNmeCardComnctnView", selectSharNmeCardComnctnView);
	 		return "sharNmeCard/sharNmeCardComnctnUpdateForm";
		 }
	 	
	 	//공유명함 커뮤니케이션 수정
	 	@RequestMapping(value = "/updateSharNmeCardComnctn.do", method = {RequestMethod.GET, RequestMethod.POST})
	 	public String updateSharNmeCardComnctn(@ModelAttribute("comnctnNmeCardValueObject") ComnctnNmeCardValueObject comnctnNmeCardValueObject, ModelMap model, HttpSession session, MemValueObject memValueObject) throws Exception {
	 		System.out.println("공유명함 커뮤니케이션 수정 컨트롤러 확인");
			session.getAttribute("userLoginInfo");
			MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
			session.getAttribute("sessionNmeCardSeq");
			NmeCardValueObject sessionNmeCardSeq = (NmeCardValueObject)session.getAttribute("sessionNmeCardSeq");
			comnctnNmeCardValueObject.setMemSeq(userLoginInfo.getMemSeq());
			comnctnNmeCardValueObject.setNmeCardSeq(sessionNmeCardSeq.getNmeCardSeq());
			sharNmeCardService.updateSharNmeCardComnctn(comnctnNmeCardValueObject);
	 		return "redirect:/sharNmeCardComnctnViewForm.do?comnctnSeq="+comnctnNmeCardValueObject.getComnctnSeq();
		 }
}