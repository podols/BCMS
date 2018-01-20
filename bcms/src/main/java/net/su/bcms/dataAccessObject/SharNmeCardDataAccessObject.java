package net.su.bcms.dataAccessObject;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import net.su.bcms.valueObject.ComnctnNmeCardValueObject;
import net.su.bcms.valueObject.ComnctnSearchAndPageValueObject;
import net.su.bcms.valueObject.NmeCardValueObject;
import net.su.bcms.valueObject.SearchAndPageValueObject;
import net.su.logger.Logger;
import net.su.login.valueObject.MemValueObject;

@Repository
public class SharNmeCardDataAccessObject extends SqlSessionDaoSupport {
	
	//참석자 고유값 조회
	public List<ComnctnNmeCardValueObject> selectAtndList(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception {
		List<ComnctnNmeCardValueObject> selectAtndList = getSqlSession().selectList("sharNmeCardMapper.selectAtndList",comnctnNmeCardValueObject);
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
			getSqlSession().insert("sharNmeCardMapper.insertAtnd", comnctnNmeCardValueObject);
		}	
	}			
	
	//명함 삭제 완료
	public void deleteSharNmeCard(ArrayList<Integer> deleteArray, int memSeq) throws Exception {
		Logger.info(null);
		
		NmeCardValueObject nmeCardVo = new NmeCardValueObject();
		for(int i=0; i<deleteArray.size();i++){
			int sharSeq = deleteArray.get(i);
			
			nmeCardVo.setSharSeq(sharSeq);
			nmeCardVo.setMemSeq(memSeq);
			getSqlSession().update("sharNmeCardMapper.deleteSharNmeCard", nmeCardVo);
		}
	}
	
	//명함 완전 삭제
	public void deleteSharNmeCardBin(ArrayList<Integer> deleteArray, int memSeq) throws Exception {
		Logger.info(null);
		NmeCardValueObject nmeCardVo = new NmeCardValueObject();
		
		for(int i=0; i<deleteArray.size();i++){
			int sharSeq = deleteArray.get(i);
			
			nmeCardVo.setSharSeq(sharSeq);
			nmeCardVo.setMemSeq(memSeq);
			getSqlSession().update("sharNmeCardMapper.deleteSharNmeCardBin", nmeCardVo);
		}
	}
	
	//명함 복원
	public void recvySharNmeCardBin(ArrayList<Integer> deleteArray, int memSeq) throws Exception {
		Logger.info(null);
		NmeCardValueObject nmeCardVo = new NmeCardValueObject();
		for(int i=0; i<deleteArray.size();i++){
			int sharSeq = deleteArray.get(i);
			nmeCardVo.setSharSeq(sharSeq);
			nmeCardVo.setMemSeq(memSeq);
			getSqlSession().update("sharNmeCardMapper.recvySharNmeCardBin", nmeCardVo);
		}
	}
	
	//회원 리스트 조회
	public List<MemValueObject> selectMemList() throws Exception{
		Logger.info(null);
		List<MemValueObject> selectMemList = getSqlSession().selectList("memMapper.selectMemList");
		return selectMemList;		
	}

	//공유명함 리스트 조회
	public List<NmeCardValueObject> selectSharNmeCardList(NmeCardValueObject nmeCardValueObject) throws Exception {
		Logger.info(null);
		List<NmeCardValueObject> selectSharNmeCardList = getSqlSession().selectList("sharNmeCardMapper.selectSharNmeCardList", nmeCardValueObject);		
		return selectSharNmeCardList;
	}
	//공유명함 레코드 조회
	public int selectSharNmeCardCount(NmeCardValueObject NmeCardValueObject) throws Exception {
		Logger.info(null);
		int selectSharNmeCardCount = getSqlSession().selectOne("sharNmeCardMapper.selectSharNmeCardCount", NmeCardValueObject);
		return selectSharNmeCardCount;
	}
	//공유명함 상세 조회
	public NmeCardValueObject selectSharNmeCardView(NmeCardValueObject nmeCardValueObject) throws Exception {
		Logger.info(null);
		NmeCardValueObject selectSharNmeCardView = getSqlSession().selectOne("sharNmeCardMapper.selectSharNmeCardView", nmeCardValueObject);
		return selectSharNmeCardView;
	}
	//명함 자격증 고유값 조회
	public List<NmeCardValueObject> selectLicnsSeq(NmeCardValueObject nmeCardValueObject) throws Exception {
		List<NmeCardValueObject> selectLicnsSeq = getSqlSession().selectList("nmeCardMapper.selectLicnsSeq",nmeCardValueObject);
		return selectLicnsSeq;
	}
	
	//공유명함 커뮤니케이션 리스트 조회
		public List<ComnctnNmeCardValueObject> selectSharNmeCardComnctnList(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception {
			System.out.println("SharNmeCardDataAccessObject의 selectSharNmeCardComnctnList()작동");
			List<ComnctnNmeCardValueObject> selectSharNmeCardComnctnList = getSqlSession().selectList("sharNmeCardMapper.selectSharNmeCardComnctnList", comnctnNmeCardValueObject);
			return selectSharNmeCardComnctnList;
			}
	
	//공유명함 커뮤니케이션 리스트 카운트
	public int selectSharNmeCardComnctnCount(ComnctnSearchAndPageValueObject comnctnSearchAndPageValueObject) throws Exception {
		Logger.info("selectSharNmeCardComnctnCount()작동");
		int selectSharNmeCardComnctnCount = getSqlSession().selectOne("sharNmeCardMapper.selectSharNmeCardComnctnCount", comnctnSearchAndPageValueObject);
		return selectSharNmeCardComnctnCount;
	}
	
	//공유명함 커뮤니케이션 삭제
	public void deleteSharNmeCardComnctn(ArrayList<Integer> deleteArray) throws Exception {
		for(int i=0; i<deleteArray.size();i++){
			int sharNmeCardcomnctnSeq = deleteArray.get(i);
			getSqlSession().delete("sharNmeCardMapper.deleteSharNmeCardComnctn", sharNmeCardcomnctnSeq);
		}
	}
	
	//공유명함 커뮤니케이션 등록
	public void insertSharNmeCardComnctn(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception {
		Logger.info(null);
		System.out.println("쉼표가뜨는지 확인하는 Dao"+comnctnNmeCardValueObject.getComnctnType());
		getSqlSession().insert("sharNmeCardMapper.insertSharNmeCardComnctn", comnctnNmeCardValueObject);
	}
	
	//공유명함 커뮤니케이션 상세 조회
	public ComnctnNmeCardValueObject selectSharNmeCardComnctnView(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception {
		Logger.info(null);
		ComnctnNmeCardValueObject selectSharNmeCardComnctnView = getSqlSession().selectOne("sharNmeCardMapper.selectSharNmeCardComnctnView", comnctnNmeCardValueObject);
		return selectSharNmeCardComnctnView;
	}
	
	//공유명함 커뮤니케이션 수정
	public void updateSharNmeCardComnctn(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception {
		Logger.info(null);
		System.out.println(comnctnNmeCardValueObject.getComnctnSeq()+"커뮤니SEQ");
		System.out.println(comnctnNmeCardValueObject.getMemSeq()+"멤고유값");
		System.out.println(comnctnNmeCardValueObject.getNmeCardSeq()+"명함고유값");
		getSqlSession().update("sharNmeCardMapper.updateSharNmeCardComnctn", comnctnNmeCardValueObject);
	}
	
	//공유명함  커뮤니케이션 뉴스피드등록
	public void insertNewSpeedSharComctn(ComnctnNmeCardValueObject comnctnNmeCardValueObject)throws Exception{
		getSqlSession().insert("sharNmeCardMapper.insertNewSpeedSharComctn", comnctnNmeCardValueObject);
	}
	
	//공유명함  공유자 커뮤니케이션 뉴스피드등록
	public void insertNewSpeedSharComctnCretr(ComnctnNmeCardValueObject comnctnNmeCardValueObject)throws Exception{
		getSqlSession().insert("sharNmeCardMapper.insertNewSpeedSharComctnCretr", comnctnNmeCardValueObject);
	}
}