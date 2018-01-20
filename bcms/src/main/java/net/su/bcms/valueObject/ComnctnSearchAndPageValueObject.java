package net.su.bcms.valueObject;

public class ComnctnSearchAndPageValueObject {

	//검색용 변수
	private int comnctnSearchCnd = 0;//검색 조건
	
	private String comnctnSearchWrd = "";//검색 단어
	
	private int comnctnSearchAry = 0;//정렬 조건
	
	//페이징용 변수
	private int comnctnCurrentPageNo = 1;//현재 페이지 번호
	
	private int comnctnRecordCountPerPage = 7;//한 페이지당 게시되는 게시물 건 수
	
	private int comnctnPageSize = 5;//페이지 리스트에 게시되는 페이지 건 수
	
	private int comnctnTotalRecordCount = 0;//전체 게시물 건 수
	
	private int comnctnTotalPageCount = 0;//전체 페이지 개수
	
	private int comnctnFirstRecordIndex = 0;//첫 페이지 인덱스 번호(글 번호)
	
	private int comnctnLastRecordIndex = 0;//마지막 페이지 인덱스 번호(글 번호)
	
	private int comnctnFirstPageNoOnPageList = 1;//페이지 리스트의 첫 페이지 번호
	
	private int comnctnLastPageNoOnPageList = 1;//페이지 리스트의 마지막 페이지 번호
	
	public int getComnctnSearchCnd() {
		return comnctnSearchCnd;
	}

	public void setComnctnSearchCnd(int comnctnSearchCnd) {
		this.comnctnSearchCnd = comnctnSearchCnd;
	}

	public String getComnctnSearchWrd() {
		return comnctnSearchWrd;
	}

	public void setComnctnSearchWrd(String comnctnSearchWrd) {
		this.comnctnSearchWrd = comnctnSearchWrd;
	}

	public int getComnctnSearchAry() {
		return comnctnSearchAry;
	}

	public void setComnctnSearchAry(int comnctnSearchAry) {
		this.comnctnSearchAry = comnctnSearchAry;
	}

	public int getComnctnCurrentPageNo() {
		return comnctnCurrentPageNo;
	}

	public void setComnctnCurrentPageNo(int comnctnCurrentPageNo) {
		this.comnctnCurrentPageNo = comnctnCurrentPageNo;
	}

	public int getComnctnRecordCountPerPage() {
		return comnctnRecordCountPerPage;
	}

	public void setComnctnRecordCountPerPage(int comnctnRecordCountPerPage) {
		this.comnctnRecordCountPerPage = comnctnRecordCountPerPage;
	}

	public int getComnctnPageSize() {
		return comnctnPageSize;
	}

	public void setComnctnPageSize(int comnctnPageSize) {
		this.comnctnPageSize = comnctnPageSize;
	}

	public int getComnctnTotalRecordCount() {
		return comnctnTotalRecordCount;
	}

	public void setComnctnTotalRecordCount(int comnctnTotalRecordCount) {
		this.comnctnTotalRecordCount = comnctnTotalRecordCount;
	}

	public int getComnctnTotalPageCount() {
		comnctnTotalPageCount = ((getComnctnTotalRecordCount()-1)/getComnctnRecordCountPerPage()) + 1;
		return comnctnTotalPageCount;
	}

//	public void setComnctnTotalPageCount(int comnctnTotalPageCount) {
//		this.comnctnTotalPageCount = comnctnTotalPageCount;
//	}

	public int getComnctnFirstRecordIndex() {
		comnctnFirstRecordIndex = (getComnctnCurrentPageNo() - 1) * getComnctnRecordCountPerPage();
		return comnctnFirstRecordIndex;
	}

//	public void setComnctnFirstRecordIndex(int comnctnFirstRecordIndex) {
//		this.comnctnFirstRecordIndex = comnctnFirstRecordIndex;
//	}

	public int getComnctnLastRecordIndex() {
		comnctnLastRecordIndex = getComnctnCurrentPageNo() * getComnctnRecordCountPerPage();
		return comnctnLastRecordIndex;
	}

//	public void setComnctnLastRecordIndex(int comnctnLastRecordIndex) {
//		this.comnctnLastRecordIndex = comnctnLastRecordIndex;
//	}

	public int getComnctnFirstPageNoOnPageList() {
		comnctnFirstPageNoOnPageList = ((getComnctnCurrentPageNo()-1)/getComnctnPageSize())*getComnctnPageSize() + 1;
		return comnctnFirstPageNoOnPageList;
	}

//	public void setComnctnFirstPageNoOnPageList(int comnctnFirstPageNoOnPageList) {
//		this.comnctnFirstPageNoOnPageList = comnctnFirstPageNoOnPageList;
//	}

	public int getComnctnLastPageNoOnPageList() {
		comnctnLastPageNoOnPageList = getComnctnFirstPageNoOnPageList() + getComnctnPageSize() - 1;		
		if(comnctnLastPageNoOnPageList > getComnctnTotalPageCount()){
			comnctnLastPageNoOnPageList = getComnctnTotalPageCount();
		}
		return comnctnLastPageNoOnPageList;
	}

//	public void setComnctnLastPageNoOnPageList(int comnctnLastPageNoOnPageList) {
//		this.comnctnLastPageNoOnPageList = comnctnLastPageNoOnPageList;
//	}
}