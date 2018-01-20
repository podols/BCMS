package net.su.bcms.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.su.bcms.dataAccessObject.NmeCardDataAccessObject;
import net.su.bcms.dataAccessObject.RecvNmeCardDataAccessObject;
import net.su.bcms.dataAccessObject.SharNmeCardDataAccessObject;
import net.su.bcms.valueObject.ComnctnNmeCardValueObject;
import net.su.bcms.valueObject.ComnctnSearchAndPageValueObject;
import net.su.bcms.valueObject.NmeCardValueObject;
import net.su.bcms.valueObject.SearchAndPageValueObject;
import net.su.logger.Logger;
import net.su.login.valueObject.MemValueObject;

@Service
public class SharNmeCardServiceImpl implements SharNmeCardService {
	
	@Resource
	private SharNmeCardDataAccessObject sharNmeCardDataAccessObject;
	
	//참석자 고유값 조회
	public List<ComnctnNmeCardValueObject> selectAtndList(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception {
		List<ComnctnNmeCardValueObject> selectAtndList = sharNmeCardDataAccessObject.selectAtndList(comnctnNmeCardValueObject);
		return selectAtndList;
	}
	
	//참석자 등록 완료
	public void insertAtnd(String[] atndSeqList, int comnctnSeq) throws Exception{
		Logger.info(null);
		sharNmeCardDataAccessObject.insertAtnd(atndSeqList, comnctnSeq);
	}
	
//	//명함 변경내역 리스트 조회
//	public List<NmeCardValueObject> selectSharNmeCardHistrList(NmeCardValueObject nmeCardValueObject) throws Exception {
//		Logger.info(null);
//		int selectSharNmeCardHistrCount = sharNmeCardDataAccessObject.selectNmeCardHistrCount(nmeCardValueObject);
//		List<NmeCardValueObject> selectSharNmeCardHistrList = sharNmeCardDataAccessObject.selectNmeCardHistrList(nmeCardValueObject);
//		nmeCardValueObject.setTotalRecordCount(selectNmeCardHistrCount);
//		return selectSharNmeCardHistrList;
//	}
	
	//회원 리스트 조회
	public List<MemValueObject> selectMemList() throws Exception{
		Logger.info(null);
		List<MemValueObject> selectMemList = sharNmeCardDataAccessObject.selectMemList();
		return selectMemList;
	}
	
	//공유명함 리스트 조회
	public List<NmeCardValueObject> selectSharNmeCardList(NmeCardValueObject nmeCardValueObject) throws Exception {
		Logger.info(null);
		int selectSharNmeCardCount = sharNmeCardDataAccessObject.selectSharNmeCardCount(nmeCardValueObject);
		List<NmeCardValueObject> selectSharNmeCardList = sharNmeCardDataAccessObject.selectSharNmeCardList(nmeCardValueObject);
		nmeCardValueObject.setTotalRecordCount(selectSharNmeCardCount);
		return selectSharNmeCardList;
	}
	//명함 삭제완료
	public void deleteSharNmeCard(ArrayList<Integer> deleteArray, int memSeq) throws Exception{
		Logger.info(null);
		System.out.println("명함공유리스트 삭제서비스"+memSeq);
		sharNmeCardDataAccessObject.deleteSharNmeCard(deleteArray, memSeq);
	}
	//명함 완전삭제완료
	public void deleteSharNmeCardBin(ArrayList<Integer> deleteArray, int memSeq) throws Exception{
		Logger.info(null);
		sharNmeCardDataAccessObject.deleteSharNmeCardBin(deleteArray, memSeq);
	}
	//명함 복원
	public void recvySharNmeCardBin(ArrayList<Integer> deleteArray, int memSeq) throws Exception{
		Logger.info(null);
		sharNmeCardDataAccessObject.recvySharNmeCardBin(deleteArray, memSeq);
	}

	//공유명함 상세조회
	public NmeCardValueObject selectSharNmeCardView(NmeCardValueObject nmeCardValueObject) throws Exception {
		Logger.info(null);
		NmeCardValueObject selectSharNmeCardView = sharNmeCardDataAccessObject.selectSharNmeCardView(nmeCardValueObject);
		System.out.println();
		selectSharNmeCardView.setCurrentPageNo(nmeCardValueObject.getCurrentPageNo());
		selectSharNmeCardView.setSearchCnd(nmeCardValueObject.getSearchCnd());
		selectSharNmeCardView.setSearchAry(nmeCardValueObject.getSearchAry());
		selectSharNmeCardView.setSearchWrd(nmeCardValueObject.getSearchWrd());
		return selectSharNmeCardView;
	}
	//명함 자격증 고유값 조회
	public List<NmeCardValueObject> selectLicnsSeq(NmeCardValueObject nmeCardValueObject) throws Exception {
		Logger.info(null);
		List<NmeCardValueObject> selectLicnsSeq = sharNmeCardDataAccessObject.selectLicnsSeq(nmeCardValueObject);
		return selectLicnsSeq;
	}
	
	//공유명함 커뮤니케이션 리스트 조회
	public List<ComnctnNmeCardValueObject> selectSharNmeCardComnctnList(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception {
		int selectSharNmeCardComnctnCount = sharNmeCardDataAccessObject.selectSharNmeCardComnctnCount(comnctnNmeCardValueObject);
		comnctnNmeCardValueObject.setComnctnTotalRecordCount(selectSharNmeCardComnctnCount);
		List<ComnctnNmeCardValueObject> selectSharNmeCardComnctnList = sharNmeCardDataAccessObject.selectSharNmeCardComnctnList(comnctnNmeCardValueObject);
		return selectSharNmeCardComnctnList;
	}

	//공유명함 커뮤니케이션 삭제
	public void deleteSharNmeCardComnctn(ArrayList<Integer> deleteArray) throws Exception{
		sharNmeCardDataAccessObject.deleteSharNmeCardComnctn(deleteArray);
	}
	
	//공유명함 커뮤니케이션 등록
	public void insertSharNmeCardComnctn(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception {
		Logger.info(null);
		System.out.println("쉼표가뜨는지 확인하는 서비스"+comnctnNmeCardValueObject.getComnctnType());
		sharNmeCardDataAccessObject.insertSharNmeCardComnctn(comnctnNmeCardValueObject);
	}
	
	//명함 커뮤니케이션 상세조회
	public ComnctnNmeCardValueObject selectSharNmeCardComnctnView(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception {
		ComnctnNmeCardValueObject selectSharNmeCardComnctnView = sharNmeCardDataAccessObject.selectSharNmeCardComnctnView(comnctnNmeCardValueObject);
		return selectSharNmeCardComnctnView;
	}
	
	//명함 커뮤니케이션 수정
	public void updateSharNmeCardComnctn(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception{
		Logger.info(null);
		System.out.println(comnctnNmeCardValueObject.getComnctnTitl()+"ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ");
		System.out.println(comnctnNmeCardValueObject.getComnctnContn()+"ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ");
		sharNmeCardDataAccessObject.updateSharNmeCardComnctn(comnctnNmeCardValueObject);
		System.out.println(comnctnNmeCardValueObject.getComnctnSeq()+"커뮤니SEQ");
		System.out.println(comnctnNmeCardValueObject.getMemSeq()+"멤고유값");
		System.out.println(comnctnNmeCardValueObject.getNmeCardSeq()+"명함고유값");
	}
	
	//공유명함 커뮤니케이션 뉴스피드등록
	public void insertNewSpeedSharComctn(ComnctnNmeCardValueObject comnctnNmeCardValueObject)throws Exception{
		sharNmeCardDataAccessObject.insertNewSpeedSharComctn(comnctnNmeCardValueObject);
	}
	
	//공유명함 공유자 커뮤니케이션 뉴스피드등록
	public void insertNewSpeedSharComctnCretr(ComnctnNmeCardValueObject comnctnNmeCardValueObject)throws Exception{
		sharNmeCardDataAccessObject.insertNewSpeedSharComctnCretr(comnctnNmeCardValueObject);
	}
}
