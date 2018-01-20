<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
		   	<link rel="stylesheet" href="/resources/dist/css/ui.css" type="text/css">
 			<link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">
    <script>
        $(document).ready(function(){
            var tbl = $("#checkboxTestTbl");
             
            // 테이블 헤더에 있는 checkbox 클릭시
            $(":checkbox:first", tbl).click(function(){
                // 클릭한 체크박스가 체크상태인지 체크해제상태인지 판단
                if( $(this).is(":checked") ){
                    $(":checkbox", tbl).attr("checked", "checked");
                }
                else{
                    $(":checkbox", tbl).removeAttr("checked");
                }
 
                // 모든 체크박스에 change 이벤트 발생시키기                
                $(":checkbox", tbl).trigger("change");
            });
             
            // 헤더에 있는 체크박스외 다른 체크박스 클릭시
            $(":checkbox:not(:first)", tbl).click(function(){
                var allCnt = $(":checkbox:not(:first)", tbl).length;
                var checkedCnt = $(":checkbox:not(:first)", tbl).filter(":checked").length;
                 
                // 전체 체크박스 갯수와 현재 체크된 체크박스 갯수를 비교해서 헤더에 있는 체크박스 체크할지 말지 판단
                if( allCnt==checkedCnt ){
                    $(":checkbox:first", tbl).attr("checked", "checked");
                }
                else{
                    $(":checkbox:first", tbl).removeAttr("checked");
                }
            }).change(function(){
                if( $(this).is(":checked") ){
                    // 체크박스의 부모 > 부모 니까 tr 이 되고 tr 에 selected 라는 class 를 추가한다.
                    $(this).parent().parent().addClass("selected");
                }
                else{
                    $(this).parent().parent().removeClass("selected");
                }
            });
        });
        //커뮤니케이션 상세보기
        function nmeCardComnctnViewForm(comnctnSeq) {
        	document.comnctnTypeSelect.comnctnSeq.value = comnctnSeq;
        	document.comnctnTypeSelect.action = "/nmeCardComnctnViewForm.do";
			document.comnctnTypeSelect.submit();
		}
       //커뮤니케이션 등록화면
        function nmeCardComnctnInsertForm() {
        	document.comnctnTypeSelect.action = "/nmeCardComnctnInsertForm.do";
			document.comnctnTypeSelect.submit();
        }
		//페이지 정렬
		function comnctnSelectForm(comnctnpage) {
 			var comnctnSearchAry = document.getElementById("comnctnSearchAry").value;
			var comnctnSearchWrd = document.getElementById("comnctnSearchWrd").value;
			var comnctnSearchCnd = document.getElementById("comnctnSearchCnd").value;
			document.comnctnInfo.comnctnCurrentPageNo.value = comnctnpage;
 			document.comnctnInfo.comnctnSearchAry.value = comnctnSearchAry;
			document.comnctnInfo.comnctnSearchWrd.value = comnctnSearchWrd;
			document.comnctnInfo.comnctnSearchCnd.value = comnctnSearchCnd;
			document.comnctnInfo.action = "/nmeCardComnctnSelectForm.do";
			document.comnctnInfo.submit();
		}
		
		//명함 체크박스 삭제
		function deleteNmeCardComnctn(){ 
			var nmeCardComnctnSeq ="";
			var checkArray = new Array();
			var memSeq = "#"+document.getElementById("memSeq").value;
			<c:forEach var="selectNmeCardComnctnList" items="${selectNmeCardComnctnList}" varStatus="status">
				comnctnSeq= "#"+"${selectNmeCardComnctnList.comnctnSeq}";
				if($(comnctnSeq).is(":checked")){
					checkArray.push("${selectNmeCardComnctnList.comnctnSeq}");			
				}
			</c:forEach>
			if(checkArray.length == 0){
				alert("삭제할 커뮤니케이션을 선택하세요.")
			}
			else{
				if (confirm("삭제하시겠습니까?") == true){    //확인
					$.ajax({
					type : 'POST',
					url : 'deleteNmeCardComnctn.do',
					data : {
						0:0,
						checkArray : checkArray},
						success: function pageReload(){
							location.href="/nmeCardComnctnSelectForm.do"
						}
					});
					checkArray= new Array();
					nmeCardComnctnSeq="";
				}
				else{   //취소
					location.reload(true);
				}
			}
		}
		//커뮤니케이션 검색
		function recvNmeCardComnctnSearch(comnctnpage) {
			var nmeCardSeq = document.getElementById("nmeCardSeq").value;
			var comnctnSearchAry = document.getElementById("comnctnSearchAry").value;
			var comnctnSearchWrd = document.getElementById("comnctnSearchWrd").value;
			var comnctnSearchCnd = document.getElementById("comnctnSearchCnd").value;
			if(comnctnSearchWrd == "") {
				alert("검색어를 입력하세요");
			}
			else {
				document.comnctnInfo.comnctnCurrentPageNo.value = comnctnpage;
				document.comnctnInfo.nmeCardSeq.value = nmeCardSeq;
	 			document.comnctnInfo.comnctnSearchAry.value = comnctnSearchAry;
				document.comnctnInfo.comnctnSearchWrd.value = comnctnSearchWrd;
				document.comnctnInfo.comnctnSearchCnd.value = comnctnSearchCnd;
				document.comnctnInfo.action = "/nmeCardComnctnSelectForm.do";
				document.comnctnInfo.submit();
			}
		}
		//커뮤니케이션 체크박스 보내기
		function sendNmeCardComnctn(){ 
			var sendComnctnSeq ="";
			var sendCheckArray = new Array();
			<c:forEach var="selectNmeCardComnctnList" items="${selectNmeCardComnctnList}" varStatus="status">
				sendComnctnSeq= "#"+"${selectNmeCardComnctnList.comnctnSeq}";
				if($(sendComnctnSeq).is(":checked")){
					sendCheckArray.push("${selectNmeCardComnctnList.comnctnSeq}");		
				}
			</c:forEach>
			if(sendCheckArray.length == 0){
				alert("보내기할 커뮤니케이션을 선택하세요.")
			}
			else{
				if (confirm("보내기 화면으로 이동합니다.") == true){
					$.ajax({
					type : 'POST',
					url : '/sendSession.do',
					data : {
						0:0,
						"sendCheckArray" : sendCheckArray},
						success: function popload(){
							$("input[name=chkbox]:checkbox").attr("checked", false);
							$("input[name=allChkBox]:checkbox").attr("checked", false);
							var sendFormURL = "/sendForm.do";
							var sendFormOption = "width=1300, height=820,  toolbar=no, location=no, directories=no, scrollbars=no, resizable=no, ";    //공유해제 팝업창 옵션(optoin)
							window.open(sendFormURL,"sendPopUp",sendFormOption);
						},
					});
					sendCheckArray= new Array();
					sendComnctnSeq="";
				}
				else{   //취소
					location.reload(true);
				}
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
			<input type="hidden" name="memSeq" id="memSeq" value="${memSeq}">
		</form>
		<div style="width:600px;">
				<div>
					<div style="float:left">
						<form method="post" name="comnctnTypeSelect">
							<select class="form-control" name="comnctnType" id="comnctnSearchAry" onchange="comnctnSelectForm(1)" style="display:inline-block; width:100px; margin-bottom:6px">
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
							<input type="hidden" value="${NmeCardSeq2}" name="nmeCardSeq">
							<input type="hidden" value="0" name="comnctnSeq">
						</form>
					</div>						
					<img src="resources/img/send.png" style="margin-right:100px;width:25px;height:25px" onclick="javascript:sendNmeCardComnctn()">
					<div style="float:right;margin-bottom:10px">
						<input class="btn btn-default"  type="button" value="추가" style="margin-left:7px;" onclick="javascript:nmeCardComnctnInsertForm()" target="iframe_a" ID="nmeCardComnctnViewForm">
						<input class="btn btn-default"  type="button" value="삭제" style="margin-left:7px;" onclick="javascript:deleteNmeCardComnctn()" id="del">
					</div>
				</div>
				<form name="frm" method="post">
				<input type="hidden" id="comntCount" value="${fn:length(selectNmeCardComnctnList)}">
				<table class="table " id="checkboxTestTbl" style="border:1px; margin-left: auto; margin-right: auto;">
					<colgroup>
						<col width="10px;"/>
						<col width="45px;"/>
						<col width="250px;"/>
						<col width="130px;"/>
						<col width="150px;"/>
					</colgroup>
					<tr >
						<th style="text-align:center"><input name = "allChkBox" type="checkbox"/></th>
						<th style="text-align:center">종류</th>
						<th style="text-align:center">제목</th>
						<th style="text-align:center">작성자</th>
						<th style="text-align:center">날짜</th>
					</tr>
					<c:forEach var="selectNmeCardComnctnList" items="${selectNmeCardComnctnList}" varStatus="status">
					<input type="hidden" name="comnctnCretrSeq" id="comnctnCretrSeq" value="${selectNmeCardComnctnList.comnctnCretrSeq}">
						<tr style="text-align:center">
							<c:if test="${selectNmeCardComnctnList.comnctnCretrSeq==memSeq}">
								<td><input type="checkbox" id="${selectNmeCardComnctnList.comnctnSeq}" name="chkbox" value="${selectNmeCardComnctnList.comnctnSeq}"></td>
							</c:if>
							<c:if test="${selectNmeCardComnctnList.comnctnCretrSeq!=memSeq}">
								<td>
									　
								</td>
							</c:if>
							<td><c:out value="${selectNmeCardComnctnList.comnctnType}"/></td>
							<td style="text-align:left"><a href="javascript:nmeCardComnctnViewForm(${selectNmeCardComnctnList.comnctnSeq})" target="iframe_a" ID="nmeCardComnctnViewForm"><c:out value="${selectNmeCardComnctnList.comnctnTitl}"/></a></td>
							<td><c:out value="${selectNmeCardComnctnList.memNme}"/></td>
							<td><c:out value="${selectNmeCardComnctnList.comnctnCretDate}"/></td>
						</tr>
					</c:forEach>
				</table>
				</form>
		
			<c:if test="${comnctnNmeCardValueObject.comnctnLastRecordIndex != 1}">
				<div style="text-align:center">
					<ul class="pagination">
						<c:if test="${comnctnNmeCardValueObject.comnctnTotalPageCount > 1 && comnctnNmeCardValueObject.comnctnCurrentPageNo != 1}">
							<li class="paginate_button previous"><a href="javascript:comnctnSelectForm(1)">&laquo;</a></li>
							<li class="paginate_button previous"><a href="javascript:comnctnSelectForm(${comnctnNmeCardValueObject.comnctnCurrentPageNo-1})">&lsaquo;</a></li>
						</c:if>
					
						<c:forEach var="comnctnpage" begin="${comnctnNmeCardValueObject.comnctnFirstPageNoOnPageList}" end="${comnctnNmeCardValueObject.comnctnLastPageNoOnPageList}">
							<c:if test="${comnctnpage == comnctnNmeCardValueObject.comnctnCurrentPageNo}">
								<li class="paginate_button active"><a href="javascript:comnctnSelectForm(${comnctnpage})">${comnctnpage}</a></li>
							</c:if>
							<c:if test="${comnctnpage != comnctnSearchAndPageValueObject.comnctnCurrentPageNo}">
								<li class="paginate_button"><a href="javascript:comnctnSelectForm(${comnctnpage})">${comnctnpage}</a></li>
							</c:if>
						</c:forEach>
					
						<c:if test="${comnctnNmeCardValueObject.comnctnTotalPageCount > 1 && comnctnNmeCardValueObject.comnctnTotalPageCount != comnctnNmeCardValueObject.comnctnCurrentPageNo}">
							<li class="paginate_button next"><a href="javascript:comnctnSelectForm(${comnctnNmeCardValueObject.comnctnCurrentPageNo+1})">&rsaquo;</a></li>
							<li class="paginate_button next"><a href="javascript:comnctnSelectForm(${comnctnNmeCardValueObject.comnctnTotalPageCount})">&raquo;</a></li>
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