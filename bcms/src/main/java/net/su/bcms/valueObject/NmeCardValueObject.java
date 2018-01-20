package net.su.bcms.valueObject;

public class NmeCardValueObject extends SearchAndPageValueObject {
	
	private int cretrSeq;// 명함 생성자 고유값
	private int nmeCardSeq;//명함 고유값
	private String nmeCardLastNme = "";//명함 성
	private String nmeCardFirstNme = "";//명함 이름
	private String nmeCardNme = "";//명함 이름 
	private String nmeCardSex = "";//명함 성별
	private String nmeCardPostNum = "";//명함 우편번호
	private String nmeCardBascAdrs = "";//명함 기본주소
	private String nmeCardDetlAdrs = "";//명함 상세주소
	private String nmeCardAdrs = "";//명함 주소
	private String nmeCardMobil = "";//명함 휴대폰
	private String nmeCardMobil2 = "";//명함 휴대폰2
	private String nmeCardMobil3 = "";//명함 휴대폰3
	private String nmeCardTel = "";//명함 전화
	private String nmeCardTel2 = "";//명함 전화2
	private String nmeCardTel3 = "";//명함 전화3
	private String nmeCardFax = "";//명함 팩스
	private String nmeCardFax2 = "";//명함 팩스2
	private String nmeCardFax3 = "";//명함 팩스3
	private String nmeCardEmail = "";//명함 이메일
	private String nmeCardEmail2 = "";//명함 이메일2
	private String nmeCardHompg = "";//명함 홈페이지
	private String nmeCardHob = "";//명함 취미
	private String nmeCardInterst = "";//명함 관심사
	private String nmeCardJobNme = "";//직무 이름
	private String nmeCardPostnNme = "";//직급 이름
	private int nmeCardCompnSeq;//회사 고유값
	private int nmeCardDepmtSeq;//부서 고유값
	private String nmeCardCompnNme = "";//회사 이름
	private String nmeCardDepmtNme = "";//부서 이름
	private String nmeCardSns = "";//명함 SNS
	private String nmeCardSns2 = "";//명함 SNS2
	private String nmeCardMesngr = "";//명함 메신저
	private String nmeCardMesngr2 = "";//명함 메신저2
	private String nmeCardLicns = "";//명함 자격증
	private String nmeCardCretDate = "";//명함 생성일자
	private String nmeCardDateUseAt = "";//명함 New 여부
	private String nmeCardUseAt = "";//명함 사용여부
	private String recvNmeCardUseAt = "";//  받은 명함 사용여부
	private String recvNmeCardBinUseAt = "";//받은 명함 휴지통 사용여부
	private String licnsSeq = ""; //자격증 고유값	
	private String licnsNme = "";//자격증 이름
	private String licnsType = "";//자격증 종류
	private String licnsCretDate = "";//자격증 생성일자
	private String licnsHavSeq;//자격증 보유 고유값
	private int nmeCardHistrSeq;//명함 변경내역 고유값
	private String sharType = ""; //공유여부
	private String sharCretDate = "";//공유날짜
	private int memSeq;//회원고유값
	private String sharUseAtBinType = ""; //공유휴지통 사용여부
	private int comnctnSharSeq;//받은명함 고유값
	private int sharSeq; // 공유 고유값
	private int comnctnSharCretDate;
	private String recvNmeCardDateUseAt;
	
	public int getSharSeq() {
		return sharSeq;
	}
	public void setSharSeq(int sharSeq) {
		this.sharSeq = sharSeq;
	}
	public String getSharUseAtBinType() {
		return sharUseAtBinType;
	}
	public void setSharUseAtBinType(String sharUseAtBinType) {
		this.sharUseAtBinType = sharUseAtBinType;
	}
	public String getNmeCardDateUseAt() {
		return nmeCardDateUseAt;
	}
	public void setNmeCardDateUseAt(String nmeCardDateUseAt) {
		this.nmeCardDateUseAt = nmeCardDateUseAt;
	}
	public String getSharCretDate() {
		return sharCretDate;
	}
	public void setSharCretDate(String sharCretDate) {
		this.sharCretDate = sharCretDate;
	}
	public int getMemSeq() {
		return memSeq;
	}
	public void setMemSeq(int memSeq) {
		this.memSeq = memSeq;
	}
	public String getSharType() {
		return sharType;
	}
	public void setSharType(String sharType) {
		this.sharType = sharType;
	}
	public String getNmeCardCompnNme() {
		return nmeCardCompnNme;
	}
	public void setNmeCardCompnNme(String nmeCardCompnNme) {
		this.nmeCardCompnNme = nmeCardCompnNme;
	}
	public String getNmeCardDepmtNme() {
		return nmeCardDepmtNme;
	}
	public void setNmeCardDepmtNme(String nmeCardDepmtNme) {
		this.nmeCardDepmtNme = nmeCardDepmtNme;
	}
	public int getNmeCardHistrSeq() {
		return nmeCardHistrSeq;
	}
	public void setNmeCardHistrSeq(int nmeCardHistrSeq) {
		this.nmeCardHistrSeq = nmeCardHistrSeq;
	}
	public String getLicnsHavSeq() {
		return licnsHavSeq;
	}
	public void setLicnsHavSeq(String licnsHavSeq) {
		this.licnsHavSeq = licnsHavSeq;
	}
	public String getNmeCardLicns() {
		return nmeCardLicns;
	}
	public void setNmeCardLicns(String nmeCardLicns) {
		this.nmeCardLicns = nmeCardLicns;
	}
	public int getCretrSeq() {
		return cretrSeq;
	}
	public void setCretrSeq(int cretrSeq) {
		this.cretrSeq = cretrSeq;
	}
	public String getLicnsSeq() {
		return licnsSeq;
	}
	public void setLicnsSeq(String licnsSeq) {
		this.licnsSeq = licnsSeq;
	}
	public String getLicnsNme() {
		return licnsNme;
	}
	public void setLicnsNme(String licnsNme) {
		this.licnsNme = licnsNme;
	}
	public String getLicnsType() {
		return licnsType;
	}
	public void setLicnsType(String licnsType) {
		this.licnsType = licnsType;
	}
	public String getLicnsCretDate() {
		return licnsCretDate;
	}
	public void setLicnsCretDate(String licnsCretDate) {
		this.licnsCretDate = licnsCretDate;
	}
	public String getNmeCardSns() {
		return nmeCardSns;
	}
	public void setNmeCardSns(String nmeCardSns) {
		this.nmeCardSns = nmeCardSns;
	}
	public String getNmeCardSns2() {
		return nmeCardSns2;
	}
	public void setNmeCardSns2(String nmeCardSns2) {
		this.nmeCardSns2 = nmeCardSns2;
	}
	public String getNmeCardMesngr() {
		return nmeCardMesngr;
	}
	public void setNmeCardMesngr(String nmeCardMesngr) {
		this.nmeCardMesngr = nmeCardMesngr;
	}
	public String getNmeCardMesngr2() {
		return nmeCardMesngr2;
	}
	public void setNmeCardMesngr2(String nmeCardMesngr2) {
		this.nmeCardMesngr2 = nmeCardMesngr2;
	}
	public String getNmeCardAdrs() {
		return nmeCardAdrs;
	}
	public void setNmeCardAdrs(String nmeCardAdrs) {
		this.nmeCardAdrs = nmeCardAdrs;
	}
	public String getNmeCardCretDate() {
		return nmeCardCretDate;
	}
	public void setNmeCardCretDate(String nmeCardCretDate) {
		this.nmeCardCretDate = nmeCardCretDate;
	}
	public String getNmeCardUseAt() {
		return nmeCardUseAt;
	}
	public void setNmeCardUseAt(String nmeCardUseAt) {
		this.nmeCardUseAt = nmeCardUseAt;
	}
	public int getNmeCardSeq() {
		return nmeCardSeq;
	}
	public String getNmeCardLastNme() {
		return nmeCardLastNme;
	}

	public void setNmeCardLastNme(String nmeCardLastNme) {
		this.nmeCardLastNme = nmeCardLastNme;
	}

	public String getNmeCardFirstNme() {
		return nmeCardFirstNme;
	}

	public void setNmeCardFirstNme(String nmeCardFirstNme) {
		this.nmeCardFirstNme = nmeCardFirstNme;
	}

	public void setNmeCardSeq(int nmeCardSeq) {
		this.nmeCardSeq = nmeCardSeq;
	}
	public String getNmeCardNme() {
		return nmeCardNme;
	}
	public void setNmeCardNme(String nmeCardNme) {
		this.nmeCardNme = nmeCardNme;
	}
	public String getNmeCardSex() {
		return nmeCardSex;
	}
	public void setNmeCardSex(String nmeCardSex) {
		this.nmeCardSex = nmeCardSex;
	}
	public String getNmeCardPostNum() {
		return nmeCardPostNum;
	}
	public void setNmeCardPostNum(String nmeCardPostNum) {
		this.nmeCardPostNum = nmeCardPostNum;
	}
	public String getNmeCardBascAdrs() {
		return nmeCardBascAdrs;
	}
	public void setNmeCardBascAdrs(String nmeCardBascAdrs) {
		this.nmeCardBascAdrs = nmeCardBascAdrs;
	}
	public String getNmeCardDetlAdrs() {
		return nmeCardDetlAdrs;
	}
	public void setNmeCardDetlAdrs(String nmeCardDetlAdrs) {
		this.nmeCardDetlAdrs = nmeCardDetlAdrs;
	}
	public String getNmeCardMobil() {
		return nmeCardMobil;
	}
	public void setNmeCardMobil(String nmeCardMobil) {
		this.nmeCardMobil = nmeCardMobil;
	}
	public String getNmeCardMobil2() {
		return nmeCardMobil2;
	}
	public void setNmeCardMobil2(String nmeCardMobil2) {
		this.nmeCardMobil2 = nmeCardMobil2;
	}
	public String getNmeCardMobil3() {
		return nmeCardMobil3;
	}
	public void setNmeCardMobil3(String nmeCardMobil3) {
		this.nmeCardMobil3 = nmeCardMobil3;
	}
	public String getNmeCardTel() {
		return nmeCardTel;
	}
	public void setNmeCardTel(String nmeCardTel) {
		this.nmeCardTel = nmeCardTel;
	}
	public String getNmeCardTel2() {
		return nmeCardTel2;
	}
	public void setNmeCardTel2(String nmeCardTel2) {
		this.nmeCardTel2 = nmeCardTel2;
	}
	public String getNmeCardTel3() {
		return nmeCardTel3;
	}
	public void setNmeCardTel3(String nmeCardTel3) {
		this.nmeCardTel3 = nmeCardTel3;
	}
	public String getNmeCardFax() {
		return nmeCardFax;
	}
	public void setNmeCardFax(String nmeCardFax) {
		this.nmeCardFax = nmeCardFax;
	}
	public String getNmeCardFax2() {
		return nmeCardFax2;
	}
	public void setNmeCardFax2(String nmeCardFax2) {
		this.nmeCardFax2 = nmeCardFax2;
	}
	public String getNmeCardFax3() {
		return nmeCardFax3;
	}
	public void setNmeCardFax3(String nmeCardFax3) {
		this.nmeCardFax3 = nmeCardFax3;
	}
	public String getNmeCardEmail() {
		return nmeCardEmail;
	}
	public void setNmeCardEmail(String nmeCardEmail) {
		this.nmeCardEmail = nmeCardEmail;
	}
	public String getNmeCardEmail2() {
		return nmeCardEmail2;
	}
	public void setNmeCardEmail2(String nmeCardEmail2) {
		this.nmeCardEmail2 = nmeCardEmail2;
	}
	public String getNmeCardHompg() {
		return nmeCardHompg;
	}
	public void setNmeCardHompg(String nmeCardHompg) {
		this.nmeCardHompg = nmeCardHompg;
	}
	public String getNmeCardHob() {
		return nmeCardHob;
	}
	public void setNmeCardHob(String nmeCardHob) {
		this.nmeCardHob = nmeCardHob;
	}
	public String getNmeCardInterst() {
		return nmeCardInterst;
	}
	public void setNmeCardInterst(String nmeCardInterst) {
		this.nmeCardInterst = nmeCardInterst;
	}
	public String getNmeCardJobNme() {
		return nmeCardJobNme;
	}
	public void setNmeCardJobNme(String nmeCardJobNme) {
		this.nmeCardJobNme = nmeCardJobNme;
	}
	public String getNmeCardPostnNme() {
		return nmeCardPostnNme;
	}
	public void setNmeCardPostnNme(String nmeCardPostnNme) {
		this.nmeCardPostnNme = nmeCardPostnNme;
	}
	public int getNmeCardCompnSeq() {
		return nmeCardCompnSeq;
	}
	public void setNmeCardCompnSeq(int nmeCardCompnSeq) {
		this.nmeCardCompnSeq = nmeCardCompnSeq;
	}
	public int getNmeCardDepmtSeq() {
		return nmeCardDepmtSeq;
	}
	public void setNmeCardDepmtSeq(int nmeCardDepmtSeq) {
		this.nmeCardDepmtSeq = nmeCardDepmtSeq;
	}
	public String getRecvNmeCardUseAt() {
		return recvNmeCardUseAt;
	}
	public void setRecvNmeCardUseAt(String recvNmeCardUseAt) {
		this.recvNmeCardUseAt = recvNmeCardUseAt;
	}
	public String getRecvNmeCardBinUseAt() {
		return recvNmeCardBinUseAt;
	}
	public void setRecvNmeCardBinUseAt(String recvNmeCardBinUseAt) {
		this.recvNmeCardBinUseAt = recvNmeCardBinUseAt;
	}
	public int getComnctnSharSeq() {
		return comnctnSharSeq;
	}
	public void setComnctnSharSeq(int comnctnSharSeq) {
		this.comnctnSharSeq = comnctnSharSeq;
	}
	public int getComnctnSharCretDate() {
		return comnctnSharCretDate;
	}
	public void setComnctnSharCretDate(int comnctnSharCretDate) {
		this.comnctnSharCretDate = comnctnSharCretDate;
	}
	public String getRecvNmeCardDateUseAt() {
		return recvNmeCardDateUseAt;
	}
	public void setRecvNmeCardDateUseAt(String recvNmeCardDateUseAt) {
		this.recvNmeCardDateUseAt = recvNmeCardDateUseAt;
	}
}
