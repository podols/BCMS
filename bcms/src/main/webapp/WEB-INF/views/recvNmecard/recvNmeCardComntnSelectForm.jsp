<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
			<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
			<link rel="stylesheet" href="/resources/dist/css/ui.css" type="text/css">
 			<link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">
    <script>
//         $(document).ready(function(){
//             var tbl = $("#checkboxTestTbl");
             
//             // 테이블 헤더에 있는 checkbox 클릭시
//             $(":checkbox:first", tbl).click(function(){
//                 // 클릭한 체크박스가 체크상태인지 체크해제상태인지 판단
//                 if( $(this).is(":checked") ){
//                     $(":checkbox", tbl).attr("checked", "checked");
//                 }
//                 else{
//                     $(":checkbox", tbl).removeAttr("checked");
//                 }
 
//                 // 모든 체크박스에 change 이벤트 발생시키기                
//                 $(":checkbox", tbl).trigger("change");
//             });
             
//             // 헤더에 있는 체크박스외 다른 체크박스 클릭시
//             $(":checkbox:not(:first)", tbl).click(function(){
//                 var allCnt = $(":checkbox:not(:first)", tbl).length;
//                 var checkedCnt = $(":checkbox:not(:first)", tbl).filter(":checked").length;
                 
//                 // 전체 체크박스 갯수와 현재 체크된 체크박스 갯수를 비교해서 헤더에 있는 체크박스 체크할지 말지 판단
//                 if( allCnt==checkedCnt ){
//                     $(":checkbox:first", tbl).attr("checked", "checked");
//                 }
//                 else{
//                     $(":checkbox:first", tbl).removeAttr("checked");
//                 }
//             }).change(function(){
//                 if( $(this).is(":checked") ){
//                     // 체크박스의 부모 > 부모 니까 tr 이 되고 tr 에 selected 라는 class 를 추가한다.
//                     $(this).parent().parent().addClass("selected");
//                 }
//                 else{
//                     $(this).parent().parent().removeClass("selected");
//                 }
//             });
//         });
		
		//페이지 정렬
		function comnctnArrayNmeCard(comnctnpage) {
 			var comnctnSearchAry = document.getElementById("comnctnSearchAry").value;
			var comnctnSearchWrd = document.getElementById("comnctnSearchWrd").value;
			var comnctnSearchCnd = document.getElementById("comnctnSearchCnd").value;
			document.comnctnInfo.comnctnCurrentPageNo.value = comnctnpage;
 			document.comnctnInfo.comnctnSearchAry.value = comnctnSearchAry;
			document.comnctnInfo.comnctnSearchWrd.value = comnctnSearchWrd;
			document.comnctnInfo.comnctnSearchCnd.value = comnctnSearchCnd;
			document.comnctnInfo.action = "/recvNmeCardComnctnSelectForm.do";
			document.comnctnInfo.submit();
		}
		
		//상세보기
		function recvNmeCardComnctnViewForm(comnctnseq) {
			var nmeCardSeq = document.getElementById("nmeCardSeq").value;
			var comnctnSearchAry = document.getElementById("comnctnSearchAry").value;
			var comnctnSearchWrd = document.getElementById("comnctnSearchWrd").value;
			var comnctnSearchCnd = document.getElementById("comnctnSearchCnd").value;
			document.comnctnInfo.comnctnSeq.value = comnctnseq;
			document.comnctnInfo.nmeCardSeq.value = nmeCardSeq;
			document.comnctnInfo.comnctnSearchAry.value = comnctnSearchAry;
			document.comnctnInfo.comnctnSearchWrd.value = comnctnSearchWrd;
			document.comnctnInfo.comnctnSearchCnd.value = comnctnSearchCnd;
			document.comnctnInfo.action = "/recvNmeCardComnctnViewForm.do";
			document.comnctnInfo.submit();
		}
		
		//커뮤니케이션 검색
		function recvNmeCardComnctnSearch(comnctnpage) {
			var nmeCardSeq = document.getElementById("nmeCardSeq").value;
			var comnctnSearchAry = document.getElementById("comnctnSearchAry").value;
			var comnctnSearchWrd = document.getElementById("comnctnSearchWrd").value;
			var comnctnSearchCnd = document.getElementById("comnctnSearchCnd").value;
			if (document.getElementById("comnctnSearchWrd").value==""){
				alert("검색어를 입력하세요");
			}
			else{
				document.comnctnInfo.comnctnCurrentPageNo.value = comnctnpage;
				document.comnctnInfo.nmeCardSeq.value = nmeCardSeq;
	 			document.comnctnInfo.comnctnSearchAry.value = comnctnSearchAry;
				document.comnctnInfo.comnctnSearchWrd.value = comnctnSearchWrd;
				document.comnctnInfo.comnctnSearchCnd.value = comnctnSearchCnd;
				document.comnctnInfo.action = "/recvNmeCardComnctnSelectForm.do";
				document.comnctnInfo.submit();
			}
		}
    </script>
     
    <style>
        #checkboxTestTbl {border-collapse: collapse;}
        #checkboxTestTbl td, #checkboxTestTbl th{padding:20px;}
        #checkboxTestTbl th{background-color: #eee;}
        #checkboxTestTbl tr.selected{background-color: black; color: #fff;}
    </style>
		
	</head>
	<body>
		<form name="comnctnInfo" method="post">	
			<input type="hidden" name="comnctnCurrentPageNo" id="comnctnCurrentPageNo" value="${comnctnNmeCardValueObject.comnctnCurrentPageNo}">
			<input type="hidden" name="nmeCardSeq" id="nmeCardSeq" value="${comnctnNmeCardValueObject.nmeCardSeq}"> 
			<input type="hidden" name="comnctnSeq" id="comnctnSeq" value="${comnctnNmeCardValueObject.comnctnSeq}">
			<input type="hidden" name="comnctnSearchCnd" value="${comnctnNmeCardValueObject.comnctnSearchCnd}"> <%--   검색 조건 --%>
			<input type="hidden" name="comnctnSearchWrd" value="${comnctnNmeCardValueObject.comnctnSearchWrd}"> <%--  검색 단어 --%>
			<input type="hidden" name="comnctnSearchAry" value="${comnctnNmeCardValueObject.comnctnSearchAry}"> <%--  정렬 조건 --%>
		</form>
		<div style="width:600px;">
			<div>
				<div style="float:left">
					<select id="comnctnSearchAry"  class="form-control" style="display:inline-block; width:100px; margin-bottom:6px" onchange="javascript:comnctnArrayNmeCard(1)">
						<c:choose>
							<c:when test="${comnctnNmeCardValueObject.comnctnSearchAry == 0}">
								<option value="0" selected="selected">전체</option>
								<option value="1">meeting</option>
								<option value="2">memo</option>
							</c:when>
							<c:when test="${comnctnNmeCardValueObject.comnctnSearchAry == 1}">
								<option value="0">전체</option>
								<option value="1" selected="selected">meeting</option>
								<option value="2">memo</option>
							</c:when>
							<c:when test="${comnctnNmeCardValueObject.comnctnSearchAry == 2}">
								<option value="0">전체</option>
								<option value="1">meeting</option>
								<option value="2" selected="selected">memo</option>
							</c:when>
						</c:choose>
					</select>
				</div>
			</div>
			<table class="table " id="checkboxTestTbl" style="border:1px; margin-left: auto; margin-right: auto;">
				<tr>
					<th style="width:70px; text-align:center;">종류</th>
					<th style="width:280px; text-align:center;">제목</th>
					<th style="width:100px; text-align:center;">작성자</th>
					<th style="width:130px; text-align:center;">날짜</th>
				</tr>
				<c:forEach var="selectRecvNmeCardComnctnList" items="${selectRecvNmeCardComnctnList}" varStatus="status">
					<tr>
						<td style="text-align:center"><c:out value="${selectRecvNmeCardComnctnList.comnctnType}"/></td>
						<td style="text-align:left">
							<div style="width:270px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
								<a href="javascript:recvNmeCardComnctnViewForm(${selectRecvNmeCardComnctnList.comnctnSeq})">	
									<c:out value="${selectRecvNmeCardComnctnList.comnctnTitl}"/>
								</a>
							</div>
						</td>
						<td style="text-align:center"><c:out value="${selectRecvNmeCardComnctnList.memNme}"/></td>
						<td style="text-align:center"><c:out value="${selectRecvNmeCardComnctnList.comnctnCretDate}"/></td>
					</tr>
				</c:forEach>
			</table>	
	
			<c:if test="${comnctnNmeCardValueObject.comnctnLastRecordIndex != 1}">
				<div style="text-align:center">
					<ul class="pagination">
						<c:if test="${comnctnNmeCardValueObject.comnctnTotalPageCount > 1 && comnctnNmeCardValueObject.comnctnCurrentPageNo != 1}">
							<li class="paginate_button previous"><a href="javascript:comnctnArrayNmeCard(1)">&laquo;</a></li>
							<li class="paginate_button previous"><a href="javascript:comnctnArrayNmeCard(${comnctnNmeCardValueObject.comnctnCurrentPageNo-1})">&lsaquo;</a></li>
						</c:if>
					
						<c:forEach var="comnctnpage" begin="${comnctnNmeCardValueObject.comnctnFirstPageNoOnPageList}" end="${comnctnNmeCardValueObject.comnctnLastPageNoOnPageList}">
							<c:if test="${comnctnpage == comnctnNmeCardValueObject.comnctnCurrentPageNo}">
								<li class="paginate_button active"><a href="javascript:comnctnArrayNmeCard(${comnctnpage})">${comnctnpage}</a></li>
							</c:if>
							<c:if test="${comnctnpage != comnctnSearchAndPageValueObject.comnctnCurrentPageNo}">
								<li class="paginate_button"><a href="javascript:comnctnArrayNmeCard(${comnctnpage})">${comnctnpage}</a></li>
							</c:if>
						</c:forEach>
					
						<c:if test="${comnctnNmeCardValueObject.comnctnTotalPageCount > 1 && comnctnNmeCardValueObject.comnctnTotalPageCount != comnctnNmeCardValueObject.comnctnCurrentPageNo}">
							<li class="paginate_button next"><a href="javascript:comnctnArrayNmeCard(${comnctnNmeCardValueObject.comnctnCurrentPageNo+1})">&rsaquo;</a></li>
							<li class="paginate_button next"><a href="javascript:comnctnArrayNmeCard(${comnctnNmeCardValueObject.comnctnTotalPageCount})">&raquo;</a></li>
						</c:if>
					</ul>
				</div>
			</c:if>
			
			<div style="text-align:center">
				<select id="comnctnSearchCnd" class="form-control" style="width: 126px;">
					<c:choose>
						<c:when test="${comnctnNmeCardValueObject.comnctnSearchCnd == 0}">
							<option value="0" selected="selected">제목</option>
							<option value="1">작성자</option>
						</c:when>
						<c:when test="${comnctnNmeCardValueObject.comnctnSearchCnd == 1}">
							<option value="0">제목</option>
							<option value="1" selected="selected">작성자</option>
						</c:when>
					</c:choose>
				</select>
				<input id="comnctnSearchWrd" class="form-control" type="text" name="search" style="width: 226px;">
				<input class="btn btn-default"  type="button" value="검색" onclick="javascript:recvNmeCardComnctnSearch(1)">
			</div>
		</div>
	</body>
</html>