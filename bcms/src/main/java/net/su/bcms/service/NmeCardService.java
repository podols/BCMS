package net.su.bcms.service;

import java.util.ArrayList;
import java.util.List;

import net.su.bcms.valueObject.ComnctnNmeCardValueObject;
import net.su.bcms.valueObject.NmeCardHistrValueObject;
import net.su.bcms.valueObject.NmeCardValueObject;
import net.su.login.valueObject.MemValueObject;

public interface NmeCardService {
	
	//참석자 고유값 조회
	public List<ComnctnNmeCardValueObject> selectAtndList(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception;
	
	//회원 리스트 조회
	public List<MemValueObject> selectMemList() throws Exception;
	
	//참석자 등록 완료
	public void insertAtnd(String[] atndSeqList, int comnctnSeq) throws Exception;
	
	//명함 자격증 고유값 조회
	public List<NmeCardValueObject> selectLicnsSeq(NmeCardValueObject nmeCardValueObject) throws Exception;
	
	//명함 변경내역 자격증 고유값 조회
	public List<NmeCardHistrValueObject> selectLicnsSeqHistr(NmeCardHistrValueObject nmeCardHistrValueObject) throws Exception;
	
	//자격증 삭제 완료
	public void deleteLicns(int nmeCardSeq) throws Exception;
	
	//자격증 등록 완료
	public void insertLicns(String[] licnsSeqList, int nmeCardSeq) throws Exception;
	
	//명함 등록 완료
	public void insertNmeCard(NmeCardValueObject nmeCardValueObject) throws Exception;
	
	//명함 변경내역 자격증 등록 완료
	public void insertLicnsHistr(String[] licnsSeqList, int nmeCardSeq, int selectNmeCardHistrSeq) throws Exception;
	
	//명함 변경내역 등록
	public int insertNmeCardHistr(NmeCardValueObject nmeCardValueObject) throws Exception;
		
	//명함 변경내역 변경컬럼 등록 완료
	public void updateNmeCardHistrUpdateCol(NmeCardValueObject nmeCardValueObject, int selectNmeCardHistrSeq) throws Exception;
	
	//커뮤니케이션 등록 완료
	public void insertNmeCardComnctn(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception;
	
	//명함 리스트 조회
	public List<NmeCardValueObject> selectNmeCardList(NmeCardValueObject nmeCardValueObject) throws Exception;
	
	//명함 변경내역 리스트 조회
	public List<NmeCardValueObject> selectNmeCardHistrList(NmeCardValueObject nmeCardValueObject) throws Exception;
	
	//명함 상세조회
	public NmeCardValueObject selectNmeCardView(NmeCardValueObject nmeCardValueObject) throws Exception;
	
	//명함 변경내역 상세조회
	public NmeCardHistrValueObject selectNmeCardHistrView(NmeCardHistrValueObject nmeCardHistrValueObject) throws Exception;
	
	//명함 수정 완료
	public void updateNmeCard(NmeCardValueObject nmeCardValueObject) throws Exception;
	
	//명함 삭제 완료
	public void deleteNmeCard(ArrayList<Integer> deleteArray) throws Exception;
	
	//명함 완전 삭제 완료
	public void deleteNmeCardBin(ArrayList<Integer> deleteArray) throws Exception;
	
	//명함 복원
	public void recvyNmeCardBin(ArrayList<Integer> deleteArray) throws Exception;
	
	//명함 자격증 목록
	public List<NmeCardValueObject> selectLicnsList() throws Exception;	
	
	//커뮤니케이션 리스트 조회
	public List<ComnctnNmeCardValueObject> selectNmeCardComnctnList(ComnctnNmeCardValueObject ComnctnNmeCardValueObject) throws Exception;
	
	//커뮤니케이션 상세조회
	public ComnctnNmeCardValueObject selectNmeCardComnctnView(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception;
	
	//커뮤니케이션 수정완료
	public void nmeCardComnctnUpdate(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception;
		
	//커뮤니케이션 삭제
	public void deleteNmeCardComnctn(ArrayList<Integer> deleteArray) throws Exception;
	
	//나의명함 커뮤니케이션 뉴스피드등록
	public void insertNewSpeedComctn(ComnctnNmeCardValueObject comnctnNmeCardValueObject)throws Exception;
	
	//나의명함  공유자 커뮤니케이션 뉴스피드등록
	public void insertNewSpeedComctnCretr(ComnctnNmeCardValueObject comnctnNmeCardValueObject)throws Exception;
}
