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
	</head>
	<script>
		function insertSharNmeCardComnctn() {
			var arr = [];
			$.each($("#comnctnAtnd .item"),function(k,v){
			    arr[arr.length] = $(v).attr('data-value');
			});
			document.getElementById('comnctnAtnd').value = arr;
			var aa = document.insert.comnctnType.value;
			document.insert.action = "/insertSharNmeCardComnctn.do";
			document.insert.submit();
		}
		function sharNmeCardComnctnSelectForm() {
			location.href="/sharNmeCardComnctnSelectForm.do"
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
	</script>
	<body onLoad="javascript:gogo();">
		<form name="insert">
			<div class="wrapper" style="width:600px; float:left;">
				<input type="hidden" name="comnctnAtnd" id="comnctnAtnd" value="0">
				<table class="table table-bordered" border=1">
					<tr>
							<th style="text-align:center;width:104px">제목</th>
							<td><input class="form-control" type="text" name="comnctnTitl"></td>
					</tr>
					<tr>
						<th style="text-align:center">구분</th>
						<td>
							<select class="form-control" id="t" name="comnctnType" style="display:inline-block;" onChange="javascript:gogo();">
					            <option value="meeting" selected>meeting</option>
					            <option value="memo">memo</option>
			            	</select>
						</td>
					</tr>
				</table>
				<div id="test" style="display:block;">
					<table class="table table-bordered" border=1 style="margin-top:-20px;">
						<tr>
							<th rowspan=2 style="text-align:center;width:104px">참석자</th>				
							<!-- 참석자 입력란 -->			
							<td>
							<div id="comnctnAtnd" style="float:left; width:480px">						
							    <select id="antd" name="dd" multiple class="demo-default">
									<c:forEach items="${selectMemList}" var="item">
										<option value="${item.memSeq}">${item.memNme}</option>
									</c:forEach>
								</select>
								<script>
								$('#antd').selectize({
									  maxItems: 10
								});
								</script>
							</div>
							</td>		
						</tr>
						<tr>
							<td><input class="form-control" type="text" name="comnctnNoAtnd"></td>
						</tr>
					</table>
				</div>
				<table class="table table-bordered" border=1 style="margin-top:-20px;">
					<tr>
						<th style="text-align:center">내용</th>
					</tr>
					<tr>
						<td colspan=2><textarea rows="15" cols="78" name="comnctnContn"></textarea></td>
					</tr>
				</table>
				<div style="text-align:right">
					<input class="btn btn-default" type="button" value="등록" onclick="javascript:insertSharNmeCardComnctn()">
					<input class="btn btn-white" type="button" value="취소" onclick="javascript:sharNmeCardComnctnSelectForm()" target="iframe_a" ID="sharNmeCardComnctnViewForm">
				</div>
			</div>
		</form>
	</body>
</html>