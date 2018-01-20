package net.su.bcms.dataAccessObject;

import java.util.ArrayList;
import java.util.List;

import net.su.bcms.valueObject.ComnctnNmeCardValueObject;
import net.su.bcms.valueObject.ComnctnSearchAndPageValueObject;
import net.su.bcms.valueObject.NmeCardHistrValueObject;
import net.su.bcms.valueObject.NmeCardValueObject;
import net.su.logger.Logger;
import net.su.login.valueObject.MemValueObject;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class NmeCardDataAccessObject extends SqlSessionDaoSupport {
	
	//참석자 고유값 조회
	public List<ComnctnNmeCardValueObject> selectAtndList(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception {
		List<ComnctnNmeCardValueObject> selectAtndList = getSqlSession().selectList("nmeCardMapper.selectAtndList",comnctnNmeCardValueObject);
		return selectAtndList;
	}
	
	//참석자 등록 완료
	public void insertAtnd(String[] atndSeqList, int comnctnSeq) throws Exception{
		Logger.info(null);
		for(int i=0; i<atndSeqList.length;i++){
			String atndSeq = atndSeqList[i];
			ComnctnNmeCardValueObject comnctnNmeCardValueObject = new ComnctnNmeCardValueObject();
			comnctnNmeCardValueObject.setComnctnAtnd(atndSeq); //참석자 seq
			comnctnNmeCardValueObject.setComnctnSeq(comnctnSeq); //커뮤니 seq
			getSqlSession().insert("nmeCardMapper.insertAtnd", comnctnNmeCardValueObject);
		}	
	}			
	
	//회원 리스트 조회
	public List<MemValueObject> selectMemList() throws Exception{
		Logger.info(null);
		List<MemValueObject> selectMemList = getSqlSession().selectList("memMapper.selectMemList");
		return selectMemList;		
	}
	
	//자격증 등록 완료
	public void insertLicns(String[] licnsSeqList, int nmeCardSeq) throws Exception {
		Logger.info(null);
		for(int i=0; i<licnsSeqList.length;i++){
			String licnsSeq = licnsSeqList[i];
			NmeCardValueObject nmeCardValueObject = new NmeCardValueObject();
			nmeCardValueObject.setLicnsSeq(licnsSeq);
			nmeCardValueObject.setNmeCardSeq(nmeCardSeq);
			getSqlSession().insert("nmeCardMapper.insertLicns", nmeCardValueObject);
		}		
	}
	
	//자격증 변경내역 등록 완료
	public void insertLicnsHistr(String[] licnsSeqList, int nmeCardSeq, int selectNmeCardHistrSeq) throws Exception {
		Logger.info(null);
		for(int i=0; i<licnsSeqList.length;i++){
			String licnsSeq = licnsSeqList[i];
			NmeCardValueObject nmeCardValueObject = new NmeCardValueObject();
			nmeCardValueObject.setLicnsSeq(licnsSeq);
			nmeCardValueObject.setNmeCardSeq(nmeCardSeq);
			nmeCardValueObject.setNmeCardHistrSeq(selectNmeCardHistrSeq);
			getSqlSession().insert("nmeCardMapper.insertLicnsHistr", nmeCardValueObject);
		}		
	}
	
	//자격증 삭제 완료
	public void deleteLicns(int nmeCardSeq) throws Exception {
		getSqlSession().delete("nmeCardMapper.deleteLicns", nmeCardSeq);
	}
	
	//명함 등록 완료
	public void insertNmeCard(NmeCardValueObject nmeCardValueObject) throws Exception {
		Logger.info(null);
		getSqlSession().insert("nmeCardMapper.insertNmeCard", nmeCardValueObject);
	}
	
	//명함 변경내역 등록 완료
	public void insertNmeCardHistr(NmeCardValueObject nmeCardValueObject) throws Exception {
		Logger.info(null);
		getSqlSession().insert("nmeCardMapper.insertNmeCardHistr", nmeCardValueObject);
	}
	
	//명함 변경내역 변경컬럼 등록 완료
	public void updateNmeCardHistrUpdateCol (NmeCardValueObject nmeCardValueObject, int selectNmeCardHistrSeq) throws Exception {
		Logger.info(null);
		nmeCardValueObject.setNmeCardHistrSeq(selectNmeCardHistrSeq);
		getSqlSession().update("nmeCardMapper.updateNmeCardHistrUpdateCol", nmeCardValueObject);
	}
		
	//커뮤니케이션 등록 완료
	public void insertNmeCardComnctn(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception {
		Logger.info(null);
		System.out.println("쉼표가뜨는지 확인하는 Dao"+comnctnNmeCardValueObject.getComnctnType());
		getSqlSession().insert("nmeCardMapper.insertNmeCardComnctn", comnctnNmeCardValueObject);
	}
	
	//명함 목록 조회
	public List<NmeCardValueObject> selectNmeCardList(NmeCardValueObject nmeCardValueObject) throws Exception {
		Logger.info(null);
		List<NmeCardValueObject> selectNmeCardList = getSqlSession().selectList("nmeCardMapper.selectNmeCardList", nmeCardValueObject);		
		return selectNmeCardList;
	}
	
	//명함 레코드 조회
	public int selectNmeCardCount(NmeCardValueObject NmeCardValueObject) throws Exception {
		Logger.info(null);
		int selectNmeCardCount = getSqlSession().selectOne("nmeCardMapper.selectNmeCardCount", NmeCardValueObject);
		return selectNmeCardCount;
	}
	
	//명함 변경내역 목록 조회
	public List<NmeCardValueObject> selectNmeCardHistrList(NmeCardValueObject nmeCardValueObject) throws Exception {
		Logger.info(null);
		List<NmeCardValueObject> selectNmeCardHistrList = getSqlSession().selectList("nmeCardMapper.selectNmeCardHistrList", nmeCardValueObject);		
		return selectNmeCardHistrList;
	}
	
	//명함 변경내역 레코드 조회
	public int selectNmeCardHistrCount(NmeCardValueObject NmeCardValueObject) throws Exception {
		Logger.info(null);
		int selectNmeCarddHistrCount = getSqlSession().selectOne("nmeCardMapper.selectNmeCardHistrCount", NmeCardValueObject);
		return selectNmeCarddHistrCount;
	}
	
	//명함 변경내역 상세 조회
	public NmeCardHistrValueObject selectNmeCardHistrView(int nmeCardHistrSeq) throws Exception {
		Logger.info(null);
		NmeCardHistrValueObject selectNmeCardHistrView = getSqlSession().selectOne("nmeCardMapper.selectNmeCardHistrView", nmeCardHistrSeq);
		return selectNmeCardHistrView;
	}
	
	//명함 변경내역 고유값 조회
	public int selectNmeCardHistrSeq(NmeCardValueObject nmeCardValueObject) throws Exception {
		Logger.info(null);
		int selectNmeCardHistrSeq = getSqlSession().selectOne("nmeCardMapper.selectNmeCardHistrSeq", nmeCardValueObject);
		return selectNmeCardHistrSeq;
	}
	
	//명함 자격증 고유값 조회
	public List<NmeCardValueObject> selectLicnsSeq(NmeCardValueObject nmeCardValueObject) throws Exception {
		List<NmeCardValueObject> selectLicnsSeq = getSqlSession().selectList("nmeCardMapper.selectLicnsSeq",nmeCardValueObject);
		return selectLicnsSeq;
	}
	
	//명함 자격증 고유값 조회
	public List<NmeCardHistrValueObject> selectLicnsSeqHistr(NmeCardHistrValueObject nmeCardHistrValueObject) throws Exception {
		List<NmeCardHistrValueObject> selectLicnsSeqHistr = getSqlSession().selectList("nmeCardMapper.selectLicnsSeqHistr",nmeCardHistrValueObject);
		return selectLicnsSeqHistr;
	}
	
	//명함 상세 조회
	public NmeCardValueObject selectNmeCardView(int nmeCardSeq) throws Exception {
		Logger.info(null);
		NmeCardValueObject selectNmeCardView = getSqlSession().selectOne("nmeCardMapper.selectNmeCardView", nmeCardSeq);
		return selectNmeCardView;
	}
	
	//명함 수정 완료
	public void updateNmeCard(NmeCardValueObject nmeCardValueObject) throws Exception {
		Logger.info(null);
		getSqlSession().update("nmeCardMapper.updateNmeCard", nmeCardValueObject);
	}
	
	//명함 삭제 완료
	public void deleteNmeCard(ArrayList<Integer> deleteArray) throws Exception {
		Logger.info(null);
		for(int i=0; i<deleteArray.size();i++){
			int nmeCardSeq = deleteArray.get(i);
			getSqlSession().update("nmeCardMapper.deleteNmeCard", nmeCardSeq);
		}
	}
	
	//명함 완전 삭제
	public void deleteNmeCardBin(ArrayList<Integer> deleteArray) throws Exception {
		Logger.info(null);
		for(int i=0; i<deleteArray.size();i++){
			int nmeCardSeq = deleteArray.get(i);
			getSqlSession().update("nmeCardMapper.deleteNmeCardBin", nmeCardSeq);
		}
	}
	
	//명함 복원
	public void recvyNmeCardBin(ArrayList<Integer> deleteArray) throws Exception {
		Logger.info(null);
		for(int i=0; i<deleteArray.size();i++){
			int nmeCardSeq = deleteArray.get(i);
			getSqlSession().update("nmeCardMapper.recvyNmeCardBin", nmeCardSeq);
		}
	}
	
	//명함 자격증 목록 조회
	public List<NmeCardValueObject> selectLicnsList() throws Exception {
		List<NmeCardValueObject> selectLicnsList = getSqlSession().selectList("nmeCardMapper.selectLicnsList");
		return selectLicnsList;
	}
	
	//명함 커뮤니케이션 리스트 조회
	public List<ComnctnNmeCardValueObject> selectNmeCardComnctnList(ComnctnNmeCardValueObject ComnctnNmeCardValueObject) throws Exception {
		System.out.println("NmeCardDataAccessObject의 selectNmeCardComnctnList()작동");
		System.out.println(ComnctnNmeCardValueObject.getComnctnType()+"!!!!!!!!!!!!!!!!!!!!!!");
		List<ComnctnNmeCardValueObject> selectComnctnNmeCardList = getSqlSession().selectList("nmeCardMapper.selectNmeCardComnctnList", ComnctnNmeCardValueObject);
		return selectComnctnNmeCardList;
		}
	
	//커뮤니케이션 상세 조회
	public ComnctnNmeCardValueObject selectNmeCardComnctnView(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception {
		Logger.info(null);
		ComnctnNmeCardValueObject selectNmeCardComnctnView = getSqlSession().selectOne("nmeCardMapper.selectNmeCardComnctnView", comnctnNmeCardValueObject);
		System.out.println("업데이트때 도는겨 마는겨 디에이오");
		return selectNmeCardComnctnView;
	}
	//커뮤니케이션 수정완료
	public ComnctnNmeCardValueObject nmeCardComnctnUpdate(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception {
		Logger.info(null);
		System.out.println(comnctnNmeCardValueObject.getComnctnSeq()+"커뮤니SEQ");
		System.out.println(comnctnNmeCardValueObject.getMemSeq()+"멤고유값");
		System.out.println(comnctnNmeCardValueObject.getNmeCardSeq()+"명함고유값");
		getSqlSession().update("nmeCardMapper.nmeCardComnctnUpdate", comnctnNmeCardValueObject);
		return comnctnNmeCardValueObject;
	}
	
	// 커뮤니케이션 리스트 카운트
	public int selectNmeCardComnctnCount(ComnctnSearchAndPageValueObject comnctnSearchAndPageValueObject) throws Exception {
		Logger.info("selectNmeCardComnctnCount()작동");
		int selectNmeCardComnctnCount = getSqlSession().selectOne("nmeCardMapper.selectNmeCardComnctnCount", comnctnSearchAndPageValueObject);
		return selectNmeCardComnctnCount;
	}
	
	//커뮤니케이션 삭제
	public void deleteNmeCardComnctn(ArrayList<Integer> deleteArray) throws Exception {
		for(int i=0; i<deleteArray.size();i++){
			int nmeCardcomnctnSeq = deleteArray.get(i);
			getSqlSession().update("nmeCardMapper.deleteNmeCardComnctn", nmeCardcomnctnSeq);
		}
	}
	
	//나의명함 커뮤니케이션 뉴스피드등록
	public void insertNewSpeedComctn(ComnctnNmeCardValueObject comnctnNmeCardValueObject)throws Exception{
		getSqlSession().insert("nmeCardMapper.insertNewSpeedComctn", comnctnNmeCardValueObject);
	}
	
	//나의명함  공유자 커뮤니케이션 뉴스피드등록
	public void insertNewSpeedComctnCretr(ComnctnNmeCardValueObject comnctnNmeCardValueObject)throws Exception{
		getSqlSession().insert("nmeCardMapper.insertNewSpeedComctnCretr", comnctnNmeCardValueObject);
	}
	
}
