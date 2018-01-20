package net.su.bcms.service;

import java.util.ArrayList;
import java.util.List;

import net.su.bcms.valueObject.ComnctnNmeCardValueObject;
import net.su.bcms.valueObject.ComnctnSearchAndPageValueObject;
import net.su.bcms.valueObject.NmeCardValueObject;
import net.su.bcms.valueObject.SearchAndPageValueObject;
import net.su.login.valueObject.MemValueObject;

public interface SharNmeCardService {
	
	//참석자 고유값 조회
	public List<ComnctnNmeCardValueObject> selectAtndList(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception;
	
	//회원 리스트 조회
	public List<MemValueObject> selectMemList() throws Exception;
	
	//참석자 등록 완료
	public void insertAtnd(String[] atndSeqList, int comnctnSeq) throws Exception;
	           
	//공유명함 리스트 조회
	public List<NmeCardValueObject> selectSharNmeCardList(NmeCardValueObject nmeCardValueObject) throws Exception;
		
	//명함 삭제완료
	public void deleteSharNmeCard(ArrayList<Integer> deleteArray, int memSeq) throws Exception;
	
	//명항 완전 삭제
	public void deleteSharNmeCardBin(ArrayList<Integer> deleteArray, int memSeq) throws Exception;
	
	//명함 복원
	public void recvySharNmeCardBin(ArrayList<Integer> deleteArray, int memSeq) throws Exception;
	
	//공유 명함 상세보기
	public NmeCardValueObject selectSharNmeCardView(NmeCardValueObject nmeCardValueObject) throws Exception;
	
	//명함 자격증 고유값 조회
	public List<NmeCardValueObject> selectLicnsSeq(NmeCardValueObject nmeCardValueObject) throws Exception;
	
	//공유명함 커뮤니케이션 리스트 조회
	public List<ComnctnNmeCardValueObject> selectSharNmeCardComnctnList(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception;
		
	//공유명함 커뮤니케이션 삭제
	public void deleteSharNmeCardComnctn(ArrayList<Integer> deleteArray) throws Exception;
	
	//공유명함 커뮤니케이션 등록
	public void insertSharNmeCardComnctn(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception;
	
	//공유명함 커뮤니케이션 상세조회
	public ComnctnNmeCardValueObject selectSharNmeCardComnctnView(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception;
	
	//공유명함 커뮤니케이션 수정
	public void updateSharNmeCardComnctn(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception;
	
	//공유명함 커뮤니케이션 뉴스피드등록
	public void insertNewSpeedSharComctn(ComnctnNmeCardValueObject comnctnNmeCardValueObject)throws Exception;
		
	//공유명함 공유자 커뮤니케이션 뉴스피드등록
	public void insertNewSpeedSharComctnCretr(ComnctnNmeCardValueObject comnctnNmeCardValueObject)throws Exception;
}
