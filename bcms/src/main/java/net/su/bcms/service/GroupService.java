package net.su.bcms.service;

import java.util.List; 
import net.su.bcms.valueObject.GroupValueObject;

public interface GroupService {
	
	public void groupInsert(GroupValueObject groupValueObject) throws Exception; // 그룹명 등록
	
	public List<GroupValueObject> gropSelect(GroupValueObject groupValueObject) throws Exception; // 그룹명 조회
	
	public List<GroupValueObject> groupWholeList(GroupValueObject groupValueObject) throws Exception; // 그룹리스트 전체 조회
	
	public void groupMemInsert(List<Integer> memInfo, List<Integer> groupList) throws Exception; // 그룹회원 추가
	
	public void groupMemDelete(List<Integer> memInfo) throws Exception; // 그룹회원 삭제
	
	public void groupDelete(GroupValueObject groupValueObject) throws Exception; // 그룹명 삭제

	public void gropUpdateCommit(GroupValueObject groupValueObject) throws Exception; // 그룹명 수정
}
