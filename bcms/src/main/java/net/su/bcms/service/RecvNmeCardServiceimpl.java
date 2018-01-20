package net.su.bcms.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.su.bcms.dataAccessObject.RecvNmeCardDataAccessObject;
import net.su.bcms.valueObject.ComnctnNmeCardValueObject;
import net.su.bcms.valueObject.NmeCardValueObject;
import net.su.logger.Logger;

@Service

public class RecvNmeCardServiceimpl implements RecvNmeCardService {
	
	@Resource
	private RecvNmeCardDataAccessObject recvNmeCardDataAccessObject;
	
	//받은 명함 리스트
	public List<NmeCardValueObject> selectRecvNmeCardList(NmeCardValueObject nmeCardValueObject) throws Exception {
		Logger.info(null);
		int selectRecvNmeCardCount = recvNmeCardDataAccessObject.selectRecvNmeCardCount(nmeCardValueObject);
		List<NmeCardValueObject> selectRecvNmeCardList = recvNmeCardDataAccessObject.selectRecvNmeCardList(nmeCardValueObject);
		nmeCardValueObject.setTotalRecordCount(selectRecvNmeCardCount);
		return selectRecvNmeCardList;
	}
	
	//받은 명함 상세보기
	public NmeCardValueObject selectRecvNmeCardView(NmeCardValueObject nmeCardValueObject) throws Exception {
		Logger.info(null);
		NmeCardValueObject recvNmeCardValueObject = recvNmeCardDataAccessObject.selectRecvNmeCardView(nmeCardValueObject);
		recvNmeCardValueObject.setCurrentPageNo(nmeCardValueObject.getCurrentPageNo());
		recvNmeCardValueObject.setSearchCnd(nmeCardValueObject.getSearchCnd());
		recvNmeCardValueObject.setSearchAry(nmeCardValueObject.getSearchAry());
		recvNmeCardValueObject.setSearchWrd(nmeCardValueObject.getSearchWrd());
		return recvNmeCardValueObject;
	}
	
	//명함 삭제완료
	public void deleteRecvNmeCard(ArrayList<Integer> deleteArray, int memSeq) throws Exception{
		Logger.info(null);
		recvNmeCardDataAccessObject.deleteRecvNmeCard(deleteArray, memSeq);
	}
	
	//명함 완전삭제완료
	public void deleteRecvNmeCardBin(ArrayList<Integer> deleteArray, int memSeq) throws Exception{
		Logger.info(null);
		recvNmeCardDataAccessObject.deleteRecvNmeCardBin(deleteArray, memSeq);
	}
	
	//명함 복원
	public void recvyRecvNmeCardBin(ArrayList<Integer> deleteArray, int memSeq) throws Exception{
		Logger.info(null);
		recvNmeCardDataAccessObject.recvyRecvNmeCardBin(deleteArray, memSeq);
	}
	
	//받은 명함 커뮤니케이션 리스트
	public List<ComnctnNmeCardValueObject> selectRecvNmeCardComnctnList(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception {
		Logger.info("selectRecvNmeCardComnctnList()작동");
		int selectRecvNmeCardComnctnCount = recvNmeCardDataAccessObject.selectRecvNmeCardComnctnCount(comnctnNmeCardValueObject);
		List<ComnctnNmeCardValueObject> selectRecvNmeCardComnctnList = recvNmeCardDataAccessObject.selectRecvNmeCardComnctnList(comnctnNmeCardValueObject);
		comnctnNmeCardValueObject.setComnctnTotalRecordCount(selectRecvNmeCardComnctnCount);
		return selectRecvNmeCardComnctnList;
	}
	
	//받은 명함 커뮤니케이션 상세보기
	public ComnctnNmeCardValueObject selectRecvNmeCardComnctnView(ComnctnNmeCardValueObject comnctnNmeCardValueObject) throws Exception{
		Logger.info("selectRecvNmeCardComnctnView()작동");
		ComnctnNmeCardValueObject selectRecvNmeCardComnctnView = recvNmeCardDataAccessObject.selectRecvNmeCardComnctnView(comnctnNmeCardValueObject);
		return selectRecvNmeCardComnctnView;
	}


}
