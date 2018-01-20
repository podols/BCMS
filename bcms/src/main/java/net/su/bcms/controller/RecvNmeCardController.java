package net.su.bcms.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.su.bcms.service.NmeCardService;
import net.su.bcms.service.RecvNmeCardService;
import net.su.bcms.valueObject.NmeCardValueObject;
import net.su.bcms.valueObject.SearchAndPageValueObject;
import net.su.bcms.valueObject.ComnctnNmeCardValueObject;
import net.su.bcms.valueObject.ComnctnSearchAndPageValueObject;
import net.su.logger.Logger;
import net.su.login.service.MemService;
import net.su.login.valueObject.CompnValueObject;
import net.su.login.valueObject.MemValueObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RecvNmeCardController {
	
	@Resource
	private RecvNmeCardService recvNmeCardService;
	
	@Resource
	private MemService memService;
	
	@Resource
	private NmeCardService nmeCardService;
	
	//받은 명함 조회
	@RequestMapping(value = "/recvNmeCardSelectForm.do", method={RequestMethod.GET, RequestMethod.POST})
	public String recvNmeCardSelectForm(NmeCardValueObject nmeCardValueObject, SearchAndPageValueObject searchAndPageValueObject, ModelMap model, HttpSession session, MemValueObject memValueObject) throws Exception {
		Logger.info(null);
		session.getAttribute("userLoginInfo"); 
		MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
		nmeCardValueObject.setCretrSeq(userLoginInfo.getMemSeq());
		nmeCardValueObject.setMemSeq(userLoginInfo.getMemSeq());
		nmeCardValueObject.setRecvNmeCardUseAt("C");
		nmeCardValueObject.setRecvNmeCardBinUseAt("N");
		System.out.println(nmeCardValueObject.getMemSeq()+"인호찡 몸굳");
		List<NmeCardValueObject> selectRecvNmeCardList = recvNmeCardService.selectRecvNmeCardList(nmeCardValueObject);
		model.addAttribute("selectRecvNmeCardList", selectRecvNmeCardList);
		return "recvNmecard/recvNmeCardSelectForm";
	}
	
	//받은 명함 상세보기
	@RequestMapping(value="/recvNmeCardSelectViewForm.do", method={RequestMethod.GET, RequestMethod.POST})
	public String recvNmeCardSelectViewForm(CompnValueObject compnValueObject, @ModelAttribute("recvNmeCardValueObject") NmeCardValueObject nmeCardValueObject, ModelMap model, HttpSession session,ComnctnNmeCardValueObject comnctnNmeCardValueObject, MemValueObject memValueObject) throws Exception {
		Logger.info(null);
		MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
		nmeCardValueObject.setMemSeq(userLoginInfo.getMemSeq());
		List<NmeCardValueObject> selectLicnsSeq = nmeCardService.selectLicnsSeq(nmeCardValueObject);
		model.addAttribute("selectLicnsSeq", selectLicnsSeq);
		NmeCardValueObject recvNmeCardValueObject = recvNmeCardService.selectRecvNmeCardView(nmeCardValueObject);
		model.addAttribute("selectRecvNmeCardView", recvNmeCardValueObject);
		System.out.println(nmeCardValueObject.getMemSeq()+"상세보기에서");
		List<CompnValueObject> compnList = memService.compnList(compnValueObject);
		List<CompnValueObject> depmtList = memService.depmtList(compnValueObject);
			
		 model.addAttribute("compnList", compnList);
		 model.addAttribute("depmtList", depmtList);
		
		session.setAttribute("sessionNmeCardSeq", null);
		session.setAttribute("sessionNmeCardSeq", nmeCardValueObject);
		NmeCardValueObject sessionNmeCardSeq = (NmeCardValueObject)session.getAttribute("sessionNmeCardSeq");
		return "recvNmecard/recvNmeCardSelectViewForm";
	}
	
	//명함 휴지통 조회 화면
	@RequestMapping(value = "/recvNmeCardBinSelectForm.do", method={RequestMethod.GET, RequestMethod.POST})
	public String recvNmeCardBinSelectForm(NmeCardValueObject nmeCardValueObject, SearchAndPageValueObject searchAndPageValueObject, ModelMap model, HttpSession session, MemValueObject memValueObject) throws Exception {
		Logger.info(null);
		
		session.getAttribute("userLoginInfo");
		MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
		nmeCardValueObject.setCretrSeq(userLoginInfo.getMemSeq());
		nmeCardValueObject.setMemSeq(userLoginInfo.getMemSeq());
		
		nmeCardValueObject.setRecvNmeCardBinUseAt("B");
		nmeCardValueObject.setRecvNmeCardUseAt("C");
		nmeCardValueObject.setRecordCountPerPage(8);
		
		List<NmeCardValueObject> selectRecvNmeCardList = recvNmeCardService.selectRecvNmeCardList(nmeCardValueObject);
		model.addAttribute("selectRecvNmeCardList", selectRecvNmeCardList);
		
		return "recvNmecard/recvNmeCardBinSelectForm";
	}
	
	//명함 삭제 완료
	@RequestMapping(value = "/deleteRecvNmeCard.do", method={RequestMethod.GET, RequestMethod.POST})
	public String deleteRecvNmeCard(@RequestParam(value="checkArray[]") List<Integer> deleteList, @ModelAttribute("nmeCardValueObject") NmeCardValueObject nmeCardValueObject, ModelMap model, HttpSession session, MemValueObject memValueObject) throws Exception {
		Logger.info(null);
		MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
		int memSeq = userLoginInfo.getMemSeq();

		ArrayList<Integer> deleteArray = new ArrayList<Integer>();
		for(int i=0;i<deleteList.size();i++){
			deleteArray.add(deleteList.get(i));
		}
		recvNmeCardService.deleteRecvNmeCard(deleteArray, memSeq);
		
		return "redirect:/recvNmeCardSelectForm.do";
	}

	//명함 휴지통 완전 삭제 완료
	@RequestMapping(value = "/deleteRecvNmeCardBin.do", method={RequestMethod.GET, RequestMethod.POST})
	public String deleteRecvNmeCardBin(@RequestParam(value="checkArray[]") List<Integer> deleteList, @ModelAttribute("nmeCardValueObject") NmeCardValueObject nmeCardValueObject, ModelMap model, HttpSession session, MemValueObject memValueObject) throws Exception {
		Logger.info(null);
		MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
		int memSeq = userLoginInfo.getMemSeq();
		
		ArrayList<Integer> deleteArray = new ArrayList<Integer>();
		for(int i=0;i<deleteList.size();i++){
			deleteArray.add(deleteList.get(i));
		} 
		recvNmeCardService.deleteRecvNmeCardBin(deleteArray, memSeq);
		
		return "redirect:/recvNmeCardSelectForm.do";
	}

	//명함 휴지통 복원
	@RequestMapping(value = "/recvyRecvNmeCardBin.do", method={RequestMethod.GET, RequestMethod.POST})
	public String recvyNmeCardBin(@RequestParam(value="checkArray[]") List<Integer> deleteList, @ModelAttribute("nmeCardValueObject") NmeCardValueObject nmeCardValueObject, ModelMap model, HttpSession session, MemValueObject memValueObject) throws Exception {
		Logger.info(null);
		
		MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
		int memSeq = userLoginInfo.getMemSeq();
		
		ArrayList<Integer> deleteArray = new ArrayList<Integer>();
		for(int i=0;i<deleteList.size();i++){
			deleteArray.add(deleteList.get(i));
		}
		recvNmeCardService.recvyRecvNmeCardBin(deleteArray, memSeq);
		return "redirect:/recvNmeCardSelectForm.do";
	}
	
	//받은 명함 커뮤니케이션 버튼 화면
	@RequestMapping(value = "/recvNmeCardButtonForm.do", method={RequestMethod.GET, RequestMethod.POST})
	public String recvNmeCardButtonForm(@RequestParam("nmeCardSeq") int nmeCardSeq,ModelMap model) throws Exception {
		Logger.info("recvNmeCardButtonForm.do 작동");
		model.addAttribute("NmeCardSeq",nmeCardSeq);
		return "recvNmecard/recvNmeCardButtonForm";
	}
	
	//받은 명함 커뮤니케이션 리스트 화면
	@RequestMapping(value = "/recvNmeCardComnctnSelectForm.do", method={RequestMethod.GET, RequestMethod.POST})
	public String recvNmeCardComnctnSelectForm(ComnctnNmeCardValueObject comnctnNmeCardValueObject, ComnctnSearchAndPageValueObject comnctnSearchAndPageValueObject, ModelMap model, HttpSession session) throws Exception {
		Logger.info("recvNmeCardComnctnSelectForm.do 작동");
		session.getAttribute("userLoginInfo");
		MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
		comnctnNmeCardValueObject.setMemSeq(userLoginInfo.getMemSeq());
		List<ComnctnNmeCardValueObject> selectRecvNmeCardComnctnList = recvNmeCardService.selectRecvNmeCardComnctnList(comnctnNmeCardValueObject);
		model.addAttribute("selectRecvNmeCardComnctnList", selectRecvNmeCardComnctnList);
		return "recvNmecard/recvNmeCardComntnSelectForm";
	}
	
	//받은 명함 커뮤니케이션 상세보기 화면
	@RequestMapping(value = "/recvNmeCardComnctnViewForm.do", method={RequestMethod.GET, RequestMethod.POST})
	public String recvNmeCardComnctnViewForm(ComnctnNmeCardValueObject comnctnNmeCardValueObject, ComnctnSearchAndPageValueObject comnctnSearchAndPageValueObject, ModelMap model) throws Exception {
		Logger.info("recvNmeCardComnctnViewForm.do 작동");
		List<ComnctnNmeCardValueObject> selectAtndList = nmeCardService.selectAtndList(comnctnNmeCardValueObject);
	    model.addAttribute("selectAtndList", selectAtndList);
		ComnctnNmeCardValueObject selectRecvNmeCardComnctnView = recvNmeCardService.selectRecvNmeCardComnctnView(comnctnNmeCardValueObject);
		model.addAttribute("selectRecvNmeCardComnctnView", selectRecvNmeCardComnctnView);
		return "recvNmecard/recvNmeCardComnctnViewForm";
	}

}