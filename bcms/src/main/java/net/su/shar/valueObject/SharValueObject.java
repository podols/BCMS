package net.su.shar.valueObject;



public class SharValueObject extends  SharSearchAndPageValueObject {

	private String sharUseAt="";
	private String sharCretDate="";
	private String dumpSeq="";
	private int nmeCardSeq;//명함 고유값s
	private int sendMemSeq;
	private int noneSharCount;
	private int MemSeq = 0;
	private String memNme;//회원 이름
	private String memDepmtNme; //부서명
	private int memDepmtSeq; //부서 고유값
	private String memPostnNme;//직급
	private String memEmail; //이메일
	private int gropSeq;
	
	
	public int getSendMemSeq() {
		return sendMemSeq;
	}
	public void setSendMemSeq(int sendMemSeq) {
		this.sendMemSeq = sendMemSeq;
	}
	public int getMemSeq() {
		return MemSeq;
	}
	public void setMemSeq(int memSeq) {
		MemSeq = memSeq;
	}
	public String getSharUseAt() {
		return sharUseAt;
	}
	public void setSharUseAt(String sharUseAt) {
		this.sharUseAt = sharUseAt;
	}
	
	public String getSharCretDate() {
		return sharCretDate;
	}
	public void setSharCretDate(String sharCretDate) {
		this.sharCretDate = sharCretDate;
	}
	
	public int getNmeCardSeq() {
		return nmeCardSeq;
	}
	public void setNmeCardSeq(int nmeCardSeq) {
		this.nmeCardSeq = nmeCardSeq;
	}
	
	public String getDumpSeq() {
		return dumpSeq;
	}
	public void setDumpSeq(String dumpSeq) {
		this.dumpSeq = dumpSeq;
	}
	public int getNoneSharCount() {
		return noneSharCount;
	}
	public void setNoneSharCount(int noneSharCount) {
		this.noneSharCount = noneSharCount;
	}
	public String getMemNme() {
		return memNme;
	}
	public void setMemNme(String memNme) {
		this.memNme = memNme;
	}
	public String getMemDepmtNme() {
		return memDepmtNme;
	}
	public void setMemDepmtNme(String memDepmtNme) {
		this.memDepmtNme = memDepmtNme;
	}
	public int getMemDepmtSeq() {
		return memDepmtSeq;
	}
	public void setMemDepmtSeq(int memDepmtSeq) {
		this.memDepmtSeq = memDepmtSeq;
	}
	public String getMemPostnNme() {
		return memPostnNme;
	}
	public void setMemPostnNme(String memPostnNme) {
		this.memPostnNme = memPostnNme;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public int getGropSeq() {
		return gropSeq;
	}
	public void setGropSeq(int gropSeq) {
		this.gropSeq = gropSeq;
	}
}
