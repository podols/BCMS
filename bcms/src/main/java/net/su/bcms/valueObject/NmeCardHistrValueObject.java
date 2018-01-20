package net.su.bcms.valueObject;

public class NmeCardHistrValueObject extends SearchAndPageValueObject {
	
	private int nmeCardHistrSeq; //명함 변경내역 고유값
	private String nmeCardHistrJobNme = "";//직무 이름
	private String nmeCardHistrPostnNme = "";//직급 이름
	private int nmeCardHistrCompnSeq;//회사 고유값
	private int nmeCardHistrDepmtSeq;//부서 고유값
	private String nmeCardHistrCompnNme = "";//회사 이름
	private String nmeCardHistrDepmtNme = "";//부서 이름
	private String nmeCardHistrLastNme = "";//명함 성
	private String nmeCardHistrFirstNme = "";//명함 이름
	private String nmeCardHistrNme = "";//명함 이름
	private String nmeCardHistrSex = "";//명함 성별
	private String nmeCardHistrPostNum = "";//명함 우편번호
	private String nmeCardHistrBascAdrs = "";//명함 기본주소
	private String nmeCardHistrDetlAdrs = "";//명함 상세주소
	private String nmeCardHistrAdrs = "";//명함 주소
	private String nmeCardHistrMobil = "";//명함 휴대폰
	private String nmeCardHistrTel = "";//명함 전화
	private String nmeCardHistrFax = "";//명함 팩스
	private String nmeCardHistrEmail = "";//명함 이메일
	private String nmeCardHistrHompg = "";//명함 홈페이지
	private String nmeCardHistrHob = "";//명함 취미
	private String nmeCardHistrInterst = "";//명함 관심사
	private int nmeCardSeq;//명함 고유값
	private String nmeCardHistrUseAt = "";//명함 사용여부
	private String nmeCardHistrCretDate = "";//명함 생성일자
	private String nmeCardHistrSns = "";//명함 SNS
	private String nmeCardHistrMesngr = "";//명함 메신저
	private int nmeCardHistrCretrSeq;// 명함 생성자 고유값
	private String nmeCardHistrMemNme = "";// 명함 생성자 이름
//	private String nmeCardLicns = "";//명함 자격증
	private int nmeCardHistrIndex; //명함 변경내역 글번호
	private String nmeCardHistrUpdateCol = "";//명함 변경내역 변경컬럼
	
	public String getNmeCardHistrUpdateCol() {
		return nmeCardHistrUpdateCol;
	}
	public void setNmeCardHistrUpdateCol(String nmeCardHistrUpdateCol) {
		this.nmeCardHistrUpdateCol = nmeCardHistrUpdateCol;
	}
	public String getNmeCardHistrCompnNme() {
		return nmeCardHistrCompnNme;
	}
	public void setNmeCardHistrCompnNme(String nmeCardHistrCompnNme) {
		this.nmeCardHistrCompnNme = nmeCardHistrCompnNme;
	}
	public String getNmeCardHistrDepmtNme() {
		return nmeCardHistrDepmtNme;
	}
	public void setNmeCardHistrDepmtNme(String nmeCardHistrDepmtNme) {
		this.nmeCardHistrDepmtNme = nmeCardHistrDepmtNme;
	}
	public int getNmeCardHistrIndex() {
		return nmeCardHistrIndex;
	}
	public void setNmeCardHistrIndex(int nmeCardHistrIndex) {
		this.nmeCardHistrIndex = nmeCardHistrIndex;
	}
	public String getNmeCardHistrNme() {
		return nmeCardHistrNme;
	}
	public int getNmeCardHistrSeq() {
		return nmeCardHistrSeq;
	}
	public void setNmeCardHistrSeq(int nmeCardHistrSeq) {
		this.nmeCardHistrSeq = nmeCardHistrSeq;
	}
	public void setNmeCardHistrNme(String nmeCardHistrNme) {
		this.nmeCardHistrNme = nmeCardHistrNme;
	}
	public String getNmeCardHistrAdrs() {
		return nmeCardHistrAdrs;
	}
	public void setNmeCardHistrAdrs(String nmeCardHistrAdrs) {
		this.nmeCardHistrAdrs = nmeCardHistrAdrs;
	}
	public String getNmeCardHistrJobNme() {
		return nmeCardHistrJobNme;
	}
	public void setNmeCardHistrJobNme(String nmeCardHistrJobNme) {
		this.nmeCardHistrJobNme = nmeCardHistrJobNme;
	}
	public String getNmeCardHistrPostnNme() {
		return nmeCardHistrPostnNme;
	}
	public void setNmeCardHistrPostnNme(String nmeCardHistrPostnNme) {
		this.nmeCardHistrPostnNme = nmeCardHistrPostnNme;
	}
	public int getNmeCardHistrCompnSeq() {
		return nmeCardHistrCompnSeq;
	}
	public void setNmeCardHistrCompnSeq(int nmeCardHistrCompnSeq) {
		this.nmeCardHistrCompnSeq = nmeCardHistrCompnSeq;
	}
	public int getNmeCardHistrDepmtSeq() {
		return nmeCardHistrDepmtSeq;
	}
	public void setNmeCardHistrDepmtSeq(int nmeCardHistrDepmtSeq) {
		this.nmeCardHistrDepmtSeq = nmeCardHistrDepmtSeq;
	}
	public String getNmeCardHistrLastNme() {
		return nmeCardHistrLastNme;
	}
	public void setNmeCardHistrLastNme(String nmeCardHistrLastNme) {
		this.nmeCardHistrLastNme = nmeCardHistrLastNme;
	}
	public String getNmeCardHistrFirstNme() {
		return nmeCardHistrFirstNme;
	}
	public void setNmeCardHistrFirstNme(String nmeCardHistrFirstNme) {
		this.nmeCardHistrFirstNme = nmeCardHistrFirstNme;
	}
	public String getNmeCardHistrSex() {
		return nmeCardHistrSex;
	}
	public void setNmeCardHistrSex(String nmeCardHistrSex) {
		this.nmeCardHistrSex = nmeCardHistrSex;
	}
	public String getNmeCardHistrPostNum() {
		return nmeCardHistrPostNum;
	}
	public void setNmeCardHistrPostNum(String nmeCardHistrPostNum) {
		this.nmeCardHistrPostNum = nmeCardHistrPostNum;
	}
	public String getNmeCardHistrBascAdrs() {
		return nmeCardHistrBascAdrs;
	}
	public void setNmeCardHistrBascAdrs(String nmeCardHistrBascAdrs) {
		this.nmeCardHistrBascAdrs = nmeCardHistrBascAdrs;
	}
	public String getNmeCardHistrDetlAdrs() {
		return nmeCardHistrDetlAdrs;
	}
	public void setNmeCardHistrDetlAdrs(String nmeCardHistrDetlAdrs) {
		this.nmeCardHistrDetlAdrs = nmeCardHistrDetlAdrs;
	}
	public String getNmeCardHistrMobil() {
		return nmeCardHistrMobil;
	}
	public void setNmeCardHistrMobil(String nmeCardHistrMobil) {
		this.nmeCardHistrMobil = nmeCardHistrMobil;
	}
	public String getNmeCardHistrTel() {
		return nmeCardHistrTel;
	}
	public void setNmeCardHistrTel(String nmeCardHistrTel) {
		this.nmeCardHistrTel = nmeCardHistrTel;
	}
	public String getNmeCardHistrFax() {
		return nmeCardHistrFax;
	}
	public void setNmeCardHistrFax(String nmeCardHistrFax) {
		this.nmeCardHistrFax = nmeCardHistrFax;
	}
	public String getNmeCardHistrEmail() {
		return nmeCardHistrEmail;
	}
	public void setNmeCardHistrEmail(String nmeCardHistrEmail) {
		this.nmeCardHistrEmail = nmeCardHistrEmail;
	}
	public String getNmeCardHistrHompg() {
		return nmeCardHistrHompg;
	}
	public void setNmeCardHistrHompg(String nmeCardHistrHompg) {
		this.nmeCardHistrHompg = nmeCardHistrHompg;
	}
	public String getNmeCardHistrHob() {
		return nmeCardHistrHob;
	}
	public void setNmeCardHistrHob(String nmeCardHistrHob) {
		this.nmeCardHistrHob = nmeCardHistrHob;
	}
	public String getNmeCardHistrInterst() {
		return nmeCardHistrInterst;
	}
	public void setNmeCardHistrInterst(String nmeCardHistrInterst) {
		this.nmeCardHistrInterst = nmeCardHistrInterst;
	}
	public int getNmeCardSeq() {
		return nmeCardSeq;
	}
	public void setNmeCardSeq(int nmeCardSeq) {
		this.nmeCardSeq = nmeCardSeq;
	}
	public String getNmeCardHistrUseAt() {
		return nmeCardHistrUseAt;
	}
	public void setNmeCardHistrUseAt(String nmeCardHistrUseAt) {
		this.nmeCardHistrUseAt = nmeCardHistrUseAt;
	}
	public String getNmeCardHistrCretDate() {
		return nmeCardHistrCretDate;
	}
	public void setNmeCardHistrCretDate(String nmeCardHistrCretDate) {
		this.nmeCardHistrCretDate = nmeCardHistrCretDate;
	}
	public String getNmeCardHistrSns() {
		return nmeCardHistrSns;
	}
	public void setNmeCardHistrSns(String nmeCardHistrSns) {
		this.nmeCardHistrSns = nmeCardHistrSns;
	}
	public String getNmeCardHistrMesngr() {
		return nmeCardHistrMesngr;
	}
	public void setNmeCardHistrMesngr(String nmeCardHistrMesngr) {
		this.nmeCardHistrMesngr = nmeCardHistrMesngr;
	}
	public int getNmeCardHistrCretrSeq() {
		return nmeCardHistrCretrSeq;
	}
	public void setNmeCardHistrCretrSeq(int nmeCardHistrCretrSeq) {
		this.nmeCardHistrCretrSeq = nmeCardHistrCretrSeq;
	}
	public String getNmeCardHistrMemNme() {
		return nmeCardHistrMemNme;
	}
	public void setNmeCardHistrMemNme(String nmeCardHistrMemNme) {
		this.nmeCardHistrMemNme = nmeCardHistrMemNme;
	}
}
