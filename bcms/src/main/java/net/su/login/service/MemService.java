package net.su.login.service;

import java.util.List;
import java.util.Map;

import net.su.login.valueObject.MemValueObject;
import net.su.login.valueObject.CompnValueObject;

public interface MemService {

	public int confirm(MemValueObject memValueObject) throws Exception;
	//로그인 세션
	public MemValueObject selectMemInfo(MemValueObject memValueObject) throws Exception;
	//회원가입
	public void insertMembership (MemValueObject memValueObject) throws Exception;
	//사용자 세션
	public MemValueObject selectUserSession (MemValueObject memValueObject) throws Exception;
	//회원정보 수정 화면
	public MemValueObject memSelectViewForm (MemValueObject memValueObject)throws Exception;
	//회원정보 수정
	public void updateMembership (MemValueObject memValueObject) throws Exception;
	//아이디 중복확인
//	public int idCheck(String memId)throws Exception;
	//아이디 확인 ajax
	public Map<String, Object> idCheck (String memId)throws Exception;
	//회사 조회
	public List<CompnValueObject> compnList(CompnValueObject compnValueObject) throws Exception;
	//부서 조회
	public List<CompnValueObject> depmtList(CompnValueObject compnValueObject) throws Exception;
	//회사 등록
	public void insertCompn(MemValueObject memValueObject) throws Exception;
	//부서 등록
	public void insertDepmt(MemValueObject memValueObject) throws Exception;
	//회사등록 ajax
	public Map<String, Object> compnAjax(CompnValueObject compnValueObject)throws Exception;
	//회사 중복확인 ajax
	public Map<String, Object> compnNmeCheck (String memCompnNme)throws Exception;
	//부서 중복확인 ajax
	public Map<String, Object> depmtNmeCheck (String memDepmtNme)throws Exception;
}
