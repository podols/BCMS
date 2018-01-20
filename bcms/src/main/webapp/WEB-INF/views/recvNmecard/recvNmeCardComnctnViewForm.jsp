<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="/resources/dist/css/ui.css" type="text/css">
    	<link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">
    	<link rel="stylesheet" href="/resources/dist/css/css/normalize.css">
		<link rel="stylesheet" href="/resources/dist/css/css/default.css">
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="/resources/dist/js/selectize/selectize.js"></script>
    	
    	<script>
		function comnctnSelectForm(comnctnpage) {
 			var comnctnSeq = document.getElementById("comnctnSeq").value;
 			var nmeCardSeq = document.getElementById("nmeCardSeq").value;
			document.comnctnViewInfo.comnctnCurrentPageNo.value = comnctnpage;
 			document.comnctnViewInfo.nmeCardSeq.value = nmeCardSeq;
 			document.comnctnViewInfo.comnctnSeq.value = comnctnSeq;
			document.comnctnViewInfo.action = "/recvNmeCardComnctnSelectForm.do";
			document.comnctnViewInfo.submit();
		}
		
		// 구분으로 숨기기
		function displayType() {
			var Type = document.getElementById("comnctnType").value;
			 if (Type == "meeting") {
			 document.getElementById("comnctnMem").style.display = "block";
	        }
	        else {
	        	document.getElementById("comnctnMem").style.display = "none";
	        }
		}
    	</script>
	</head>
	<body onLoad="javascript:displayType();">
		<form name="comnctnViewInfo" method="post">	
			<input type="hidden" name="comnctnCurrentPageNo" id="comnctnCurrentPageNo" value="${comnctnNmeCardValueObject.comnctnCurrentPageNo}">
			<input type="hidden" name="nmeCardSeq" id="nmeCardSeq" value="${comnctnNmeCardValueObject.nmeCardSeq}"> 
			<input type="hidden" name="comnctnSeq" id="comnctnSeq" value="${comnctnNmeCardValueObject.comnctnSeq}">
		</form>
		<div class="wrapper" style="width:599px; margin-left:1px">	
			<table class="table table-bordered" style="border:1px;">
				<tr>
						<th style="text-align:center;  width:104px">제목</th>
						<td><input class="form-control" type="text" name="title" value="<c:out value="${selectRecvNmeCardComnctnView.comnctnTitl}"/>" readOnly></td>
				</tr>
				<tr>
						<th style="text-align:center">구분</th>
					<td><input class="form-control" type="text" id="comnctnType" name="comnctnType" value="<c:out value="${selectRecvNmeCardComnctnView.comnctnType}"/>" readOnly></td>
				</tr>
			</table>
			<div id="comnctnMem" style="display:block">
				<table class="table table-bordered" border=1 style=" margin-top:-20px;">
					<tr>
						<th rowspan=2 style="text-align:center; vertical-align:middle;width:104px">참석자</th>				
						<td>
						<!-- 참석자 입력란 -->			
						<c:choose>
							<c:when test="${selectAtndList.size() != 0}">																					
							<div style="float:left">										
								<select id="licnsSeq" name="licnsSeq" multiple class="demo-default" style="width:480px;" disabled>
									<c:forEach items="${selectAtndList}" var="selectAtndList">
										<option value="${selectAtndList.memSeq}" selected>${selectAtndList.memNme}</option>
									</c:forEach>
								</select>
								<script>
									$('#licnsSeq').selectize({
										
									});
								</script>
							</div>
							</c:when>
							<c:otherwise>
								<input class="form-control" type="text" value=" " readonly>
							</c:otherwise>
						</c:choose>			
						</td>
					</tr>
					<tr>
						<td><input class="form-control" type="text" name="comnctnNoAtnd" value="${selectRecvNmeCardComnctnView.comnctnNoAtnd}" readonly></td>
					</tr>
				</table>
			</div>
			<table class="table table-bordered" border=1 style=" margin-top:-20px;">
				<tr>
					<th colspan=2 style="text-align:center">내용</th>
				</tr>
				<tr>
					<td colspan=2><textarea rows="15" cols="79" name="content" readOnly><c:out value="${selectRecvNmeCardComnctnView.comnctnContn}"/></textarea></td>
				</tr>
			</table>
			<div style="text-align:right;">
				<input class="btn btn-white" type="button" value="돌아가기" onclick="javascript:comnctnSelectForm(1)" ID="recvNmeCardComnctnViewForm">
			</div>
		</div>
	</body>
</html>