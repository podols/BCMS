package net.su.login.valueObject;

public class CompnValueObject {

	private int compnSeq;
	private String compnNme = "";
	private int depmtSeq = 0;
	private String depmtNme = "";
	private int compnNmeCount =0;
	private int depmtNmeCount =0;
	
	
	public int getCompnNmeCount() {
		return compnNmeCount;
	}
	public void setCompnNmeCount(int compnNmeCount) {
		this.compnNmeCount = compnNmeCount;
	}
	public int getDepmtNmeCount() {
		return depmtNmeCount;
	}
	public void setDepmtNmeCount(int depmtNmeCount) {
		this.depmtNmeCount = depmtNmeCount;
	}
	public int getCompnSeq() {
		return compnSeq;
	}
	public void setCompnSeq(int compnSeq) {
		this.compnSeq = compnSeq;
	}
	public String getCompnNme() {
		return compnNme;
	}
	public void setCompnNme(String compnNme) {
		this.compnNme = compnNme;
	}
	public int getDepmtSeq() {
		return depmtSeq;
	}
	public void setDepmtSeq(int depmtSeq) {
		this.depmtSeq = depmtSeq;
	}
	public String getDepmtNme() {
		return depmtNme;
	}
	public void setDepmtNme(String depmtNme) {
		this.depmtNme = depmtNme;
	}
}
