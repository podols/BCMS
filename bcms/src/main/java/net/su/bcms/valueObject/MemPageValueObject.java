package net.su.bcms.valueObject;

public class MemPageValueObject {
	
	// 검색용 변수
	private int memSearchCnd = 0; //검색 조건
	
	private String memSearchWrd = ""; //검색 단어
	
	private int memSearchAry = 0; //정렬조건
	
	// 페이징용 변수
	private int memCurrentPageNo = 1; //현재 페이지 번호
	
	private int memRecordCountPerPage = 10; // 한 페이지당 게시되는 게시물 건 수
	
	private int memPageSize = 5; // 페이지 리스트에 게시되는 페이지 건수
	
	private int memTotalRecordCount = 0; //전체 게시물 건 수
	
	private int memTotalPageCount = 0; // 전체 페이지 개수
	
	private int memFirstRecordIndex = 0; // 첫페이지 인덱스 번호(글 번호)
	
	private int memLastRecordIndex = 0; //마지막 페이지 인덱스 번호(글 번호)
	
	private int memFirstPageNoOnPageList = 1;//페이지 리스트의 첫 페이지 번호
	
	private int memLastPageNoOnPageList = 1;//페이지 리스트의 마지막 페이지 번호
	
	

	public int getMemSearchCnd() {
		return memSearchCnd;
	}

	public void setMemSearchCnd(int memSearchCnd) {
		this.memSearchCnd = memSearchCnd;
	}

	public String getMemSearchWrd() {
		return memSearchWrd;
	}

	public void setMemSearchWrd(String memSearchWrd) {
		this.memSearchWrd = memSearchWrd;
	}

	public int getMemSearchAry() {
		return memSearchAry;
	}

	public void setMemSearchAry(int memSearchAry) {
		this.memSearchAry = memSearchAry;
	}

	public int getMemCurrentPageNo() {
		return memCurrentPageNo;
	}

	public void setMemCurrentPageNo(int memCurrentPageNo) {
		this.memCurrentPageNo = memCurrentPageNo;
	}

	public int getMemRecordCountPerPage() {
		return memRecordCountPerPage;
	}

	public void setMemRecordCountPerPage(int memRecordCountPerPage) {
		this.memRecordCountPerPage = memRecordCountPerPage;
	}

	public int getMemPageSize() {
		return memPageSize;
	}

	public void setMemPageSize(int memPageSize) {
		this.memPageSize = memPageSize;
	}

	public int getMemTotalRecordCount() {
		return memTotalRecordCount;
	}

	public void setMemTotalRecordCount(int memTotalRecordCount) {
		this.memTotalRecordCount = memTotalRecordCount;
	}

	public int getMemTotalPageCount() {
		memTotalPageCount = ((getMemTotalRecordCount()-1)/getMemRecordCountPerPage()) + 1;
		return memTotalPageCount;
	}

//	public void setMemTotalPageCount(int memTotalPageCount) {
//		this.memTotalPageCount = memTotalPageCount;
//	}

	public int getMemFirstRecordIndex() {
		memFirstRecordIndex = (getMemCurrentPageNo() - 1) * getMemRecordCountPerPage();
		return memFirstRecordIndex;
	}

//	public void setMemFirstRecordIndex(int memFirstRecordIndex) {
//		this.memFirstRecordIndex = memFirstRecordIndex;
//	}

	public int getMemLastRecordIndex() {
		memLastRecordIndex = getMemCurrentPageNo() * getMemRecordCountPerPage();
		return memLastRecordIndex;
	}

//	public void setMemLastRecordIndex(int memLastRecordIndex) {
//		this.memLastRecordIndex = memLastRecordIndex;
//	}

	public int getMemFirstPageNoOnPageList() {
		memFirstPageNoOnPageList = ((getMemCurrentPageNo()-1)/getMemPageSize())*getMemPageSize() + 1;
		return memFirstPageNoOnPageList;
	}

//	public void setMemFirstPageNoOnPageList(int memFirstPageNoOnPageList) {
//		this.memFirstPageNoOnPageList = memFirstPageNoOnPageList;
//	}

	public int getMemLastPageNoOnPageList() {
		   memLastPageNoOnPageList = getMemFirstPageNoOnPageList() + getMemPageSize() - 1;		
		if(memLastPageNoOnPageList > getMemTotalPageCount()){
		   memLastPageNoOnPageList = getMemTotalPageCount();
		}
		return memLastPageNoOnPageList;
	}

//	public void setMemLastPageNoOnPageList(int memLastPageNoOnPageList) {
//		this.memLastPageNoOnPageList = memLastPageNoOnPageList;
//	}
	

	


	
	
	
}
