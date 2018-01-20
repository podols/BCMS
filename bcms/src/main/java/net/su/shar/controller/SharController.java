package net.su.shar.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.su.bcms.service.GroupService;
import net.su.bcms.service.NmeCardService;
import net.su.bcms.valueObject.GroupValueObject;
import net.su.bcms.valueObject.NmeCardValueObject;
import net.su.login.valueObject.MemValueObject;
import net.su.shar.service.SharService;
import net.su.shar.valueObject.SharSearchAndPageValueObject;
import net.su.shar.valueObject.SharValueObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SharController {

	@Resource
	private SharService sharService;
	@Resource
	private GroupService groupService;


	private static final Logger logger = LoggerFactory.getLogger(SharController.class);

	//1. 공유
	
	// 공유 화면
	@RequestMapping(value = "/sharForm.do", method={RequestMethod.GET, RequestMethod.POST})
	public String sharForm(Model model, HttpSession session,  SharValueObject sharVo, GroupValueObject groupVo) throws Exception {
		System.out.println("sharController의 sharForm.do 작동");
		sharVo.setGropSeq(groupVo.getGropSeq());
		if(session.getAttribute("sharCurrentDat")!=null){
			if(!session.getAttribute("sharCurrentDat").equals("no")){
				SharValueObject sharCurrentVo =(SharValueObject)session.getAttribute("sharCurrentDat");
				sharVo.setSharFirstRecordIndex(sharCurrentVo.getSharFirstRecordIndex());
				sharVo.setSharCurrentPageNo(sharCurrentVo.getSharCurrentPageNo());
				sharVo.setGropSeq(sharCurrentVo.getGropSeq());
				sharVo.setSharSearchCnd(sharCurrentVo.getSharSearchCnd());
				sharVo.setSharSearchWrd(sharCurrentVo.getSharSearchWrd());
			}
		};
		session.getAttribute("sessionNmeCardSeq");
		NmeCardValueObject sessionNmeCardSeq = (NmeCardValueObject)session.getAttribute("sessionNmeCardSeq");
		session.getAttribute("userLoginInfo");
		MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
		
		sharVo.setMemSeq(userLoginInfo.getMemSeq());
		sharVo.setNmeCardSeq(sessionNmeCardSeq.getNmeCardSeq());
		List<SharValueObject> allMemList = sharService.selectMemList(sharVo); // 전체 회원
		int selector =1; 
		
		groupVo.setMemSeq(userLoginInfo.getMemSeq());
		List<GroupValueObject> groupList = groupService.gropSelect(groupVo);
		
		model.addAttribute("groupVo", groupVo);  
		model.addAttribute("groupList", groupList);  	
		model.addAttribute("allMemList", allMemList);
		model.addAttribute("sharVo", sharVo);
		model.addAttribute("selector", selector);
		return "shar/sharForm"; 
	}
	
	// 공유 화면 내에 테이블 불러오기
	@RequestMapping(value = "/sharTableForm.do", method={RequestMethod.GET, RequestMethod.POST})
	public String sharTableForm(Locale locale,Model model,HttpSession session, SharValueObject sharVo) throws Exception {
		System.out.println("sharController의 sharTableForm.do 작동");
		if(session.getAttribute("sharCurrentDat")!=null){
			if(!session.getAttribute("sharCurrentDat").equals("no")){
			SharValueObject sharCurrentVo =(SharValueObject)session.getAttribute("sharCurrentDat");
				System.out.println(sharCurrentVo.getSharFirstRecordIndex()+"#####@@#");
				System.out.println("######&&&&&&&&&&&#######"+sharCurrentVo.getGropSeq());
				sharVo.setSharFirstRecordIndex(sharCurrentVo.getSharFirstRecordIndex());
				sharVo.setSharCurrentPageNo(sharCurrentVo.getSharCurrentPageNo());
				sharVo.setGropSeq(sharCurrentVo.getGropSeq());
				sharVo.setSharSearchCnd(sharCurrentVo.getSharSearchCnd());
				sharVo.setSharSearchWrd(sharCurrentVo.getSharSearchWrd());
			}
		};
		session.getAttribute("sessionNmeCardSeq");
		NmeCardValueObject sessionNmeCardSeq = (NmeCardValueObject)session.getAttribute("sessionNmeCardSeq");
		session.getAttribute("userLoginInfo");
		MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
		sharVo.setMemSeq(userLoginInfo.getMemSeq());
		sharVo.setNmeCardSeq(sessionNmeCardSeq.getNmeCardSeq());
		logger.info("sharTableForm", locale);
		sharVo.setSharTotalRecordCount(sharService.noneSharMemCount(sharVo).getSharTotalRecordCount());//  공유 안 하는 회
		List<SharValueObject> dumpMemList = sharService.selectDumpList(sharVo); //  임시 저장소
		List<SharValueObject> nonSharMemList = sharService.selectNonSharList(sharVo); //  공유 안 하는 회원
		
		model.addAttribute("nonSharMemList", nonSharMemList);
		model.addAttribute("dumpMemList", dumpMemList);
		model.addAttribute("sharVo", sharVo);
		return "shar/sharTableForm";
	}
	

	
	// 임시 저장소에 회원 추가
	@RequestMapping(value = "/sharPlus.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String sharPlus(Locale locale,Model model, @RequestParam(value="sharArray[]") List<String> sharArrays, @RequestParam(value="plus[]") List<String> plusProcessing,HttpSession session, SharSearchAndPageValueObject sharSapVo ) throws Exception {
		System.out.println("sharController의 sharPlus.do 작동");
		SharValueObject sharVo = new SharValueObject();
		NmeCardValueObject sessionNmeCardSeq = (NmeCardValueObject)session.getAttribute("sessionNmeCardSeq");
		sharVo.setNmeCardSeq(sessionNmeCardSeq.getNmeCardSeq());
		
		ArrayList<String> plusCarrier = new ArrayList<String>();
		for(int i=0; i<plusProcessing.size(); i++){
			plusCarrier.add(plusProcessing.get(i));
		}
			sharVo.setSharSearchCnd(Integer.parseInt(sharArrays.get(0)));
			if(sharArrays.get(0).equals("0")){
				sharVo.setGropSeq(Integer.parseInt(sharArrays.get(1)));
				sharVo.setSharCurrentPageNo(Integer.parseInt(sharArrays.get(2)));
			}
			else{
				sharVo.setSharSearchWrd(sharArrays.get(1));
				sharVo.setGropSeq(Integer.parseInt(sharArrays.get(2)));
				sharVo.setSharCurrentPageNo(Integer.parseInt(sharArrays.get(3)));
			}

		sharService.plusingProcessor(plusCarrier, sharVo); //  더하기 처리 기능	
		sharVo.setSharTotalRecordCount(sharService.noneSharMemCount(sharVo).getSharTotalRecordCount());
		if(Double.parseDouble(sharVo.getSharTotalRecordCount()+"")/5 == sharVo.getSharCurrentPageNo()-1){
			if(sharVo.getSharCurrentPageNo()!=1){
			sharVo.setSharCurrentPageNo(sharVo.getSharCurrentPageNo()-1);
			}
		}
		session.setAttribute("sharCurrentDat",sharVo);
		List<SharValueObject> dumpMemList = sharService.selectDumpList(sharVo); //  공유 중인 회원
		List<SharValueObject> nonSharMemList = sharService.selectNonSharList(sharVo); //  공유 안 하는 회원
		
		model.addAttribute("sharVo", sharVo);
		model.addAttribute("nonSharMemList", nonSharMemList);
		model.addAttribute("dumpMemList", dumpMemList);
		return "shar/sharForm";
	}
	
	// 임시 저장소에 회원 삭제
	@RequestMapping(value = "/sharMinus.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String sharMinus(Locale locale,Model model,@RequestParam(value="sharArray[]") List<String> sharArrays,  @RequestParam(value="minus[]") List<String> minusProcessing, HttpSession session, SharSearchAndPageValueObject sharSapVo ) throws Exception {
		System.out.println("sharController의 sharMinus.do 작동");

		
		SharValueObject sharVo = new SharValueObject();
			NmeCardValueObject sessionNmeCardSeq = (NmeCardValueObject)session.getAttribute("sessionNmeCardSeq");

		int nmeCardSeqs = sessionNmeCardSeq.getNmeCardSeq();
		sharVo.setNmeCardSeq(nmeCardSeqs);
		
		ArrayList<String> minusCarrier = new ArrayList<String>();
		for(int i=0; i<minusProcessing.size(); i++){
			minusCarrier.add(minusProcessing.get(i));
		}


			sharVo.setSharSearchCnd(Integer.parseInt(sharArrays.get(0)));
			if(sharArrays.get(0).equals("0")){
				sharVo.setGropSeq(Integer.parseInt(sharArrays.get(1)));
				sharVo.setSharCurrentPageNo(Integer.parseInt(sharArrays.get(2)));
			}
			else{
				sharVo.setSharSearchWrd(sharArrays.get(1));
				sharVo.setGropSeq(Integer.parseInt(sharArrays.get(2)));
				sharVo.setSharCurrentPageNo(Integer.parseInt(sharArrays.get(3)));
			}

		sharService.minusingProcessor(minusCarrier, sharVo); //  더하기 처리 기능	
		sharVo.setSharTotalRecordCount(sharService.noneSharMemCount(sharVo).getSharTotalRecordCount());
		if(Double.parseDouble(sharVo.getSharTotalRecordCount()+"")/5 == sharVo.getSharCurrentPageNo()-1){
			  int newFirstRecordIndexnum = ((sharVo.getSharCurrentPageNo() - 2) * 5)+1;
				sharVo.setSharFirstRecordIndex(newFirstRecordIndexnum);
				System.out.println(sharVo.getSharFirstRecordIndex()+"#######");
		}
		session.setAttribute("sharCurrentDat",sharVo);
		List<SharValueObject> dumpMemList = sharService.selectDumpList(sharVo); //  공유 중인 회원
		List<SharValueObject> nonSharMemList = sharService.selectNonSharList(sharVo); //  공유 안 하는 회원
		
		model.addAttribute("sharVo", sharVo);
		model.addAttribute("nonSharMemList", nonSharMemList);
		model.addAttribute("dumpMemList", dumpMemList);
		return "shar/sharForm";
	}
	
	// 명함 공유 등록
	@RequestMapping(value = "/sharInsert.do", method={RequestMethod.GET, RequestMethod.POST})
	public String sharInsert(HttpSession session) throws Exception {
		System.out.println("sharController의 sharInsert.do 작동");

		SharValueObject sharVo = new SharValueObject();
		session.getAttribute("sessionNmeCardSeq");
		NmeCardValueObject sessionNmeCardSeq = (NmeCardValueObject)session.getAttribute("sessionNmeCardSeq");
		sharVo.setNmeCardSeq(sessionNmeCardSeq.getNmeCardSeq());
		
		session.getAttribute("userLoginInfo");
		MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
		sharVo.setSendMemSeq(userLoginInfo.getMemSeq());
		
		sharService.dumpToShar(sharVo);
		return "redirect:/sharForm.do";
	}
	
	//  공유 화면 나가기
	//  # 나가기 버튼 누룰시 공유 팝업에서 추가된 모든 데이터가 삭제됨
	@RequestMapping(value = "/sharCancel.do", method={RequestMethod.GET, RequestMethod.POST})
	public String sharCancel(HttpSession session) throws Exception {
		System.out.println("sharController의 sharCancel.do 작동");

		SharValueObject sharVo = new SharValueObject();
		session.getAttribute("sessionNmeCardSeq");
		NmeCardValueObject sessionNmeCardSeq = (NmeCardValueObject)session.getAttribute("sessionNmeCardSeq");
		sharVo.setNmeCardSeq(sessionNmeCardSeq.getNmeCardSeq());
		
		sharService.dumpCancel(sharVo);
		return "redirect:/sharForm.do";
	}

	//2. 공유 관리
	
	// 공유 관리 화면 이동
	@RequestMapping(value = "/sharRelsForm.do", method={RequestMethod.GET, RequestMethod.POST})
	public String shaRelsrForm(Model model, HttpSession session, SharValueObject sharVo) throws Exception {
		System.out.println("sharController의 shaRelsrForm.do 작동");
		session.getAttribute("sessionNmeCardSeq");
		NmeCardValueObject sessionNmeCardSeq = (NmeCardValueObject)session.getAttribute("sessionNmeCardSeq");
		session.getAttribute("userLoginInfo");
		MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
		sharVo.setMemSeq(userLoginInfo.getMemSeq());
		sharVo.setNmeCardSeq(sessionNmeCardSeq.getNmeCardSeq());
		List<SharValueObject> selectSharList = sharService.selectSharList(sharVo); // 전체 회원
		int selector =2;
		GroupValueObject groupVo = new GroupValueObject();
		groupVo.setMemSeq(userLoginInfo.getMemSeq());
		List<GroupValueObject> groupList = groupService.gropSelect(groupVo);
		
		model.addAttribute("groupVo", groupVo);  
		model.addAttribute("groupList", groupList);  	
		model.addAttribute("selectSharList", selectSharList);
		model.addAttribute("sharVo", sharVo);
		model.addAttribute("selector", selector);
		return "shar/sharForm"; 
	}
	
	 // 공유 관리 테이블 불러오기
	@RequestMapping(value = "/sharRelsTableForm.do", method={RequestMethod.GET, RequestMethod.POST})
	public String sharRelsTableForm(Locale locale,Model model, HttpSession session, SharValueObject sharVo) throws Exception {
		System.out.println("sharController의 sharRelsTableForm.do 작동");
		session.getAttribute("sessionNmeCardSeq");
		NmeCardValueObject sessionNmeCardSeq = (NmeCardValueObject)session.getAttribute("sessionNmeCardSeq");
		session.getAttribute("userLoginInfo");
		MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
		sharVo.setMemSeq(userLoginInfo.getMemSeq());
		sharVo.setNmeCardSeq(sessionNmeCardSeq.getNmeCardSeq());
		logger.info("sharRelsTableForm", locale);
		sharVo.setSharTotalRecordCount(sharService.sharMemCount(sharVo));//  공유 안 하는 회
		List<SharValueObject> sharMemList = sharService.selectSharList(sharVo);//  공유 중인 회원
		
		model.addAttribute("sharVo", sharVo);
		model.addAttribute("sharMemList", sharMemList);
		return "shar/sharRelsTableForm";
	}
	
	// 공유 해제
	@RequestMapping(value = "/remvSharRecv.do", method={RequestMethod.GET, RequestMethod.POST})
	public String remvSharRecv(Locale locale,Model model, @RequestParam(value="RelsArray[]") List<String> RelsProcessing, HttpSession session) throws Exception {
		System.out.println("sharController의 remvSharRecv.do 작동");

		SharValueObject sharVo = new SharValueObject();
		session.getAttribute("sessionNmeCardSeq");
		NmeCardValueObject sessionNmeCardSeq = (NmeCardValueObject)session.getAttribute("sessionNmeCardSeq");
		sharVo.setNmeCardSeq(sessionNmeCardSeq.getNmeCardSeq());
		session.getAttribute("userLoginInfo");
		MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
		sharVo.setSendMemSeq(userLoginInfo.getMemSeq());
		

		ArrayList<String> relsCarrier = new ArrayList<String>();
		for(int i=0; i<RelsProcessing.size(); i++){
			relsCarrier.add(RelsProcessing.get(i));
			System.out.println("##########"+relsCarrier);
		}
		int selector = 2;
		sharService.remvSharRecv(relsCarrier, sharVo); //  공유 취소
		
		model.addAttribute("selector", selector);
		return "redirect:/sharRelsTableForm.do";
	}
	

		// 3.보내기
	
		// 보내기 화면 이동
		@RequestMapping(value = "/sendForm.do", method={RequestMethod.GET, RequestMethod.POST})
		public String sendrForm(Model model, HttpSession session, SharValueObject sharVo, GroupValueObject groupVo) throws Exception {
			System.out.println("sharController의 sendForm.do 작동");
				sharVo.setGropSeq(groupVo.getGropSeq());
				System.out.println("##그룹에스이큐######"+sharVo.getGropSeq());
				if(session.getAttribute("sharCurrentDat")!=null){
					if(!session.getAttribute("sharCurrentDat").equals("no")){
					SharValueObject sharCurrentVo =(SharValueObject)session.getAttribute("sharCurrentDat");
						System.out.println(sharCurrentVo.getSharFirstRecordIndex()+"#####@@#");
						System.out.println("######&&&&&&&&&&&#######"+sharCurrentVo.getGropSeq());
						sharVo.setSharFirstRecordIndex(sharCurrentVo.getSharFirstRecordIndex());
						sharVo.setSharCurrentPageNo(sharCurrentVo.getSharCurrentPageNo());
						sharVo.setGropSeq(sharCurrentVo.getGropSeq());
						sharVo.setSharSearchCnd(sharCurrentVo.getSharSearchCnd());
						sharVo.setSharSearchWrd(sharCurrentVo.getSharSearchWrd());
					}
				};
			session.getAttribute("userLoginInfo");
			MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
			int where = userLoginInfo.getMemSeq();
			int selector =3;
			List<SharValueObject> allSendMemList = sharService.allMemList(where); // 전체 회원
			groupVo.setMemSeq(userLoginInfo.getMemSeq());
			List<GroupValueObject> groupList = groupService.gropSelect(groupVo);
			
			model.addAttribute("groupVo", groupVo);  
			model.addAttribute("groupList", groupList);  
			model.addAttribute("selector", selector);
			model.addAttribute("sharVo", sharVo);
			model.addAttribute("allSendMemList", allSendMemList);
			return "shar/sharForm"; 
		}
		// 보내기 테이블 불러오기
		@RequestMapping(value = "/sendTableForm.do", method={RequestMethod.GET, RequestMethod.POST})
			public String sendTableForm(Locale locale,Model model,HttpSession session, SharValueObject sharVo) throws Exception { 
				System.out.println("sharController의 sendTableForm.do 작동");
					if(session.getAttribute("sharCurrentDat")!=null){
						if(!session.getAttribute("sharCurrentDat").equals("no")){
						SharValueObject sharCurrentVo =(SharValueObject)session.getAttribute("sharCurrentDat");
							sharVo.setSharFirstRecordIndex(sharCurrentVo.getSharFirstRecordIndex());
							sharVo.setSharCurrentPageNo(sharCurrentVo.getSharCurrentPageNo());
							sharVo.setGropSeq(sharCurrentVo.getGropSeq());
							sharVo.setSharSearchCnd(sharCurrentVo.getSharSearchCnd());
							sharVo.setSharSearchWrd(sharCurrentVo.getSharSearchWrd());
						}
					};
				session.getAttribute("sessionNmeCardSeq");
				  session.getAttribute("userLoginInfo");
				  MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
				  List<Integer> senderInfo = (List<Integer>) session.getAttribute("senderInfos");
				sharVo.setMemSeq(userLoginInfo.getMemSeq());
				sharVo.setSharTotalRecordCount(sharService.noneSendMemCount(senderInfo, sharVo));//  공유 안 하는 회
				List<SharValueObject> noneSendMemList = sharService.noneSendMemList(senderInfo, sharVo); //  공유 중인 회원
				List<SharValueObject> sendMemList = sharService.sendMemList(senderInfo, sharVo); //  공유 중인 회원
				
				model.addAttribute("sharVo", sharVo);
				model.addAttribute("noneSendMemList", noneSendMemList);
				model.addAttribute("sendMemList", sendMemList);
				return "shar/sendTableForm";
			}
		
		// 보내기 임시저장소 추가
		// # 임시저장소에 선택된 회원이 추가됨.
		@RequestMapping(value = "/sendPlus.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String sendPlus(Locale locale,Model model,  @RequestParam(value="sharArray[]") List<String> sharArrays, @RequestParam(value="sPlus[]") List<String> plusProcessing,HttpSession session, SharValueObject sharVo ) throws Exception {
			System.out.println("sharController의 sendPlus.do 작동");
			  
			sharVo.setSharSearchCnd(Integer.parseInt(sharArrays.get(0)));
				if(sharArrays.get(0).equals("0")){
					sharVo.setGropSeq(Integer.parseInt(sharArrays.get(1)));
					sharVo.setSharCurrentPageNo(Integer.parseInt(sharArrays.get(2)));
				}
				else{
					sharVo.setSharSearchWrd(sharArrays.get(1));
					sharVo.setGropSeq(Integer.parseInt(sharArrays.get(2)));
					sharVo.setSharCurrentPageNo(Integer.parseInt(sharArrays.get(3)));
				}

			List<Integer> senderInfo = (List<Integer>) session.getAttribute("senderInfos");
			sharService.addSendRecv(senderInfo, plusProcessing ); //  더하기 처리 기능
			session.setAttribute("sharCurrentDat",sharVo);
			session.getAttribute("userLoginInfo");
			MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
			sharVo.setMemSeq(userLoginInfo.getMemSeq());
			sharVo.setSharTotalRecordCount(sharService.noneSendMemCount(senderInfo, sharVo));//  공유 안 하는 회	  
			if(Double.parseDouble(sharVo.getSharTotalRecordCount()+"")/5 == sharVo.getSharCurrentPageNo()-1){
				if(sharVo.getSharCurrentPageNo()!=1){
				sharVo.setSharCurrentPageNo(sharVo.getSharCurrentPageNo()-1);
				}
			}
			session.setAttribute("sharCurrentDat",sharVo);
			List<SharValueObject> noneSendMemList = sharService.noneSendMemList(senderInfo, sharVo); //  공유 중인 회원
			List<SharValueObject> sendMemList = sharService.sendMemList(senderInfo, sharVo); //  공유 중인 회원
			
			model.addAttribute("sharVo", sharVo);
			model.addAttribute("noneSendMemList", noneSendMemList);
			model.addAttribute("sendMemList", sendMemList);
			return "shar/sharForm";
		}

		// 보내기 임시저장소 삭제
		// # 임시저장소에 선택된 회원이 삭제됨.
		@RequestMapping(value = "/sendMinus.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String sendMinus(Locale locale,Model model,  @RequestParam(value="sharArray[]") List<String> sharArrays,@RequestParam(value="sMinus[]") List<String> minusProcessing, HttpSession session, SharValueObject sharVo) throws Exception {
			System.out.println("sharController의 sendMinus.do 작동");

			  List<Integer> senderInfo = (List<Integer>) session.getAttribute("senderInfos");
			  
			  sharVo.setSharSearchCnd(Integer.parseInt(sharArrays.get(0)));
				if(sharArrays.get(0).equals("0")){
					sharVo.setGropSeq(Integer.parseInt(sharArrays.get(1)));
					sharVo.setSharCurrentPageNo(Integer.parseInt(sharArrays.get(2)));
				}
				else{
					sharVo.setSharSearchWrd(sharArrays.get(1));
					sharVo.setGropSeq(Integer.parseInt(sharArrays.get(2)));
					sharVo.setSharCurrentPageNo(Integer.parseInt(sharArrays.get(3)));
				}

			sharService.remvSendRecv(senderInfo, minusProcessing ); //  더하기 처리 기능
			session.getAttribute("userLoginInfo");
			MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
			sharVo.setSendMemSeq(userLoginInfo.getMemSeq());
			sharVo.setSharTotalRecordCount(sharService.noneSendMemCount(senderInfo, sharVo));//  공유 안 하는 회	원 세기	  
			session.setAttribute("sharCurrentDat",sharVo);
			List<SharValueObject> noneSendMemList = sharService.noneSendMemList(senderInfo, sharVo); //  공유 중인 회원
			List<SharValueObject> sendMemList = sharService.sendMemList(senderInfo, sharVo); //  공유 중인 회원
			
			model.addAttribute("sharVo", sharVo);
			model.addAttribute("noneSendMemList", noneSendMemList);
			model.addAttribute("sendMemList", sendMemList);
			return "shar/sharForm";
		}
		
		// 보내기 실행
		@RequestMapping(value = "/insertSend.do", method={RequestMethod.GET, RequestMethod.POST})
		public String insertSend(HttpSession session) throws Exception {
			System.out.println("sharController의 insertSend.do 작동");

			SharValueObject sharVo = new SharValueObject();
			session.getAttribute("sessionNmeCardSeq");
			NmeCardValueObject sessionNmeCardSeq = (NmeCardValueObject)session.getAttribute("sessionNmeCardSeq");
			sharVo.setNmeCardSeq(sessionNmeCardSeq.getNmeCardSeq());
			  List<Integer> senderInfo = (List<Integer>) session.getAttribute("senderInfos");
			
			session.getAttribute("userLoginInfo");
			MemValueObject userLoginInfo = (MemValueObject)session.getAttribute("userLoginInfo");
			sharVo.setSendMemSeq(userLoginInfo.getMemSeq());
			sharService.InsertSend(senderInfo, sharVo); //  보내기 Insert
			return "redirect:/sharForm.do";
		}
		
		// 보내기 취소
		// #보내기 팝업에서 임시저장소에 추가된 모든 회원이 삭제됨
		@RequestMapping(value = "/cancelSend.do", method={RequestMethod.GET, RequestMethod.POST})
		public String cancelSend(HttpSession session) throws Exception {
			System.out.println("sharController의 cancelSend.do 작동");
			 List<Integer> senderInfo = (List<Integer>) session.getAttribute("senderInfos");
			 sharService.cancelSend(senderInfo); //  보내기 Insert
			return "redirect:/sharForm.do";
		}
		
		
		// 4. 세션
		
		// 보내기 기능을 돕는 세션 추가
			@RequestMapping(value = "/sendSession.do", method={RequestMethod.GET, RequestMethod.POST})
			public String sendSession(Locale locale,Model model, HttpSession session, @RequestParam(value="sendCheckArray[]") List<Integer> sendCheckProcessing) throws Exception {
			  System.out.println("sharController의 sendSession.do 작동");
			 List<Integer> senderInfo = sendCheckProcessing;
			  session.setAttribute("senderInfos", senderInfo);
				
			  return "shar/sharForm";
			}
			// 그룹 세션
			@RequestMapping(value = "/groupSessionReset.do", method={RequestMethod.GET, RequestMethod.POST})
			public String sharSearchSession(Locale locale,Model model, HttpSession session) {
			  System.out.println("sharController의 sendSession.do 작동");
			  
			  session.removeAttribute("sharCurrentDat");
			  session.setAttribute("sharCurrentDat","no");
			  return "shar/sharForm";
			}
}
