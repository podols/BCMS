package net.su.bcms.dataAccessObject;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import net.su.bcms.valueObject.NmeCardValueObject;
import net.su.bcms.valueObject.ComnctnNmeCardValueObject;
import net.su.bcms.valueObject.ComnctnSearchAndPageValueObject;
import net.su.logger.Logger;

@Repository
public class RecvNmeCardDataAccessObject extends SqlSessionDaoSupport {

	//받은 명함 리스트
	public List<NmeCardValueObject> selectRecvNmeCardList(NmeCardValueObject nmeCardValueObject) throws Exception {
		Logger.info(null);
		List<NmeCardValueObject> selectRecvNmeCardList = getSqlSession().selectList("recvNmeCardMapper.selectRecvNmeCardList", nmeCardValueObject);
		return selectRecvNmeCardList;
	}
	
	//받은 명함 리스트 카운트
	public int selectRecvNmeCardCount(NmeCardValueObject NmeCardValueObject) throws Exception {
		Logger.info(null); 
		int selectRecvNmeCardCount = getSqlSession().selectOne("recvNmeCardMapper.selectRecvNmeCardCount", NmeCardValueObject);
		return selectRecvNmeCardCount;
	}
	
	//받은 명함 상세보기
	public NmeCardValueObject selectRecvNmeCardView(NmeCardValueObject NmeCardValueObject) throws Exception {
		Logger.info(null);
		NmeCardValueObject recvNmeCardValueObject = getSqlSession().selectOne("recvNmeCardMapper.selectRecvNmeCardView", NmeCardValueObject);
		return recvNmeCardValueObject;
	}
	
	//명함 삭제 완료
	public void deleteRecvNmeCard(ArrayList<Integer> deleteArray, int memSeq) throws Exception {
		Logger.info(null);
		
		NmeCardValueObject nmeCardValueObject = new NmeCardValueObject();
		
		for(int i=0; i<deleteArray.size();i++){
			int nmeCardSeq = deleteArray.get(i);
			
			nmeCardValueObject.setMemSeq(memSeq);
			nmeCardValueObject.setNmeCardSeq(nmeCardSeq);
			System.out.println(nmeCardValueObject.getNmeCardSeq()+"찍혀라 젲발요");
			
			getSqlSession().update("recvNmeCardMapper.deleteRecvNmeCard", nmeCardValueObject);
		}
	}
	
	//명함 완전 삭제
	public void deleteRecvNmeCardBin(ArrayList<Integer> deleteArray, int memSeq) throws Exception {
		Logger.info(null);
		
		NmeCardValueObject nmeCardValueObject = new NmeCardValueObject();
		for(int i=0; i<deleteArray.size();i++){
			int nmeCardSeq = deleteArray.get(i);
			
			nmeCardValueObject.setMemSeq(memSeq);
			nmeCardValueObject.setNmeCardSeq(nmeCardSeq);
			System.out.println(nmeCardValueObject.getNmeCardSeq()+"찍혀라 젲발요");
			
			getSqlSession().update("recvNmeCardMapper.deleteRecvNmeCardBin", nmeCardValueObject);
		}
	}
	
	//명함 복원
	public void recvyRecvNmeCardBin(ArrayList<Integer> deleteArray, int memSeq) throws Exception {
		Logger.info(null);
		
		NmeCardValueObject nmeCardValueObject = new NmeCardValueObject();
		
		for(int i=0; i<deleteArray.size();i++){
			int nmeCardSeq = deleteArray.get(i);
			
			nmeCardValueObject.setMemSeq(memSeq);
			nmeCardValueObject.setNmeCardSeq(nmeCardSeq);
			System.out.println(nmeCardValueObject.getNmeCardSeq()+"찍혀라 젲발요");
			
			getSqlSession().update("recvNmeCardMapper.recvyRecvNmeCardBin", nmeCardValueObject);
		}
	}
		
	// 받은 명함 커뮤니케이션 리스트
	public List<ComnctnNmeCardValueObject> selectRecvNmeCardComnctnList(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception {
		Logger.info("selectRecvNmeCardComnctnList()작동");
		List<ComnctnNmeCardValueObject> selectRecvNmeCardComnctnList = getSqlSession().selectList("recvNmeCardMapper.selectRecvNmeCardComnctnList", comnctnNmeCardValueObject);
		return selectRecvNmeCardComnctnList;
	}
	
	// 받은 명함 커뮤니케이션 리스트 카운트
	public int selectRecvNmeCardComnctnCount(ComnctnSearchAndPageValueObject comnctnSearchAndPageValueObject) throws Exception {
		Logger.info("selectRecvNmeCardComnctnCount()작동");
		int selectRecvNmeCardComnctnCount = getSqlSession().selectOne("recvNmeCardMapper.selectRecvNmeCardComnctnCount", comnctnSearchAndPageValueObject);
		return selectRecvNmeCardComnctnCount;
	}
	
	// 받은 명함 커뮤니케이션 상세보기
	public ComnctnNmeCardValueObject selectRecvNmeCardComnctnView(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception{
		Logger.info("selectRecvNmeCardComnctnView()작동");
		ComnctnNmeCardValueObject selectRecvNmeCardComnctnView = getSqlSession().selectOne("recvNmeCardMapper.selectRecvNmeCardComnctnView", comnctnNmeCardValueObject);
		return selectRecvNmeCardComnctnView;
	}
}
