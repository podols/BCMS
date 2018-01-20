package net.su.base.valueObject;

public class BaseValueObject {
	private int newspeedSeq;
	private String sendNme="";
	private String nmeCardFirstNme;
	private String nmeCardLastNme;
	private String newspeedType;
	private int receiveSeq;
	private String newspeedDate;
	private int newspeedCount;
	
	public int getNewspeedCount() {
		return newspeedCount;
	}
	public void setNewspeedCount(int newspeedCount) {
		this.newspeedCount = newspeedCount;
	}
	public int getNewspeedSeq() {
		return newspeedSeq;
	}
	public void setNewspeedSeq(int newspeedSeq) {
		this.newspeedSeq = newspeedSeq;
	}
	public String getSendNme() {
		return sendNme;
	}
	public void setSendNme(String sendNme) {
		this.sendNme = sendNme;
	}
	public String getNmeCardFirstNme() {
		return nmeCardFirstNme;
	}
	public void setNmeCardFirstNme(String nmeCardFirstNme) {
		this.nmeCardFirstNme = nmeCardFirstNme;
	}
	public String getNmeCardLastNme() {
		return nmeCardLastNme;
	}
	public void setNmeCardLastNme(String nmeCardLastNme) {
		this.nmeCardLastNme = nmeCardLastNme;
	}
	public String getNewspeedType() {
		return newspeedType;
	}
	public void setNewspeedType(String newspeedType) {
		this.newspeedType = newspeedType;
	}
	public int getReceiveSeq() {
		return receiveSeq;
	}
	public void setReceiveSeq(int receiveSeq) {
		this.receiveSeq = receiveSeq;
	}
	public String getNewspeedDate() {
		return newspeedDate;
	}
	public void setNewspeedDate(String newspeedDate) {
		this.newspeedDate = newspeedDate;
	}
}