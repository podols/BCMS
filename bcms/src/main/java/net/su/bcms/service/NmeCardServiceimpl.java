package net.su.bcms.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.su.bcms.dataAccessObject.NmeCardDataAccessObject;
import net.su.bcms.valueObject.ComnctnNmeCardValueObject;
import net.su.bcms.valueObject.NmeCardHistrValueObject;
import net.su.bcms.valueObject.NmeCardValueObject;
import net.su.logger.Logger;
import net.su.login.valueObject.MemValueObject;

import org.springframework.stereotype.Service;

@Service

public class NmeCardServiceimpl implements NmeCardService {

	@Resource
	private NmeCardDataAccessObject nmeCardDataAccessObject;
	
	//참석자 고유값 조회
	public List<ComnctnNmeCardValueObject> selectAtndList(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception {
		List<ComnctnNmeCardValueObject> selectAtndList = nmeCardDataAccessObject.selectAtndList(comnctnNmeCardValueObject);
		return selectAtndList;
	}
	
	//참석자 등록 완료
	public void insertAtnd(String[] atndSeqList, int comnctnSeq) throws Exception{
		Logger.info(null);
		nmeCardDataAccessObject.insertAtnd(atndSeqList, comnctnSeq);
	}
		
	
	//회원 리스트 조회
	public List<MemValueObject> selectMemList() throws Exception{
		Logger.info(null);
		List<MemValueObject> selectMemList = nmeCardDataAccessObject.selectMemList();
		return selectMemList;
	}
	
	//자격증 등록완료
	public void insertLicns(String[] licnsSeqList, int nmeCardSeq) throws Exception {
		Logger.info(null);
		nmeCardDataAccessObject.insertLicns(licnsSeqList, nmeCardSeq);
	}
	
	//자격증 변경내역 등록완료
	public void insertLicnsHistr(String[] licnsSeqList, int nmeCardSeq, int selectNmeCardHistrSeq) throws Exception {
		Logger.info(null);
		nmeCardDataAccessObject.insertLicnsHistr(licnsSeqList, nmeCardSeq, selectNmeCardHistrSeq);
	}
	
	//자격증 삭제 완료
	public void deleteLicns(int nmeCardSeq) throws Exception {
		Logger.info(null);
		nmeCardDataAccessObject.deleteLicns(nmeCardSeq);
	}
	
	//명함 등록완료
	public void insertNmeCard(NmeCardValueObject nmeCardValueObject) throws Exception {
		Logger.info(null);
		nmeCardDataAccessObject.insertNmeCard(nmeCardValueObject);
	}
	
	//명함 변경내역 등록완료
	public int insertNmeCardHistr(NmeCardValueObject nmeCardValueObject) throws Exception {
		Logger.info(null);
		nmeCardDataAccessObject.insertNmeCardHistr(nmeCardValueObject); 
		int selectNmeCardHistrSeq = nmeCardDataAccessObject.selectNmeCardHistrSeq(nmeCardValueObject);
		
		return selectNmeCardHistrSeq;
	}
	
	//명함 변경내역 변경컬럼 등록 완료
	public void updateNmeCardHistrUpdateCol (NmeCardValueObject nmeCardValueObject, int selectNmeCardHistrSeq) throws Exception {
		Logger.info(null);
		nmeCardDataAccessObject.updateNmeCardHistrUpdateCol(nmeCardValueObject, selectNmeCardHistrSeq);
	}
	
	//명함 변경내역 고유값 조회
	public int selectNmeCardHistrSeq(NmeCardValueObject nmeCardValueObject) throws Exception {
		Logger.info(null);
		int selectNmeCardHistrSeq = nmeCardDataAccessObject.selectNmeCardHistrSeq(nmeCardValueObject);
		return selectNmeCardHistrSeq;
	}
	
	//커뮤니케이션 등록완료
	public void insertNmeCardComnctn(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception {
		Logger.info(null);
		System.out.println("쉼표가뜨는지 확인하는 서비스"+comnctnNmeCardValueObject.getComnctnType());
		nmeCardDataAccessObject.insertNmeCardComnctn(comnctnNmeCardValueObject);
	}
	
	//명함 자격증 고유값 조회
	public List<NmeCardValueObject> selectLicnsSeq(NmeCardValueObject nmeCardValueObject) throws Exception {
		Logger.info(null);
		List<NmeCardValueObject> selectLicnsSeq = nmeCardDataAccessObject.selectLicnsSeq(nmeCardValueObject);
		return selectLicnsSeq;
	}
	
	//명함 변경내역 자격증 고유값 조회
	public List<NmeCardHistrValueObject> selectLicnsSeqHistr(NmeCardHistrValueObject nmeCardHistrValueObject) throws Exception {
		Logger.info(null);
		List<NmeCardHistrValueObject> selectLicnsSeqHistr = nmeCardDataAccessObject.selectLicnsSeqHistr(nmeCardHistrValueObject);
		return selectLicnsSeqHistr;
	}
	
	//명함 리스트 조회
	public List<NmeCardValueObject> selectNmeCardList(NmeCardValueObject nmeCardValueObject) throws Exception {
		Logger.info(null);
		int selectNmeCardCount = nmeCardDataAccessObject.selectNmeCardCount(nmeCardValueObject);
		List<NmeCardValueObject> selectNmeCardList = nmeCardDataAccessObject.selectNmeCardList(nmeCardValueObject);
		nmeCardValueObject.setTotalRecordCount(selectNmeCardCount);
		return selectNmeCardList;
	}
	
	//명함 변경내역 리스트 조회
	public List<NmeCardValueObject> selectNmeCardHistrList(NmeCardValueObject nmeCardValueObject) throws Exception {
		Logger.info(null);
		int selectNmeCardHistrCount = nmeCardDataAccessObject.selectNmeCardHistrCount(nmeCardValueObject);
		List<NmeCardValueObject> selectNmeCardHistrList = nmeCardDataAccessObject.selectNmeCardHistrList(nmeCardValueObject);
		nmeCardValueObject.setTotalRecordCount(selectNmeCardHistrCount);
		return selectNmeCardHistrList;
	}
	
	//명함 상세조회
	public NmeCardValueObject selectNmeCardView(NmeCardValueObject nmeCardValueObject) throws Exception {
		Logger.info(null);
		NmeCardValueObject selectNmeCardView = nmeCardDataAccessObject.selectNmeCardView(nmeCardValueObject.getNmeCardSeq());
		selectNmeCardView.setCurrentPageNo(nmeCardValueObject.getCurrentPageNo());
		selectNmeCardView.setSearchCnd(nmeCardValueObject.getSearchCnd());
		selectNmeCardView.setSearchAry(nmeCardValueObject.getSearchAry());
		selectNmeCardView.setSearchWrd(nmeCardValueObject.getSearchWrd());
		return selectNmeCardView;
	}
	
	//명함 변경내역 상세조회
	public NmeCardHistrValueObject selectNmeCardHistrView(NmeCardHistrValueObject nmeCardHistrValueObject) throws Exception {
		Logger.info(null);
		NmeCardHistrValueObject selectNmeCardHistrView = nmeCardDataAccessObject.selectNmeCardHistrView(nmeCardHistrValueObject.getNmeCardHistrSeq());
		return selectNmeCardHistrView;
	}
	
	//명함 수정완료
	public void updateNmeCard(NmeCardValueObject nmeCardValueObject) throws Exception {
		Logger.info(null);
		nmeCardDataAccessObject.updateNmeCard(nmeCardValueObject);
	}
	
	//명함 삭제완료
	public void deleteNmeCard(ArrayList<Integer> deleteArray) throws Exception{
		Logger.info(null);
		nmeCardDataAccessObject.deleteNmeCard(deleteArray);
	}
	
	//명함 완전삭제완료
	public void deleteNmeCardBin(ArrayList<Integer> deleteArray) throws Exception{
		Logger.info(null);
		nmeCardDataAccessObject.deleteNmeCardBin(deleteArray);
	}
	
	//명함 복원
	public void recvyNmeCardBin(ArrayList<Integer> deleteArray) throws Exception{
		Logger.info(null);
		nmeCardDataAccessObject.recvyNmeCardBin(deleteArray);
	}
	
	//명함 자격증 목록
	public List<NmeCardValueObject> selectLicnsList() throws Exception {
		Logger.info(null);
		List<NmeCardValueObject> selectLicnsList = nmeCardDataAccessObject.selectLicnsList();
		System.out.println();
		return selectLicnsList;
	}
	
	//명함 커뮤니케이션 리스트 조회
	public List<ComnctnNmeCardValueObject> selectNmeCardComnctnList(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception {
		System.out.println("NmeCardServiceimpl의 selectNmeCardList()작동");
		int selectNmeCardComnctnCount = nmeCardDataAccessObject.selectNmeCardComnctnCount(comnctnNmeCardValueObject);
		List<ComnctnNmeCardValueObject> selectNmeCardComnctnList = nmeCardDataAccessObject.selectNmeCardComnctnList(comnctnNmeCardValueObject);
		comnctnNmeCardValueObject.setComnctnTotalRecordCount(selectNmeCardComnctnCount);
		return selectNmeCardComnctnList;
	}
	//명함 커뮤니케이션 상세조회
	public ComnctnNmeCardValueObject selectNmeCardComnctnView(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception {
		Logger.info(null);
		ComnctnNmeCardValueObject selectNmeCardComnctnView = nmeCardDataAccessObject.selectNmeCardComnctnView(comnctnNmeCardValueObject);
		return selectNmeCardComnctnView;
	}
	//커뮤니케이션 수정완료
	public void nmeCardComnctnUpdate(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception{
		Logger.info(null);
		System.out.println(comnctnNmeCardValueObject.getComnctnTitl()+"ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ");
		System.out.println(comnctnNmeCardValueObject.getComnctnContn()+"ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ");
		nmeCardDataAccessObject.nmeCardComnctnUpdate(comnctnNmeCardValueObject);
		System.out.println(comnctnNmeCardValueObject.getComnctnSeq()+"커뮤니SEQ");
		System.out.println(comnctnNmeCardValueObject.getMemSeq()+"멤고유값");
		System.out.println(comnctnNmeCardValueObject.getNmeCardSeq()+"명함고유값");
	}
	//명함 커뮤니케이션 삭제
	public void deleteNmeCardComnctn(ArrayList<Integer> deleteArray) throws Exception{
		nmeCardDataAccessObject.deleteNmeCardComnctn(deleteArray);
	}
	
	//나의명함 커뮤니케이션 뉴스피드등록
	public void insertNewSpeedComctn(ComnctnNmeCardValueObject comnctnNmeCardValueObject)throws Exception{
		nmeCardDataAccessObject.insertNewSpeedComctn(comnctnNmeCardValueObject);
	}
	
	//나의명함  공유자 커뮤니케이션 뉴스피드등록
	public void insertNewSpeedComctnCretr(ComnctnNmeCardValueObject comnctnNmeCardValueObject)throws Exception{
		nmeCardDataAccessObject.insertNewSpeedComctnCretr(comnctnNmeCardValueObject);
	}
}
