package net.su.bcms.service;

import java.util.List;

import javax.annotation.Resource;

import net.su.bcms.dataAccessObject.GroupDataAccessObject;
import net.su.bcms.valueObject.GroupValueObject;
import net.su.logger.Logger;

import org.springframework.stereotype.Service;



@Service
public class GroupServiceimpl implements GroupService{
	
	@Resource
	private GroupDataAccessObject groupDataAccessObject;
	
	// 그룹명 등록
	public void groupInsert(GroupValueObject groupValueObject) throws Exception {
		
		groupDataAccessObject.groupInsert(groupValueObject);
	}
	// 그룹명 조회
	public List<GroupValueObject> gropSelect(GroupValueObject groupValueObject) throws Exception{
		
		List<GroupValueObject> groupList = groupDataAccessObject.gropSelect(groupValueObject);
		
		return groupList;
	}
	// 그룹리스트 전체조회
	public List<GroupValueObject> groupWholeList(GroupValueObject groupValueObject) throws Exception{
		
		Logger.info(null);
		int selectGroupCount = groupDataAccessObject.selectGroupCount(groupValueObject);
		List<GroupValueObject> groupWholeList = groupDataAccessObject.groupWholeList(groupValueObject);
		groupValueObject.setMemTotalRecordCount(selectGroupCount);
		return groupWholeList;

	}
	// 그룹회원 추가
	public void groupMemInsert(List<Integer> memInfo, List<Integer> groupList) throws Exception{
		for(int y=0; y<memInfo.size(); y++){
			GroupValueObject VO = new GroupValueObject();
			VO.setMemSeq(memInfo.get(y));
			for(int i=0; i<groupList.size(); i++){
				VO.setGropSeq(groupList.get(i));
				groupDataAccessObject.groupMemInsert(VO);	
			}
		}
	}
	// 그룹회원 삭제
	public void groupMemDelete(List<Integer> memInfo) throws Exception{
		for(int y=0; y<memInfo.size(); y++){
			GroupValueObject VO = new GroupValueObject();
			VO.setGropMemSeq(memInfo.get(y));
			groupDataAccessObject.groupMemDelete(VO);		
		}
	}
	// 그룹명 삭제
	public void groupDelete(GroupValueObject groupValueObject) throws Exception{
		
		groupDataAccessObject.groupDelete(groupValueObject);
		
		groupDataAccessObject.groupMemAllDelete(groupValueObject);
		
	}
	// 그룹명 수정
	public void gropUpdateCommit(GroupValueObject groupValueObject) throws Exception{
		
		groupDataAccessObject.groupUpdateCommit(groupValueObject);
	}
}
