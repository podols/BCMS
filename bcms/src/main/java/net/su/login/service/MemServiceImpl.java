package net.su.login.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.su.login.valueObject.CompnValueObject;
import net.su.login.dataAccessObject.MemDataAccessObject;
import net.su.login.valueObject.MemValueObject;
import net.su.login.security.Base64Utils;

import org.springframework.stereotype.Service;

@Service
public class MemServiceImpl implements MemService {
	
	@Resource
	private MemDataAccessObject memDataAccessObject;
	Base64Utils base64 = new Base64Utils();//요놈선언
	String encryptKey = "temp11111111111111111111";//key 선언 
	//키값은 무조건 24자리이여야 한듯.
	//Base64Utils.java 파일에서 키값의 길이를 수정하면 될것도 같으나,
	//seed 암호화에서 key값이 원래 24자리가 필요할지도 몰라서 그냥 1로 채움
	//seed + base64 암호화, 복호화
	
	public int confirm(MemValueObject memValueObject) throws Exception {
		System.out.println("MemServiceImpl의 confirm() 작동");
		//기본 pw
		String W_ORG_FG = memValueObject.getMemPw();
		//암호화 pw
		String EN_ORG_FG = base64.encrypt(W_ORG_FG,encryptKey);
		memValueObject.setMemPw(EN_ORG_FG);
		int confirm = memDataAccessObject.confirm(memValueObject);
		return confirm;
	}

	public MemValueObject selectMemInfo(MemValueObject memValueObject) throws Exception {
		System.out.println("MemServiceImpl의 selectMemInfo() 작동");
		memValueObject = memDataAccessObject.selectMemInfo(memValueObject);
		return memValueObject;
	}
	
	//회원가입
	public void insertMembership (MemValueObject memValueObject) throws Exception{
		memValueObject.setMemSeq(memDataAccessObject.selectMemSeq());
		//기본 pw
		String W_ORG_FG = memValueObject.getMemPw();
		//암호화 pw
		String EN_ORG_FG = base64.encrypt(W_ORG_FG,encryptKey);
		memValueObject.setMemPw(EN_ORG_FG);
		memDataAccessObject.insertMembership(memValueObject);
	}
	//로그인 세션
	public MemValueObject selectUserSession (MemValueObject memValueObject) throws Exception{
		
		MemValueObject selectUserSession = memDataAccessObject.selectUserSession(memValueObject);
			
		return selectUserSession;
	}
	
	//회원정보 수정 화면 
	public MemValueObject memSelectViewForm (MemValueObject memValueObject)throws Exception{
		
		MemValueObject selectCompnDepmtSeq =  memDataAccessObject.selectCompnDepmtSeq(memValueObject);
		memValueObject.setMemCompnSeq(selectCompnDepmtSeq.getMemCompnSeq());
		memValueObject.setMemDepmtSeq(selectCompnDepmtSeq.getMemDepmtSeq());
		MemValueObject memSelectViewForm =  memDataAccessObject.memSelectViewForm(memValueObject);
		return memSelectViewForm;
	}
	//회원정보 수정
	public void updateMembership (MemValueObject memValueObject) throws Exception{
		//기본 pw
		String W_ORG_FG = memValueObject.getMemPw();
		//암호화 pw
		String EN_ORG_FG = base64.encrypt(W_ORG_FG,encryptKey);
		memValueObject.setMemPw(EN_ORG_FG);
		memDataAccessObject.updateMembership(memValueObject);
		
	}
	
	//아이디 중복 확인
//	public int idCheck(String memId)throws Exception{
//		
//		int idResult = memDataAccessObject.idCheck(memId);
//		System.out.println(idResult+"서비스서비스서비스서비스서비스서비스서비스서비스서비스서비스서비스서비스");
//		return idResult;
//	}
	
	//아이디 중복 확인 ajax
	public Map<String, Object> idCheck (String memId)throws Exception{
		
		int idCheck =  memDataAccessObject.idCheck(memId);
		System.out.println("dsadsadsadasd"+idCheck);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idCheck", idCheck);
		return map;
	}
	
	//회사 조회
	public List<CompnValueObject> compnList(CompnValueObject compnValueObject) throws Exception{
		
		List<CompnValueObject> compnList = memDataAccessObject.compnList(compnValueObject);
		
		return compnList;
	}
	
	//부서 조회
	public List<CompnValueObject> depmtList(CompnValueObject compnValueObject) throws Exception{
		
		List<CompnValueObject> depmtList = memDataAccessObject.depmtList(compnValueObject);
		
		return depmtList;
	}
	
	//회사 등록
	public void insertCompn(MemValueObject memValueObject) throws Exception{
		
		memValueObject.setMemCompnSeq(memDataAccessObject.selectCompnSeq());
		memDataAccessObject.insertCompn(memValueObject);
		
	}
	//회사 등록 ajax
	public Map<String, Object> compnAjax(CompnValueObject compnValueObject)throws Exception{
		
		Map<String, Object> map = new HashMap<String,Object>();
		List<CompnValueObject> compnList = memDataAccessObject.compnList(compnValueObject);
		map.put("compnList", compnList);
		
		return map;
	}
	
	//부서 등록
	public void insertDepmt(MemValueObject memValueObject) throws Exception{
		
		memValueObject.setMemDepmtSeq(memDataAccessObject.selectDepmtSeq());
		memDataAccessObject.insertDepmt(memValueObject);
	}
	
	//회사 중복확인
	public Map<String, Object> compnNmeCheck (String memCompnNme)throws Exception{
		
		int compnNmeCheck =  memDataAccessObject.compnNmeCheck(memCompnNme);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("compnNmeCheck", compnNmeCheck);
		return map;
	}
	
	//부서 중복확인 ajax
	public Map<String, Object> depmtNmeCheck (String memDepmtNme)throws Exception{
		
		int depmtNmeCheck =  memDataAccessObject.depmtNmeCheck(memDepmtNme);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("depmtNmeCheck", depmtNmeCheck);
		return map;
	}
}
