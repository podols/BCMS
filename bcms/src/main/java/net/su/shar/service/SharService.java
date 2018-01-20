package net.su.shar.service;

import java.util.ArrayList;
import java.util.List;
import net.su.shar.valueObject.SharValueObject;
//SharServiceImpl.java
public interface SharService {
	
	// 공유 임시저장소 List
	public List<SharValueObject> selectDumpList(SharValueObject sharVo) throws Exception;  
	
	// 공유 되지 않은 리스트
	public List<SharValueObject> selectNonSharList(SharValueObject sharVo) throws Exception;
	
	// 공유 되지 않는 사람 카운트
	public SharValueObject noneSharMemCount(SharValueObject sharVo) throws Exception;
	
	// 공유 중인 멤버
	public List<SharValueObject> selectSharList(SharValueObject sharVo) throws Exception;
	
	// 공유 중인 멤버 카운트
	public int sharMemCount(SharValueObject sharVo) throws Exception;
	
	// 전체 멤버
	public List<SharValueObject> selectMemList(SharValueObject sharVo) throws Exception; 
	
	// 공유 '+' 기능
	public void plusingProcessor(ArrayList<String> plusCarrier, SharValueObject sharVo) throws Exception;
	
	// 공유 '-' 기능
	public void minusingProcessor(ArrayList<String> minusCarrier, SharValueObject sharVo) throws Exception;
	
	// 공유 실행
	public void dumpToShar(SharValueObject sharVo) throws Exception;
	
	// 공유 취소
	public void dumpCancel(SharValueObject sharVo) throws Exception;
	
	// 공유 해제 기능
	public void remvSharRecv(ArrayList<String> relsCarrier,SharValueObject sharVo) throws Exception;
	
	// 보내기 전체 멤버 리스트
	public  List<SharValueObject> allMemList(int where) throws Exception;
	
	// 보내기 임시저장소 리스트
	public  List<SharValueObject> sendMemList(List<Integer> senderInfo, SharValueObject sharVo) throws Exception;
	
	// 보내기 안 보내는 멤버 카운트
	public int noneSendMemCount(List<Integer> senderInfo, SharValueObject sharVo) throws Exception;
	
	// 보내기 안 보내는 멤버 리스트
	public  List<SharValueObject> noneSendMemList(List<Integer> senderInfo, SharValueObject sharVo) throws Exception;
	
	// 보내기 '+' 기능
		public void addSendRecv(List<Integer> senderInfo, List<String>plusProcessing) throws Exception;
		
	// 보내기 '-' 기능
	public void remvSendRecv(List<Integer> senderInfo, List<String>minusProcessing ) throws Exception;
	
	// 보내기 실행
	public void InsertSend(List<Integer> senderInfo, SharValueObject sharVo) throws Exception;
	
	//보내기 취소
	public void cancelSend(List<Integer> senderInfo) throws Exception;
}