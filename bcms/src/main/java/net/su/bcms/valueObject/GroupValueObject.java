package net.su.bcms.valueObject;

public class GroupValueObject extends MemPageValueObject{

	private int gropSeq; //그룹 seq
	private String gropNme; // 그룹명
	private String gropCretDate; // 그룹생성일자
	private int gropMemSeq; // 그룹회원 seq
	private String gropMemCretDate; //그룹회원 생성일자
	private int memSeq; //회원 seq
	private String memNme; // 회원이름
	private String depmtNme; // 회원 직급
	private String memPostnNme; //회원 부서
	private String memEmail; // 회원 이메일
	private String memMobil; // 회원 휴대폰
	private int gropDelSeq; // 삭제 seq
	private int updateGropSeq =1; // update seq
	private String updateGropNme; // 업데이트 할 이름
	private int updateCount; // update 카운트

	
	
	public int getUpdateCount() {
		return updateCount;
	}
	public void setUpdateCount(int updateCount) {
		this.updateCount = updateCount;
	}
	public String getUpdateGropNme() {
		return updateGropNme;
	}
	public void setUpdateGropNme(String updateGropNme) {
		this.updateGropNme = updateGropNme;
	}
	public int getUpdateGropSeq() {
		return updateGropSeq;
	}
	public void setUpdateGropSeq(int updateGropSeq) {
		this.updateGropSeq = updateGropSeq;
	}
	public int getGropDelSeq() {
		return gropDelSeq;
	}
	public void setGropDelSeq(int gropDelSeq) {
		this.gropDelSeq = gropDelSeq;
	}
	public String getDepmtNme() {
		return depmtNme;
	}
	public void setMemDepmtNme(String depmtNme) {
		this.depmtNme = depmtNme;
	}
	public String getMemPostnNme() {
		return memPostnNme;
	}
	public void setMemPostnNme(String memPostnNme) {
		this.memPostnNme = memPostnNme;
	}
	public String getMemMobil() {
		return memMobil;
	}
	public void setMemMobil(String memMobil) {
		this.memMobil = memMobil;
	}
	public String getMemNme() {
		return memNme;
	}
	public void setMemNme(String memNme) {
		this.memNme = memNme;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public int getMemSeq() {
		return memSeq;
	}
	public void setMemSeq(int memSeq) {
		this.memSeq = memSeq;
	}
	public int getGropSeq() {
		return gropSeq;
	}
	public void setGropSeq(int gropSeq) {
		this.gropSeq = gropSeq;
	}
	public String getGropNme() {
		return gropNme;
	}
	public void setGropNme(String gropNme) {
		this.gropNme = gropNme;
	}
	public String getGropCretDate() {
		return gropCretDate;
	}
	public void setGropCretDate(String gropCretDate) {
		this.gropCretDate = gropCretDate;
	}
	public int getGropMemSeq() {
		return gropMemSeq;
	}
	public void setGropMemSeq(int gropMemSeq) {
		this.gropMemSeq = gropMemSeq;
	}
	public String getGropMemCretDate() {
		return gropMemCretDate;
	}
	public void setGropMemCretDate(String gropMemCretDate) {
		this.gropMemCretDate = gropMemCretDate;
	}
	
	
	
	

}
