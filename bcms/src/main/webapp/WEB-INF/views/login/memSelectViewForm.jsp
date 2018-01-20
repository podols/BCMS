<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
<!-- 		<script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<!-- 		<link href="/resources/dist/css/bootstrap.css" rel="stylesheet"> -->
<!-- 		<link rel="stylesheet" href="/resources/dist/css/css/normalize.css"> -->
<!-- 		<link rel="stylesheet" href="/resources/dist/css/css/default.css"> -->
<!-- 		<link rel="stylesheet" href="/resources/dist/css/css/stylesheet.css"> -->
		
<!-- 		<script src="/resources/dist/js/selectize/selectize.js"></script> -->
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
		function cutInfo() { // 개인정보 자르기
			//휴대폰 번호 자르기
			var mob = $("input[name=memMobil]").attr("value");
			if (mob.length==11){
				var fmob = (mob.substring(0,3)); //3자리
				var mmob = (mob.substring(3,7)); //4자리
				var lmob = (mob.substring(7,11)); //4자리
			}
			else {
				var fmob = (mob.substring(0,3)); //3자리
				var mmob = (mob.substring(3,6)); //3자리
				var lmob = (mob.substring(6,10)); //4자리
			}
			document.getElementById("memMobil1").value = fmob;
			document.getElementById("memMobil2").value = mmob;
			document.getElementById("memMobil3").value = lmob;
			
			//이메일주소 자르기
			var eadrs = $("input[name=memEmail]").attr("value");
			var email = eadrs.split("@");
			
			document.getElementById("memEmail1").value = email[0];
			document.getElementById("memEmail2").value = email[1];
			document.getElementById("email").value = email[1];
			
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
		function updateMembership(){
       	  	if ($("#memPw").val() == "") {
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
            else if ($("#memPostnNme").val() == "") {
            	alert("직급을 입력하세요!");
            	$("#memPostnNme").focus();
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
			alert="수정 되었습니다.";
			document.frm.action = "/updateMembership.do";
			document.frm.submit();
		}
		function compnPopup() {
			var popUrl = "compnInsertPopup.do";
			var popupName= "compnInsertPopup";
			var width = 400;
			var height = 150;
			var leftPosition = (screen.width/2) - (width/2);
				leftPosition += window.screenLeft;//듀얼 모니터일때
			var topPosition = (screen.height/2) - (height/2);
			
			var win = window.open(popUrl, popupName, "left="+leftPosition+", top="+topPosition+", toolbar=no, location=no, directories=no, scrollbars=no, resizable=no, width="+width+", height="+height);
			
			document.frm.strtgSeq.value = strtgSeq;
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
			
			document.frm.strtgSeq.value = strtgSeq;
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
	<body onload="cutInfo()">
		<form method="post" name="frm">
			<div>
				<input type="hidden" name="memMobil" value="${memSelectViewForm.memMobil}"> <!-- 휴대폰 번호 -->
				<input type="hidden" name="memEmail" value="${memSelectViewForm.memEmail}"> <!-- 이메일-->
			</div>
			<div class="head">                           
				<c:import url="/title.do"/>
			</div>
			<div class="body">
				<div class ="wrapper">
					<div class="card" style="width:1255px">
						<article class="card-l1ist">
							<div class="col-lg-12">
								<center><h2 class="page-header" style="width:1000px; margin-bottpm:20px">회원정보</h2></center>
							</div>
							<table style="width:800px; margin-right:200px" align="center">
								<colgroup>
									<col width="150px">
									<col width="650px">
								</colgroup>
								<tr>
									<td style="padding-bottom:10px">
										<strong>아이디 </strong>
									</td>
									<td>
										<input class="form-control" placeholder="아이디" id="memId" name="memId" type="text" maxlength="12" style="width:300px; margin-bottom: 10px;" value="${memSelectViewForm.memId}" disabled> 
									</td>
								</tr>
								<tr>
									<td style="padding-bottom:10px">
										<strong>비밀번호</strong>
									</td>
									<td>
										<input class="form-control" placeholder="비밀번호" id="memPw" name="memPw" type="password" maxlength="12" style="width:300px; margin-bottom: 10px;" required>
									</td>
								</tr>
								<tr>
									<td style="padding-bottom:10px">
										<strong>비밀번호 확인</strong>
									</td>
									<td>
										<input class="form-control" placeholder="비밀번호 확인" id="memPwRe" name="memPwRe" type="password" maxlength="12" style="width:300px; margin-bottom: 10px;" required>
									</td>
								</tr>
								<tr>
									<td style="padding-bottom:10px">
										<strong>성명</strong>
									</td>
									<td>
										<input class="form-control" placeholder="성명" id="memNme" name="memNme" type="text" maxlength="12" style="width:300px; margin-bottom: 10px;" value="${memSelectViewForm.memNme}" disabled>
									</td>
								</tr>
								<tr>
									<td style="padding-bottom:10px;">
										<strong>회사</strong>
									</td>
									<td style="padding-bottom:8px;">
										<div style="float:left">
											<select id="memCompnSeq" name="memCompnSeq" multiple class="demo-default" style="width:300px;; margin-bottom: 10px; placeholder:Select a state...">
												<c:forEach items="${compnList}" var="item">
													<c:if test="${memSelectViewForm.memCompnNme eq item.compnNme}">
														<option value="${item.compnSeq}" selected>${item.compnNme}</option>
													</c:if>
													<c:if test="${memSelectViewForm.memCompnNme ne item.compnNme}">
														<option value="${item.compnSeq}">${item.compnNme}</option>
													</c:if>
												</c:forEach>
											</select>
											<script>
												$('#memCompnSeq').selectize({
													maxItems: 1
												});
											</script>
										</div>
										<div style="float:left">
											<button class="btn btn-default" type="button" onclick="javascript:compnPopup()" style="margin-left:10px; margin-top:1px;">+</button>
										</div>
									</td>
								</tr>
								<tr>
									<td style="padding-bottom:10px;">
										<strong>부서</strong>
									</td>
									<td style="padding-bottom:8px;">
										<div style="float:left">
											<select id="memDepmtSeq" name="memDepmtSeq" multiple class="demo-default" style="width:300px; margin-bottom: 10px; placeholder:Select a state...">
												<c:forEach items="${depmtList}" var="item">
													<c:if test="${memSelectViewForm.memDepmtNme eq item.depmtNme}">
														<option value="${item.depmtSeq}" selected>${item.depmtNme}</option>
													</c:if>
													<c:if test="${memSelectViewForm.memDepmtNme ne item.depmtNme}">
														<option value="${item.depmtSeq}">${item.depmtNme}</option>
													</c:if>
												</c:forEach>
											</select>
											<script>
												$('#memDepmtSeq').selectize({
													maxItems: 1
												});
											</script>
										</div>
										<div style="float:left">
											<button class="btn btn-default" type="button" onclick="javascript:depmtPopup()" style="margin-left:10px;">+</button>
										</div>
									</td>
								</tr>
								<tr>
									<td style="padding-bottom: 11px;">
										<strong>직급</strong>
									</td>
									<td>
										<input class="form-control" placeholder="직급" id="memPostnNme" name="memPostnNme" type="text" maxlength="12" value="${memSelectViewForm.memPostnNme}" style="width:300px; margin-bottom: 10px; text-align:left">
									</td>
								</tr>
								<tr>
									<td style="padding-bottom: 11px;">
										<strong>성별</strong>
									</td>
									<td>
										<select id="memSex" name="memSex" class="form-control"  style="width:80px; margin-bottom:10px; text-align:left" disabled>
											<c:if test="${memSelectViewForm.memSex == '남자'}">
										   		<option value="남자" selected>남자</option>
										    </c:if>
										    <c:if test="${memSelectViewForm.memSex == '여자'}">
												<option value="여자" selected>여자</option>
											</c:if>
										</select>
									</td>
								</tr>
								<tr>
									<td style="padding-bottom: 11px;">
										<strong>생년월일</strong>
									</td>
									<td style="vertical-align:middle">
										<input type="text"  id= "memBirth" class="form-control" value="${memSelectViewForm.memBirth}" maxlength="12" style="width:160px; margin-bottom:10px;">
										<script type="text/javascript">
											initCal({id:"memBirth",type:"day",today:"y"});//달력
										</script>
									</td>
								</tr>
								<tr>
									<td style="padding-bottom: 11px;">
										<strong>이메일</strong>
									</td>
									<td nowrap="nowrap">
										<input type="text" class="form-control" style="width:200px; margin-bottom:10px; text-align:left"  id="memEmail1" name="memEmail1" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9,.]/g,'');">
										<strong>@</strong>
										<input type="text" class="form-control" style="width:200px; margin-bottom:10px; text-align:left" id="memEmail2" name="memEmail2" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9,.]/g,'');">
										<select id="email" class="form-control" style="width:200px; margin-bottom:10px; text-align:left" onChange="javascript:insertEmail();">
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
									<td style="padding-bottom: 5px;">
										<strong>휴대폰</strong>
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
										<strong>-</strong><input type="text" class="form-control" style="width:100px; margin-left:5px; text-align:left" id="memMobil2" name="memMobil2" maxlength="4" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9,.]/g,'');">
										<strong>-</strong><input type="text" class="form-control" style="width:100px; margin-left:5px; text-align:left" id="memMobil3" name="memMobil3" maxlength="4"onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9,.]/g,'');">
									</td>
								</tr>
								<tr>
									<td colspan="2" align="center">
										　
									</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align:center">
										<button class="btn btn-default" type="button" onclick="javascrip:updateMembership();">수정</button>
										<button class="btn btn-default-mina" type="button" onclick="javascript:nmeCardLogo();">취소</button>
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
