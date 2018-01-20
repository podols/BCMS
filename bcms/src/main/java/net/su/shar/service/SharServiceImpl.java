package net.su.shar.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.su.shar.dataAccessObject.SharDataAccessObject;
import net.su.shar.valueObject.SharSearchAndPageValueObject;
import net.su.shar.valueObject.SharValueObject;

import org.springframework.stereotype.Service;

@Service
public class SharServiceImpl implements SharService {
	
	@Resource
	   private SharDataAccessObject sharDataAccessObject;
	   
		// 공유 임시저장소 List
		public List<SharValueObject> selectDumpList(SharValueObject sharVo) throws Exception{
	         List<SharValueObject> dumpMemList = sharDataAccessObject.selectDumpList(sharVo);
	      return dumpMemList;   
		}
		
		// 공유 되지 않은 리스트
		public List<SharValueObject> selectNonSharList(SharValueObject sharVo) throws Exception{
		   if(sharVo.getSharSearchCnd()==2)
		   {
			   sharVo.setSharSearchWrd("%"+sharVo.getSharSearchWrd()+"%");
		   }
		   List<SharValueObject> nonSharMemList = sharDataAccessObject.selectNonSharList(sharVo);
	         return nonSharMemList;   
		}
		
		// 공유 되지 않는 사람 카운트
		public SharValueObject noneSharMemCount(SharValueObject sharVo) throws Exception{
			   if(sharVo.getSharSearchCnd()==2)
			   {
				   sharVo.setSharSearchWrd("%"+sharVo.getSharSearchWrd()+"%");
			   }
			SharValueObject countVo = new SharValueObject();
			countVo.setSharTotalRecordCount(sharDataAccessObject.noneSharMemCount(sharVo));
	         return countVo;
		}

		// 공유 중인 멤버
		public List<SharValueObject> selectSharList(SharValueObject sharVo) throws Exception{
		   if(sharVo.getSharSearchCnd()==2)
		   {
			   sharVo.setSharSearchWrd("%"+sharVo.getSharSearchWrd()+"%");
		   }
	         List<SharValueObject> sharMemList = sharDataAccessObject.selectSharList(sharVo);
	         return sharMemList;   
		}
		
		// 공유 중인 멤버 카운트
		public int sharMemCount(SharValueObject sharVo) throws Exception{
			   if(sharVo.getSharSearchCnd()==2)
			   {
				   sharVo.setSharSearchWrd("%"+sharVo.getSharSearchWrd()+"%");
			   }
			int sharMemCount = sharDataAccessObject.sharMemCount(sharVo);
			return sharMemCount;
		}		
		// 전체 멤버
		public List<SharValueObject> selectMemList(SharValueObject sharVo) throws Exception{
			List<SharValueObject> selectMemList  = sharDataAccessObject.selectMemList(sharVo);
			return selectMemList;
		}
		
		
		// 공유 '+' 기능
		public void plusingProcessor(ArrayList<String> plusCarrier, SharValueObject sharVo) throws Exception{
			for(int i = 0; i<plusCarrier.size(); i++){
				SharValueObject VO = new SharValueObject();
				VO.setMemSeq(Integer.parseInt(plusCarrier.get(i)));
				VO.setNmeCardSeq(sharVo.getNmeCardSeq());
				sharDataAccessObject.plusingProcessor(VO);
			}
		}
		
		// 공유 '-' 기능
		public void minusingProcessor(ArrayList<String> minusCarrier, SharValueObject sharVo) throws Exception{
			for(int i = 0; i<minusCarrier.size(); i++){

				SharValueObject VO = new SharValueObject();
				VO.setMemSeq(Integer.parseInt(minusCarrier.get(i)));
				VO.setNmeCardSeq(sharVo.getNmeCardSeq());
				sharDataAccessObject.minusingProcessor(VO);
			}
		}
		
		// 공유 실행
		public void dumpToShar(SharValueObject sharVo) throws Exception{
			sharDataAccessObject.dumpToShar(sharVo);
		}
		
		// 공유 취소
		public void dumpCancel(SharValueObject sharVo) throws Exception{
			sharDataAccessObject.dumpCancel(sharVo);
		}
		
		// 공유 해제 기능
		public void remvSharRecv(ArrayList<String> relsCarrier,SharValueObject sharVo) throws Exception{
			for(int i = 0; i<relsCarrier.size(); i++){
				SharValueObject VO = new SharValueObject();
				VO.setMemSeq(Integer.parseInt(relsCarrier.get(i)));
				VO.setNmeCardSeq(sharVo.getNmeCardSeq());
				VO.setSendMemSeq(sharVo.getSendMemSeq());
				sharDataAccessObject.remvSharRecv(VO);
			}
		}
		
		// 보내기 전체 멤버 리스트
		public  List<SharValueObject> allMemList(int where) throws Exception{
			List<SharValueObject> allMemList = sharDataAccessObject.allMemList(where);
			return allMemList;
		}
		
		// 보내기 임시저장소 리스트
		public  List<SharValueObject> sendMemList(List<Integer> senderInfo, SharValueObject sharVo) throws Exception{
			List<SharValueObject> sendMemList = sharDataAccessObject.sendMemList(senderInfo, sharVo);
			return sendMemList;
		}
		
		// 보내기 안 보내는 멤버 카운트
		public int noneSendMemCount(List<Integer> senderInfo, SharValueObject sharVo) throws Exception{
			   if(sharVo.getSharSearchCnd()==2)
			   {
				   sharVo.setSharSearchWrd("%"+sharVo.getSharSearchWrd()+"%");
			   }
			int noneSendMemCount = sharDataAccessObject.noneSendMemCount(senderInfo, sharVo);
			return noneSendMemCount;	
		}
		
		// 보내기 안 보내는 멤버 리스트
		public  List<SharValueObject> noneSendMemList(List<Integer> senderInfo, SharValueObject sharVo) throws Exception{
			   if(sharVo.getSharSearchCnd()==2)
			   {
				   sharVo.setSharSearchWrd("%"+sharVo.getSharSearchWrd()+"%");
			   }
			List<SharValueObject> noneSendMemList = sharDataAccessObject.noneSendMemList(senderInfo, sharVo);

			return noneSendMemList;
		}
		
		// 보내기 '+' 기능
		public void addSendRecv(List<Integer> senderInfo, List<String>plusProcessing  ) throws Exception{
			ArrayList<String> plusCarrier = new ArrayList<String>();
			for(int y=0; y<senderInfo.size();y++){
				SharValueObject VO = new SharValueObject();
				VO.setNmeCardSeq(senderInfo.get(y));
				for(int i=0; i<plusProcessing.size(); i++){
					plusCarrier.add(plusProcessing.get(i));
					VO.setMemSeq(Integer.parseInt(plusCarrier.get(i)));
					sharDataAccessObject.addSendRecv(VO);	
				}
			}
		}
		
		// 보내기 '-' 기능
		public void remvSendRecv(List<Integer> senderInfo, List<String>minusProcessing ) throws Exception{
			ArrayList<String> minusCarrier = new ArrayList<String>();
			for(int y=0; y<senderInfo.size();y++){
				SharValueObject VO = new SharValueObject();
				VO.setNmeCardSeq(senderInfo.get(y));
				for(int i=0; i<minusProcessing.size(); i++){
					minusCarrier.add(minusProcessing.get(i));
					VO.setMemSeq(Integer.parseInt(minusCarrier.get(i)));
					sharDataAccessObject.remvSendRecv(VO);	
				}
			}
		}
		
		// 보내기 실행
		public void InsertSend(List<Integer> senderInfo, SharValueObject sharVo) throws Exception{
			sharDataAccessObject.InsertSend(senderInfo, sharVo);			
		}
		
		// 보내기 취소
		public void cancelSend(List<Integer> senderInfo) throws Exception{
			sharDataAccessObject.cancelSend(senderInfo);
		}

}
