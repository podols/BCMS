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
	</head>
	<script>
	
		function sharComnctnSelectForm() {
			location.href="/sharNmeCardComnctnSelectForm.do"
		}
		function updateSharComnctn() {
			document.update.action = "/updateSharNmeCardComnctn.do";
			document.update.submit();
		}
		// 구분으로 숨기기
		function gogo() {
			var c = document.getElementById("t").value;
		 	if (c == "meeting") {
			 document.getElementById("test").style.display = "block";
	        }
	        else {
	        	document.getElementById("test").style.display = "none";
	        }
		}
		function hi() {
			var c = document.getElementById("t").value;
			if (c == "meeting") {
				document.getElementById("test").style.display = "block";
				var atnd = document.getElementById("one").value;
	        	var noAtnd = document.getElementById("two").value;
	        	document.getElementById("atnd").value = atnd;
	        	document.getElementById("noAtnd").value = noAtnd;
	        }
	        else {
	        	document.getElementById("test").style.display = "none";
	        	var atnd = document.getElementById("atnd").value;
	        	var noAtnd = document.getElementById("noAtnd").value;
	        	document.getElementById("one").value = atnd;
	        	document.getElementById("two").value = noAtnd;
	        	document.getElementById("atnd").value = "";
	        	document.getElementById("noAtnd").value = "";
	        }
		}
	</script>
	<body onLoad="javascript:gogo();">
		<form name="update" method="POST">
			<div class="wrapper" style="width:600px;">
				<input type="hidden" value="" id="one">
				<input type="hidden" value="" id="two">
				<input type="hidden" name="comnctnSeq" value="${selectSharNmeCardComnctnView.comnctnSeq}">
				<table class="table table-bordered" border=1>					
					<tr>
						<th style="text-align:center">제목</th>
						<td><input class="form-control" type="text" name="comnctnTitl" value="${selectSharNmeCardComnctnView.comnctnTitl}"></td>
					</tr>
					<tr>
						<th style="text-align:center">구분</th>
						<td>
							<select class="form-control" name="comnctnType" id="t" style="display:inline-block;" onchange="javascript:hi()">
					            <c:if test="${selectSharNmeCardComnctnView.comnctnType == 'meeting'}">
					            	<option value="meeting" selected>meeting</option>
					            	<option value="memo">memo</option>
					            </c:if>
					            <c:if test="${selectSharNmeCardComnctnView.comnctnType == 'memo'}">
					            	<option value="memo" selected>memo</option>
					            	<option value="meeting">meeting</option>
					            </c:if>
			            	</select>
			            </td>
					</tr>
				</table>				
				<div id="test" style="display:block;">
					<table class="table table-bordered" border=1 style=" margin-top:-20px">
							<tr>
								<th rowspan=2 style="text-align:center; vertical-align:middle; width:104px">참석자</th>				
								<td><input class="form-control" type="text" id="atnd" name="comnctnAtnd" value="${selectSharNmeCardComnctnView.comnctnAtnd}"></td>
							</tr>
							<tr>
								<td><input class="form-control" type="text" id="noAtnd" name="comnctnNoAtnd" value="${selectSharNmeCardComnctnView.comnctnNoAtnd}"></td>
							</tr>
					</table>
				</div>
				<table class="table table-bordered" border=1 style=" margin-top:-20px">
					<tr>
						<th style="text-align:center">내용</th>
					</tr>
					<tr>
						<td colspan=2><textarea rows="15" cols="79"name="comnctnContn" >${selectSharNmeCardComnctnView.comnctnContn}</textarea></td>
					</tr>
				</table>
				<div style="text-align:right">
					<input class="btn btn-default" type="button" value="수정완료" onclick="javascript:updateSharComnctn()" target="iframe_a" ID="updateSharNmeCardComnctn">
					<input class="btn btn-white" type="button" value="취소" onclick="javascript:sharComnctnSelectForm()" target="iframe_a" ID="sharNmeCardComnctnSelectForm">
				</div>
			</div>
		</form>
	</body>
</html>