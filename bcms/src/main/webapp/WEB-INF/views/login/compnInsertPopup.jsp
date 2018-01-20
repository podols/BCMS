<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
		<link href="/resources/dist/css/bootstrap.css" rel="stylesheet">
		<link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="/resources/dist/css/ui.css" rel="stylesheet" type="text/css">
		
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="/resources/dist/js/bootstrap.min.js"></script>
	
		<script type="text/javascript">
			function insertCompn() {
				if ($("#memCompnNme").val() == "") {
		      		alert("회사 명을 입력하세요.");
		      		$("#memCompnNme").focus();
		      		return;
		        }
				$.ajax({
					type: "get",
					url: "compnNmeCheck.do", //이페이지에서 중복체크를 한다
					data : $('#memCompnNme'),
					dataType : "JSON",
					
					success: function(data){
					var compnNmeCheck = data["compnNmeCheck"];
//	 				$("#idCheckResult").value = idCheck;
					if(compnNmeCheck != 0){
						var text = '<font style="color:red"><c:out value="회사가 존재합니다."/></font>';
							$("#loadtext").html(text); //해당 내용을 보여준다
					}
					else{
						document.frm.action="insertCompn.do";
						document.frm.submit();
						window.opener.location.reload();
					}
					
					},
				    error:function(xhr,status,error){ //ajax 오류인경우  
				    	alert("$");
			            alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);       
			   		}
				});
				
			}
			
			function cencel() {
				self.close()
				window.opener.location.reload();
			}
		</script>
	</head>
	<body>
		<form method="post" name="frm">
			<div align="center" style="margin-top:-50px">
				<table>
					<tr>
						<td colspan="3">
							<h4 class="page-header" style="width:300px"><b>회사 등록</b></h4>
						</td>
					</tr>
					<tr>
						<td>
							회사명 &nbsp;&nbsp;&nbsp;
						</td>
						<td>
							<input class="form-control" placeholder="회사명" name="memCompnNme" id="memCompnNme" type="text" style="width:150px">
							
						</td>
						<td>
							<button class="btn btn-default" type="button" onclick="javascript:insertCompn()">등록</button>
							<button class="btn btn-default" type="button" onclick="javascript:cencel()">취소</button>
						</td>
					</tr>
					<tr>
						<td>
							
						</td>
						<td colspan="2">
							<div id="loadtext" style="text-align:left">
							</div>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</body>
</html>
