package net.su.bcms.dataAccessObject;

import net.su.bcms.valueObject.GroupValueObject;
import net.su.bcms.valueObject.NmeCardValueObject;
import net.su.logger.Logger;

import java.util.List; 

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


@Repository
public class GroupDataAccessObject  extends SqlSessionDaoSupport{
	// 그룹명 등록
	public void groupInsert(GroupValueObject groupValueObject) throws Exception{	

		getSqlSession().insert("groupMapper.groupInsert", groupValueObject);

	}
	// 그룹명 조회
	public List<GroupValueObject> gropSelect(GroupValueObject groupValueObject) throws Exception
	{
	
		List<GroupValueObject> groupList = getSqlSession().selectList("groupMapper.groplist", groupValueObject);
		return groupList;
	}
	// 그룹리스트 전체조회
	public List<GroupValueObject> groupWholeList(GroupValueObject groupValueObject) throws Exception
	{
	
		List<GroupValueObject> groupWholeList = getSqlSession().selectList("groupMapper.groupWholeList", groupValueObject);
		return groupWholeList;
	}
	
//	public List<GroupValueObject> groupAllList(GroupValueObject groupValueObject) throws Exception
//	{
//	
//		List<GroupValueObject> groupAllList = getSqlSession().selectList("groupMapper.groupAllList", groupValueObject);
//		return groupAllList;
//	}
	// 레코드 검색
	public int selectGroupCount(GroupValueObject groupValueObject) throws Exception {
		Logger.info(null);
		int selectGroupCount = getSqlSession().selectOne("groupMapper.selectGroupCount", groupValueObject);
		return selectGroupCount;
	}
	// 그룹회원 추가
	public void groupMemInsert(GroupValueObject groupValueObject) throws Exception {
		
		getSqlSession().delete("groupMapper.groupCleaner", groupValueObject);
		getSqlSession().insert("groupMapper.groupMemInsert", groupValueObject);
		}
	// 그룹회원 삭제
	public void groupMemDelete(GroupValueObject groupValueObject) throws Exception {

		getSqlSession().delete("groupMapper.groupMemDelete", groupValueObject);
	}
	// 그룹명 삭제
	public void groupDelete(GroupValueObject groupValueObject) throws Exception{	

		getSqlSession().delete("groupMapper.groupDelete", groupValueObject);
	}
	
	//그룹명 삭제(그룹회원 같이 삭제)
	public void groupMemAllDelete(GroupValueObject groupValueObject) throws Exception{	

		getSqlSession().delete("groupMapper.groupMemAllDelete", groupValueObject);
	}
	// 그룹명 수정
	public void groupUpdateCommit(GroupValueObject groupValueObject) throws Exception{	

		getSqlSession().delete("groupMapper.groupUpdateCommit", groupValueObject);
	}
}
