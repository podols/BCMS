package net.su.shar.dataAccessObject;

import java.util.HashMap;
import java.util.List;
import net.su.shar.valueObject.SharValueObject;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class SharDataAccessObject extends SqlSessionDaoSupport {

	// 공유 임시저장소 List
	public List<SharValueObject> selectDumpList(SharValueObject sharVo){
		List<SharValueObject> dumpMemList = getSqlSession().selectList("sharMapper.dumpMemList", sharVo);
		return dumpMemList;
	}
	
	// 공유 되지 않은 리스트
	public List<SharValueObject> selectNonSharList(SharValueObject sharVo){
		List<SharValueObject> nonSharMemList = getSqlSession().selectList("sharMapper.nonSharMemList", sharVo);
		return nonSharMemList;
	}
	
	// 공유 되지 않는 사람 카운트
	public int noneSharMemCount(SharValueObject sharVo){
		int noneSharMemCount = getSqlSession().selectOne("sharMapper.noneSharMemCount", sharVo);
		return noneSharMemCount;
	}
	
	// 공유 중인 멤버
	public List<SharValueObject> selectSharList(SharValueObject sharVo){
		List<SharValueObject> sharMemList = getSqlSession().selectList("sharMapper.sharMemList", sharVo);
		return sharMemList;
	}
	
	// 공유 중인 멤버 카운트
	public int sharMemCount(SharValueObject sharVo) throws Exception{	
		int sharMemCount = getSqlSession().selectOne("sharMapper.sharMemCount", sharVo);	
		return sharMemCount;
	}	
	
	// 전체 멤버
	public List<SharValueObject> selectMemList(SharValueObject sharVo){
		List<SharValueObject> selectMemList = getSqlSession().selectList("sharMapper.selectMemList", sharVo);
		return selectMemList; 
	}
	
	// 공유 '+' 기능
	public void plusingProcessor(SharValueObject VO){
		getSqlSession().insert("sharMapper.insertDump", VO); // 임시 저장소에 추가	
	}
	
	// 공유 '-' 기능
	public void minusingProcessor(SharValueObject VO){
		getSqlSession().delete("sharMapper.deleteDump", VO); // dump에서 삭제
		
	}
	
	// 공유 실행
	public void dumpToShar(SharValueObject sharVo){
		getSqlSession().update("sharMapper.sharBinDelete",sharVo);
		getSqlSession().insert("sharMapper.dumpToShar", sharVo);// dump에서 insert로.
		getSqlSession().insert("sharMapper.newSpeedSharInsert", sharVo);// dump에서 insert로.
		getSqlSession().delete("sharMapper.dumpCleaning", sharVo);// dump 청소.
	}
	
	// 공유 취소
	public void dumpCancel(SharValueObject sharVo){
		getSqlSession().delete("sharMapper.dumpCleaning", sharVo);// dump 청소.
	}
	
	// 공유 해제 기능
	public void remvSharRecv(SharValueObject VO){
		getSqlSession().delete("sharMapper.remvSharRecv", VO);
		getSqlSession().update("sharMapper.newSpeedSharRels", VO); // dump에서 삭제
		
	}

	// 보내기 전체 멤버 리스트
	public List<SharValueObject> allMemList(int where){
		List<SharValueObject> allMemList = getSqlSession().selectList("sharMapper.allMemList", where);
	

		return allMemList;
	}
	
	
	// 보내기 임시저장소 리스트
	public List<SharValueObject> sendMemList(List<Integer> senderInfo, SharValueObject sharVo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("senderInfo", senderInfo);
		map.put("sharVo", sharVo);

		List<SharValueObject> sendMemList = getSqlSession().selectList("sharMapper.sendMemList",  map);
		return sendMemList;
	}
	
	// 보내기 안 보내는 멤버 카운트
	public int noneSendMemCount(List<Integer> senderInfo, SharValueObject sharVo) throws Exception{	
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("senderInfo", senderInfo);
		map.put("sharVo", sharVo);
		int noneSendMemCount = getSqlSession().selectOne("sharMapper.noneSendMemCount", map);	
		return noneSendMemCount;
	}	
	
	// 보내기 임시저장소 리스트
	public List<SharValueObject> noneSendMemList(List<Integer> senderInfo, SharValueObject sharVo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("senderInfo", senderInfo);
		map.put("sharVo", sharVo);
		List<SharValueObject> noneSendMemList = getSqlSession().selectList("sharMapper.noneSendMemList", map);
		return noneSendMemList;
	}	
	
	// 보내기 '+' 기능
	public void addSendRecv(SharValueObject VO){	
		getSqlSession().insert("sharMapper.addSendRecv", VO);
	}
	
	// 보내기 '-' 기능
	public void remvSendRecv(SharValueObject VO){
		getSqlSession().delete("sharMapper.remvSendRecv", VO);
	}
	
	// 보내기 실행
	public void InsertSend(List<Integer> senderInfo, SharValueObject sharVo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("senderInfo", senderInfo);
		map.put("sharVo", sharVo);
		getSqlSession().insert("sharMapper.insertSend", map);  //보내기 실행
		getSqlSession().insert("sharMapper.newSpeedSendInsert", map);  //보내기 뉴스피드 추가
		getSqlSession().insert("sharMapper.cancelSend", map);  //임시저장소 초기화
	}
	
	// 보내기 취소
	public void cancelSend(List<Integer> senderInfo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("senderInfo", senderInfo);
		getSqlSession().insert("sharMapper.cancelSend", map);
	}
}
