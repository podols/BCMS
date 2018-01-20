<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>BCMS - 명함 변경내역 리스트</title>
		   	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
		    <script src="/resources/dist/js/calendar_beans_v2.2.js" type="text/javascript"></script>
		    <script src="/resources/dist/js/jquery.mask.min.js" type="text/javascript"></script>
		   	<link rel="stylesheet" href="/resources/dist/css/ui.css" type="text/css">
 			<link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">
	    <script>
 	        function nmeCardHistrSelectViewForm(nmeCardHistrSeq) { //명함 변경내역 상세보기 			
 	        	var nmeCardInfo = document.nmeCardInfo;   
		        
		        nmeCardInfo.nmeCardHistrSeq.value = nmeCardHistrSeq;
		        nmeCardInfo.action = "/nmeCardHistrSelectViewForm.do" ;		         
		        nmeCardInfo.submit() ;			    
			}
 	        
 	       function arrayNmeCardHistr(page) { //명함 변경내역 리스트
				document.nmeCardInfo.currentPageNo.value = page;		
				document.nmeCardInfo.action = "/nmeCardHistrSelectForm.do";
				document.nmeCardInfo.submit();
			}
 	       
 	      function serachNmeCardHistr(page) { //명함 검색 보기
				var searchAfter = document.getElementById("searchAfter").value;
				var searchBefore = document.getElementById("searchBefore").value;
				if (document.getElementById("searchAfter").value==""||document.getElementById("searchBefore").value==""){
					alert("날짜를 선택하세요");
				}
				else{
					document.getElementById("after").value = searchAfter
					document.getElementById("before").value = searchBefore
					document.nmeCardInfo.currentPageNo.value = page;
					document.nmeCardInfo.action = "/nmeCardHistrSelectForm.do";
					document.nmeCardInfo.submit();
				}				
			}
 	      
 	     function refreshNmeCardHistr(page) { //명함 변경내역 리스트
 	    		document.getElementById("after").value = "";
				document.getElementById("before").value = "";
				document.nmeCardInfo.currentPageNo.value = page;		
				document.nmeCardInfo.action = "/nmeCardHistrSelectForm.do";
				document.nmeCardInfo.submit();
		}
 	    </script>
	    <style>
	        #checkboxTestTbl {border-collapse: collapse;}
	        #checkboxTestTbl td, #checkboxTestTbl th{padding:20px;}
	        #checkboxTestTbl th{background-color: #ccc;}
	         
	        #checkboxTestTbl tr.selected{background-color: black; color: #fff; font-weight: bold;}
		</style>
	</head>
	<body>
		<div class="wrapper" style="width:600px;">
			<h3 class="page-header" style="border-bottom:0px;margin-top: 0px;margin-bottom: 0px;">✴ 명함 변경내역			
			<button class="btn btn-default-mina" style="margin-left:7px;" style="display:inline" onclick="javascript:refreshNmeCardHistr(1)"><span class="glyphicon glyphicon-repeat" aria-hidden="true"></span></button>						
			</h3>
			<form name="nmeCardInfo" method="post">		
				<input type="hidden" name="nmeCardHistrSeq" value="0">
				<input type="hidden" name="nmeCardSeq" value="${nmeCardValueObject.nmeCardSeq}">
				<input type="hidden" id="pageNo" name="currentPageNo" value="${nmeCardValueObject.currentPageNo}">			
				<input type="hidden" id="after" name="searchAfter" value="${nmeCardValueObject.searchAfter}">
				<input type="hidden" id="before" name="searchBefore" value="${nmeCardValueObject.searchBefore }">
			<table class="table " id="checkboxTestTbl" style="border:1px; margin-left: auto; margin-right: auto;" border="1">
				<colgroup>
					<col width="10px;"/>
					<col width="180px;"/>
					<col width="60px;"/>
					<col width="60px;"/>
				</colgroup>
				<tr>
					<th style="text-align:center; vertical-align:middle">번호</th>		
					<th style="text-align:center; vertical-align:middle">수정된 항목</th>			
					<th style="text-align:center; vertical-align:middle">등록된 날짜</th>
					<th style="text-align:center; vertical-align:middle">작성자</th>
				</tr>
				<c:forEach var="selectNmeCardHistrList" items="${selectNmeCardHistrList}" varStatus="status">
					<tr style="text-align:center">
						<td style="text-align:center; vertical-align:middle"><c:out value="${selectNmeCardHistrList.nmeCardHistrIndex}"/></td>
						<td style="text-align:center; vertical-align:middle"><a href="javascript:nmeCardHistrSelectViewForm(${selectNmeCardHistrList.nmeCardHistrSeq})"><c:out value="${selectNmeCardHistrList.nmeCardHistrUpdateCol}"/></a></td>
						<td style="text-align:center; vertical-align:middle"><c:out value="${selectNmeCardHistrList.nmeCardHistrCretDate}"/></td>
						<td style="text-align:center; vertical-align:middle"><c:out value="${selectNmeCardHistrList.nmeCardHistrMemNme}"/></td>
					</tr>
				</c:forEach>
			</table>				
			<c:if test="${nmeCardValueObject.lastPageNoOnPageList != 1}">
				<div style="text-align:center">
					<ul class="pagination">
						<c:if test="${nmeCardValueObject.totalPageCount > 1 && nmeCardValueObject.currentPageNo != 1}">
							<li class="paginate_button previous"><a href="javascript:arrayNmeCardHistr(1)">&laquo;</a></li>
							<li class="paginate_button previous"><a href="javascript:arrayNmeCardHistr(${nmeCardValueObject.currentPageNo-1})">&lsaquo;</a></li>
						</c:if>
					
						<c:forEach var="page" begin="${nmeCardValueObject.firstPageNoOnPageList}" end="${nmeCardValueObject.lastPageNoOnPageList}">
							<c:if test="${page == nmeCardValueObject.currentPageNo}">
								<li class="paginate_button active"><a href="javascript:arrayNmeCardHistr(${page})">${page}</a></li>
							</c:if>
							<c:if test="${page != nmeCardValueObject.currentPageNo}">
								<li class="paginate_button"><a href="javascript:arrayNmeCardHistr(${page})">${page}</a></li>
							</c:if>
						</c:forEach>
					
						<c:if test="${nmeCardValueObject.totalPageCount > 1 && nmeCardValueObject.totalPageCount != nmeCardValueObject.currentPageNo}">
							<li class="paginate_button next"><a href="javascript:arrayNmeCardHistr(${nmeCardValueObject.currentPageNo+1})">&rsaquo;</a></li>
							<li class="paginate_button next"><a href="javascript:arrayNmeCardHistr(${nmeCardValueObject.totalPageCount})">&raquo;</a></li>
						</c:if>
					</ul>							
				</div>
			</c:if>
			<div style="text-align:center">
				<input type="text"  id= "searchAfter" class="form-control" maxlength="12" style="width:160px;">
				<font>~</font>
				<input type="text"  id= "searchBefore" class="form-control" maxlength="12" style="width:160px;">
				<button class="btn btn-default" style="margin-left:7px;" onclick="javascript:serachNmeCardHistr(1)">검색</button>		
				<script type="text/javascript">
					initCal({id:"searchAfter",type:"day",today:"y"});//달력
					initCal({id:"searchBefore",type:"day",today:"y"});//달력
				</script>				
			</div>			
			</form>
		</div>
	</body>
</html>