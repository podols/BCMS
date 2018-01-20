package net.su.login.dataAccessObject;

import java.util.List;

import net.su.login.valueObject.MemValueObject;
import net.su.login.valueObject.CompnValueObject;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class MemDataAccessObject extends SqlSessionDaoSupport {

	
	public int confirm(MemValueObject memValueObject) throws Exception {
		System.out.println("MemDataAccessObject의 confirm() 작동");
		int confirm = getSqlSession().selectOne("memMapper.confirm", memValueObject);
		return confirm;
	}
	
	public MemValueObject selectMemInfo(MemValueObject memValueObject) throws Exception {
		System.out.println("MemDataAccessObject의 selectMemInfo() 작동");
		memValueObject = getSqlSession().selectOne("memMapper.selectMemInfo", memValueObject);
		return memValueObject;
	}
	
	//회원 고유값 생성
	public int selectMemSeq()throws Exception{
		System.out.println("MemDataAccessObjewct의 selectMemSeq()작동");
		int selectMemSeq = getSqlSession().selectOne("memMapper.selectMemSeq");
		return selectMemSeq;
	}
	
	//회원 등록
	public void insertMembership (MemValueObject memValueObject) throws Exception{
		System.out.println(memValueObject.getMemSeq()+"부서이름");
		System.out.println(memValueObject.getMemPostnNme()+"부서이름");
		
		getSqlSession().insert("memMapper.insertMembership", memValueObject);
	}
	
	//로그인 세션
	public MemValueObject selectUserSession (MemValueObject memValueObject) throws Exception{
		
		MemValueObject selectUserSession=getSqlSession().selectOne("memMapper.selectUserSession", memValueObject);
		
		return selectUserSession;
	}
	
	//회사, 부서 조회
	public MemValueObject compnDepmtSelect (MemValueObject memValueObject)throws Exception{
		
		MemValueObject compnDepmtSelect = getSqlSession().selectOne("memMapper.compnDepmtSelect", memValueObject);
		
		return compnDepmtSelect;
	}
	
	//회사 seq 조회
	public MemValueObject selectCompnDepmtSeq(MemValueObject memValueObject)throws Exception{
		System.out.println("MemDataAccessObjewct의 selectMemSeq()작동");
		MemValueObject selectCompnDepmtSeq = getSqlSession().selectOne("memMapper.selectCompnDepmtSeq", memValueObject);
		return selectCompnDepmtSeq;
	}
	
//	//부서 seq 조회
//	public int selectDepmtSeq(MemValueObject memValueObject)throws Exception{
//		System.out.println("MemDataAccessObjewct의 selectMemSeq()작동");
//		int selectDepmtSeq = getSqlSession().selectOne("memMapper.selectDepmtSeq", memValueObject);
//		return selectDepmtSeq;
//	}
	
	
	//회원정보 수정 화면
	public MemValueObject memSelectViewForm (MemValueObject memValueObject)throws Exception{
		
		MemValueObject memSelectViewForm = getSqlSession().selectOne("memMapper.memSelectViewForm", memValueObject);
		
		return memSelectViewForm;
	}
	
	//회원정보 수정
	public void updateMembership (MemValueObject memValueObject)throws Exception{
		
		getSqlSession().update("memMapper.updateMembership", memValueObject);
		
	}
	
	//아아디 중복확인
//	public int idCheck(String memId)throws Exception{
//
//		int idResult = getSqlSession().selectOne("memMapper.idCheck", memId);
//		
//		return idResult;
//	}
	
	//아이디 중복 확인 ajax
	public int idCheck (String memId)throws Exception{
		
		int idCheck = getSqlSession().selectOne("memMapper.idCheck", memId);
		System.out.println("dsadsadsadasd");
		return idCheck;
	}
	
	//회사 조회
	public List<CompnValueObject> compnList(CompnValueObject compnValueObject)throws Exception{
		
		List<CompnValueObject> compnList = getSqlSession().selectList("memMapper.compnList", compnValueObject);
		
		return compnList;
	}
	
	//부서 조회
	public List<CompnValueObject> depmtList(CompnValueObject compnValueObject)throws Exception{
		
		List<CompnValueObject> depmtList = getSqlSession().selectList("memMapper.depmtList", compnValueObject);
		
		return depmtList;
	}
	
	//회사 등록
	public void insertCompn (MemValueObject memValueObject) throws Exception{
		
		getSqlSession().insert("memMapper.insertCompn", memValueObject);
		
	}
	
	//회사 seq 생성
	
	
	public int selectCompnSeq() throws Exception{
		
		int selectCompnSeq = getSqlSession().selectOne("memMapper.selectCompnSeq");
		
		return selectCompnSeq;
	}
	
	//부서 등록
	public void insertDepmt (MemValueObject memValueObject) throws Exception{
		
		getSqlSession().insert("memMapper.insertDepmt", memValueObject);
		
	}
	
	
	//부서 seq 생성
	public int selectDepmtSeq() throws Exception{
		
		int selectDepmtSeq = getSqlSession().selectOne("memMapper.selectDepmtSeq");
		
		return selectDepmtSeq;
	}
	
	//회사 중복확인 ajax
	public int compnNmeCheck (String memCompnNme)throws Exception{
		
		int compnNmeCheck = getSqlSession().selectOne("memMapper.compnNmeCheck", memCompnNme);
		System.out.println("dsadsadsadasd");
		return compnNmeCheck;
	}
	
	//부서 중복확인 ajax
	public int depmtNmeCheck (String memDepmtNme)throws Exception{
		
		int depmtNmeCheck = getSqlSession().selectOne("memMapper.depmtNmeCheck", memDepmtNme);
		System.out.println("dsadsadsadasd");
		return depmtNmeCheck;
	}
	
}