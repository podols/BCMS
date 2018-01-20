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
		<link rel="stylesheet" href="/resources/dist/css/css/normalize.css">
		<link rel="stylesheet" href="/resources/dist/css/css/default.css">
		<link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="/resources/dist/css/ui.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="/resources/dist/css/css/stylesheet.css">
		
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="/resources/dist/js/selectize/selectize.js"></script>
		<script src="/resources/dist/js/bootstrap.min.js"></script>
		<script src="/resources/dist/js/calendar_beans_v2.2.js" type="text/javascript"></script>
		<script src="/resources/dist/js/jquery.mask.min.js" type="text/javascript"></script>
	
	<script type="text/javascript">
		
		function insertEmail(){
	        if (frm.email.value == '직접입력') {
	            frm.memEmail2.readOnly = false;
	            frm.memEmail2.value = '';
	            frm.memEmail2.focus();
	        }
	        else {
	            frm.memEmail2.readOnly = true;
	            frm.memEmail2.value = frm.email.value;
	        }
	    }
		function insertMembership(){
			
	    	if ($("#memId").val() == "") {
	      	  alert("아이디를 꼭 입력하세요!");
	      	  $("#memId").focus();
	      	  return;
	        }
	    	else if($("#idCheckResult").val() == "1") {
	 			alert("아이디 중복확인을 해주세요.");
	 			document.frm.memId.focus();
	 			return;
	 		}
	        else if ($("#memId").val().length <= 3) {
         	   alert("아이디를 4자리 이상 입력하세요!");
        	    $("#memId").val("");
        	    $("#memId").focus();
        	    return;
        	} 
       	  	else if ($("#memPw").val() == "") {
            	alert("비밀번호를 꼭 입력하세요!");
            	$("#memPw").focus();
            	return;
         	}
            else if ($("#memPwRe").val() == "") {
            	alert("비밀번호확인 을 꼭 입력하세요!");
            	$("#memPwRe").focus();
            	return;
            } 
            else if ($("#memPw").val() != $("#memPwRe").val()) {
            	alert("비밀번호와 비밀번호 확인이 일치하지않습니다.");
            	$("#memPw").val("");
            	$("#memPwRe").val("");
            	$("#memPw").focus();
            	return;
            } 
			else if ($("#memNme").val() == "") {
            	alert("이름을 꼭 입력하세요!");
            	$("#memNme").focus();
            	return;
            } 
			else if ($("#memCompnNme").val() == "") {
            	alert("회사를 입력하세요!");
            	$("#memCompnNme").focus();
            	return;
            } 
			else if ($("#memDepmtNme").val() == "") {
            	alert("부서를 입력하세요!");
            	$("#memDepmtNme").focus();
            	return;
			} 
            else if ($("#memPostn").val() == "") {
            	alert("직급을 입력하세요!");
            	$("#memPostn").focus();
            	return;
			}
            else if ($("#memSex").val() == "성별") {
            	alert("성별을 선택하세요!");
            	$("#memSex").focus();
            	return;
            } 
            else if ($("#memBirth").val() == "") {
            	alert("생년월일을 입력하세요!");
            	$("#memBirth").focus();
            	return;
            }
			else if ($("#memEmail1").val() == "") {
           		alert("이메일을 입력하세요!");
            	$("#memEmail").focus();
            	return;
            }
			else if ($("#memEmail2").val() == "") {
            	alert("이메일 주소를 입력하세요!");
            	$("#memEmail2").focus();
            	return;
            }
			else if ($("#memMobil1").val() == "선택") {
            	alert("휴대폰 첫 자리를 선택하세요!");
            	$("#memMobil1").focus();
            	return;
			}
            else if ($("#memMobil2").val() == "") {
            	alert("휴대폰 둘쨰 자리를 입력하세요!");
            	$("#memMobil2").focus();
            	return;
            }
			else if ($("#memMobil3").val() == "") {
            	alert("휴대폰 셋째 자리를 입력하세요!");
            	$("#memMobil3").focus();
            	return;
            }
			else {
           		alert("ok");
           		document.frm.action = "/insertMembership.do";
    			document.frm.submit();
            }
//	            else if ($("#tel1").val().length != 3) {
//             alert("전화1을 3개의 숫자로 꼭 입력하세요!");
//             $("#tel1").val("");
//             $("#tel1").focus();
//         } 
		}
		
		 function idCheck(){
			if ($("#memId").val() == "") {
		    	alert("아이디를 꼭 입력하세요!");
		    	$("#memId").focus();
		    	return;
		    }
			else if ($("#memId").val().length <= 3) {
         		alert("아이디를 4자리 이상 입력하세요!");
        		$("#memId").val("");
        		$("#memId").focus();
        		return;
        	} 
			var memId = $('#memId').val();
			$.ajax({
				type: "get",
				url: "idCheck.do", //이페이지에서 중복체크를 한다
				data : $('#memId'),
				dataType : "JSON",
				
				success: function(data){
				var idCheck = data["idCheck"];
				if(idCheck != 0){
					var text = '<font style="color:red"><c:out value="아이디가 존재합니다."/></font>';
						text += '<input type="hidden" id="idCheckResult" name="idCheckResult" value="1">'
						$("#loadtext").html(text); //해당 내용을 보여준다
				}
				else{
					var	text = '<font style="color:blue"><c:out value="사용가능한 아이디입니다."/></font>';
						text += '<input type="hidden" id="idCheckResult" name="idCheckResult" value="0">'
						$("#loadtext").html(text); //해당 내용을 보여준다
				}
				
				},
			    error:function(xhr,status,error){ //ajax 오류인경우  
			    	alert("$");
		            alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);       
		   		}
			});
		};
				
		function main(){
			location.href="/loginForm.do";
		}
		function onlyNumber(){
			if((event.keyCod<48)||(event.keyCode>57))
				event.returnValue=false;
		}
// 		function idCheck() {
// 			if(document.frm.memId.value == "") {
// 	 			alert("아이디를 입력해주세요.");
// 	 			document.frm.memId.focus();
// 	 			return false;
// 	 		}
			
// 			//아이디 유효성 검사 (영문소문자 및 숫자만 허용)
// 			for (j=0; j<document.frm.memId.value.length; j++) {
// 				ch=document.frm.memId.value.charAt(j);
// 				if (!(ch>='0' && ch<='9') && !(ch>='a' && ch<='z')) {
// 					alert("아이디는 영문 소문자 및 숫자만 입력 가능합니다.");
// 					document.frm.memId.focus();
// 					return false;
// 				}
// 			}

			//아이디 길이 체크 (6~12자)
// 			if (document.frm.memId.value.length<6 || document.frm.memId.value.length>12) {
// 				alert ("아이디는 6~12자로 입력해주세요.");
// 				document.frm.memId.focus();
// 				return false;
// 			}
			
// 			var popUrl = "idCheck.do";//팝업창에 출력될 페이지 URL
// 			var popupName= "idCheck";
// 			var width = 350;
// 			var height = 180;
// 			var leftPosition = (screen.width/2) - width / 2;
// 			//leftPosition += window.screenLeft;//듀얼 모니터일때
// 			var topPosition = (screen.height/2) - height / 2;
// 			var popOption;
// 			var win = window.open(popUrl, popupName, "left="+leftPosition+",top="+topPosition+",width="+width+",height="+height+", toolbars=no, resizable=no, scrollbars=no");
			
// 			document.frm.target = popupName;
// 			document.frm.action = "/idCheck.do";
// 			document.frm.submit();
	
// 			if(win == null) {//만약 팝업 차단으로 팝업창이 나타나지 않을 경우
// 				alert("팝업차단을 해제해주세요!");
// 			}
// 			else {
// 				win.focus();
// 			}
// 		}
// 		function idCheckCancle() {
// 			document.frm.idCheckResult.value = "1";
// 		}
		
		function compnPopup() {
			var popUrl = "compnInsertPopup.do";
			var popupName= "compnInsertPopup";
			var width = 400;
			var height = 150;
			var leftPosition = (screen.width/2) - (width/2);
				leftPosition += window.screenLeft;//듀얼 모니터일때
			var topPosition = (screen.height/2) - (height/2);
			
			var win = window.open(popUrl, popupName, "left="+leftPosition+", top="+topPosition+", toolbar=no, location=no, directories=no, scrollbars=no, resizable=no, width="+width+", height="+height);
			
			document.frm.target = popupName;
			document.frm.action = "/compnInsertPopup.do";
			document.frm.submit();
			
			if(win == null) {//만약 팝업 차단으로 팝업창이 나타나지 않을 경우
				alert("팝업차단을 해제해주세요!");
			}
			else {
			win.focus();	         
			}
		}
		function depmtPopup() {
			var popUrl = "depmtInsertPopup.do";
			var popupName= "depmtInsertPopup";
			var width = 400;
			var height = 150;
			var leftPosition = (screen.width/2) - (width/2);
				leftPosition += window.screenLeft;//듀얼 모니터일때
			var topPosition = (screen.height/2) - (height/2);
			
			var win = window.open(popUrl, popupName, "left="+leftPosition+", top="+topPosition+", toolbar=no, location=no, directories=no, scrollbars=no, resizable=no, width="+width+", height="+height);
			
			document.frm.target = popupName;
			document.frm.action = "/depmtInsertPopup.do";
			document.frm.submit();
			
			if(win == null) {//만약 팝업 차단으로 팝업창이 나타나지 않을 경우
				alert("팝업차단을 해제해주세요!");
			}
			else {
			win.focus();	         
			}
		}
		
	</script>
	
	</head>
	<body>
		<form method="post" name="frm">
			<div align="center" style="margin-top:15px;">
			   <a href="javascript:main()"><img src="resources/img/BCMS.png"  id="logo"></a>
			</div>
			<div class="navbar-wrapper">
				<nav class="navbar navbar-inverse navbar-static-top">
					<div class="container">
						<div class="navbar-header">
						</div>
						<div id="navbar" class="navbar-collapse">
						</div>
					</div>
				</nav>
			</div>
			<div class="body">
				<div class ="wrapper">
					<div class="card" style="width:1255px">
						<article class="card-l1ist">
							<div class="col-lg-12">
								<center><h2 class="page-header" style="width:550px">JOIN</h2></center>
							</div>
							<table style="width:800px; margin-right:200px" align="center">
								<colgroup>
									<col width="150px">
									<col width="650px">
								</colgroup>
								<tr>
									<td>
										아이디 
									</td>
									<td>
										<div style="float:left">
<!-- 										<input class="form-control" placeholder="아이디" id="memId" name="memId" type="text" maxlength="12" style="width:300px" onkeyup="javascript:idCheckCancle();"> -->
											<input class="form-control" placeholder="아이디" id="memId" name="memId" type="text" maxlength="12" style="width:300px" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9,.]/g,'');">
											<div id="loadtext">
											</div>
										</div>
										<div style="float:left">
											<button class="btn btn-default" type="button" id="idRequest" name="idRequest" onclick="javascript:idCheck()">중복확인</button>
										</div> 
									</td>
								</tr>
								<tr>
									<td>
										비밀번호
									</td>
									<td>
										<input class="form-control" placeholder="비밀번호" id="memPw" name="memPw" type="password" maxlength="12" style="width:300px" required>
									</td>
								</tr>
								<tr>
									<td>
										비밀번호 확인
									</td>
									<td>
										<input class="form-control" placeholder="비밀번호 확인" id="memPwRe" name="memPwRe" type="password" maxlength="12" style="width:300px" required>
									</td>
								</tr>
								<tr>
									<td>
										성명
									</td>
									<td>
										<input class="form-control" placeholder="성명" id="memNme" name="memNme" type="text" maxlength="12" style="width:300px" required>
									</td>
								</tr>
								<tr>
									<td>
										회사
									</td>
									<td>
										<div style="float:left" id="compnReload">
											<select id="memCompnSeq" name="memCompnSeq" multiple class="demo-default" style="width:300px; placeholder:Select a state...">
												<c:forEach items="${compnList}" var="item">
													<option value="${item.compnSeq}">${item.compnNme}</option>
												</c:forEach>
											</select>
											
											<script>
												$('#memCompnSeq').selectize({
													maxItems: 1
												});
											</script>
										</div>
										<div style="float:left">
											<button class="btn btn-default" type="button" onclick="javascript:compnPopup()">+</button>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										부서
									</td>
									<td>
										<div style="float:left">
											<select id="memDepmtSeq" name="memDepmtSeq" multiple class="demo-default" style="width:300px; placeholder:Select a state...">
												<c:forEach items="${depmtList}" var="item">
													<option value="${item.depmtSeq}">${item.depmtNme}</option>
												</c:forEach>
											</select>
											<script>
												$('#memDepmtSeq').selectize({
													maxItems: 1
												});
											</script>
										</div>
										<div style="float:left">
											<button class="btn btn-default" type="button" onclick="javascript:depmtPopup()">+</button>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										직급
									</td>
									<td>
										<input class="form-control" placeholder="직급" id="memPostnNme" name="memPostnNme" type="text" maxlength="12" style="width:300px; text-align:left">
									</td>
								</tr>
								<tr>
									<td>
										성별
									</td>
									<td>
										<select id="memSex" name="memSex" class="form-control" style="width:80px; text-align:left">
											<option value="성별" selected>성별</option>
										    <option value="남자">남자</option>
										    <option value="여자">여자</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>
										생년월일
									</td>
									<td style="vertical-align:middle">
<!-- 										<input type="date" id="memBirth" name="memBirth" class="form-control" placeholder="생년월일" maxlength="12" style="width:160px; text-align:left"> -->
										<input type="text"  id= "memBirth" class="form-control" maxlength="12" style="width:160px;">
										<script type="text/javascript">
											initCal({id:"memBirth",type:"day",today:"y"});//달력
										</script>
									</td>
								</tr>
								<tr>
									<td>
										이메일
									</td>
									<td nowrap="nowrap">
										<input type="text" class="form-control" style="width:200px; text-align:left"  id="memEmail1" name="memEmail1" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9,.]/g,'');">
										@
										<input type="text" class="form-control" style="width:200px; text-align:left" id="memEmail2" name="memEmail2" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9,.]/g,'');">
										<select id="email" class="form-control" style="width:200px; text-align:left" onChange="javascript:insertEmail();">
											<option value="직접입력" selected>직접입력</option>					
											<option value="naver.com">naver.com</option>
											<option value="daum.net">daum.net</option>             
											<option value="nate.com">nate.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="gamil.com">gmail.com</option>
											<option value="hotmail.com">hotmail.com</option>
											<option value="lycos.co.kr">lycos.co.kr</option>
											<option value="empal.com">empal.com</option>
											<option value="dreamwiz.com">dreamwiz.com</option>
											<option value="korea.com">korea.com</option>       				
										</select>
									</td>
								</tr>
								<tr>
									<td>
										휴대폰
									</td>
									<td>
										<select id="memMobil1" name="memMobil1" class="form-control" style="width:120px; text-align:left">
											<option value="선택" selected>선택</option>					
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>
										-<input type="text" class="form-control" style="width:100px; IME-MODE:disabled; text-align:left" id="memMobil2" name="memMobil2" maxlength="4" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
										-<input type="text" class="form-control" style="width:100px; IME-MODE:disabled; text-align:left" id="memMobil3" name="memMobil3" maxlength="4" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
									</td>
								</tr>
								<tr>
									<td colspan="2" align="center">
										　
									</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align:center">
										<button class="btn btn-default" type="button" onclick="javascrip:insertMembership();">회원가입</button>
										<button class="btn btn-default" type="button" onclick="javascript:main()">취소</button>
									</td>
								</tr>
							</table>
						</article>
					</div>
				</div>
			</div>
		</form>
	</body>
</html>
