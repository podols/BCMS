package net.su.bcms.service;

import java.util.ArrayList;
import java.util.List;

import net.su.bcms.valueObject.NmeCardValueObject;
import net.su.bcms.valueObject.ComnctnNmeCardValueObject;

public interface RecvNmeCardService {
	
	//받은 명함 리스트
	public List<NmeCardValueObject> selectRecvNmeCardList(NmeCardValueObject nmeCardValueObject) throws Exception;
	
	//받은 명함 상세보기
	public NmeCardValueObject selectRecvNmeCardView(NmeCardValueObject nmeCardValueObject) throws Exception;

	//명함 삭제 완료
	public void deleteRecvNmeCard(ArrayList<Integer> deleteArray, int memSeq) throws Exception;
	
	//명함 완전 삭제 완료
	public void deleteRecvNmeCardBin(ArrayList<Integer> deleteArray, int memSeq) throws Exception; 
		
	//명함 복원
	public void recvyRecvNmeCardBin(ArrayList<Integer> deleteArray, int memSeq) throws Exception;
	
	//받은 명함 커뮤니케이션 리스트
	public List<ComnctnNmeCardValueObject> selectRecvNmeCardComnctnList(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception;
	
	//받은 명함 커뮤니케이션 상세보기
	public ComnctnNmeCardValueObject selectRecvNmeCardComnctnView(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception;


}
