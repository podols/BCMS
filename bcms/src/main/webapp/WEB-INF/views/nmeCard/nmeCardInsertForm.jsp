<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>BCMS - 명함 등록</title>
		<script type="text/javascript">
			function logout() {
				alert("로그아웃");
				location.href="/logout.do";
			}
			function nmeCardLogo() {
				location.href="/nmeCardSelectForm.do";
			}
			function recvNmeCard() {
				location.href="/recvNmeCardSelectForm.do";
			}
	
			function sharNmeCardSelectForm(){
				location.href="/sharNmeCardSelectForm.do";
			}
			
			function nmeCardSelectForm(){
				location.href="/nmeCardSelectForm.do";
			}
			
			function nmeCardBinSelectForm(){
				location.href="/nmeCardBinSelectForm.do";
			}
		</script>
		<script type="text/javascript">
			function insertNmeCard() { // 등록 완료
				if ($("#nmeCardLastNme").val() == ""){
					alert("성을 입력하세요");
					$("#nmeCardLastNme").focus();
	            	return;
				}
				else if ($("#nmeCardFirstNme").val() == ""){
					alert("이름을 입력하세요.")
					$("#nmeCardFirstNme").focus();
	            	return;
				}
				else{
					var arr = [];
					$.each($("#licnsId .item"),function(k,v){
					    arr[arr.length] = $(v).attr('data-value');
					});
					document.getElementById('licnsSeq').value = arr;
					document.frm.action = "/insertNmeCard.do";
					document.frm.submit();
				}
			}
									
			function insertCancel() { //등록취소
				location.href="/nmeCardSelectForm.do";
			}
			
			function insertEmail(){ // 이메일 셀렉트 값 넣기
		        if (frm.email.value == '0') {
		            frm.nmeCardEmail2.readOnly = false;
		            frm.nmeCardEmail2.value = '';
		            
		            frm.nmeCardEmail2.focus();
		        }
		        else {
		            frm.nmeCardEmail2.readOnly = true;
		            frm.nmeCardEmail2.value = frm.email.value;
		        }
		    }
			
			function insertSns(){ // SNS 종륲 셀렉트 값 넣기
		        if (frm.sns.value == '0') {
		            frm.nmeCardSns2.readOnly = false;
		            frm.nmeCardSns2.value = '';
		            frm.nmeCardSns2.focus();
		        }
		        else {
		            frm.nmeCardSns2.readOnly = true;
		            frm.nmeCardSns2.value = frm.sns.value;
		        }
		    }
			function insertMesngr(){
		        if (frm.mesngr.value == '0') {
		            frm.nmeCardMesngr2.readOnly = false;
		            frm.nmeCardMesngr2.value = '';
		            frm.nmeCardMesngr2.focus();
		        }
		        else {
		            frm.nmeCardMesngr2.readOnly = true;
		            frm.nmeCardMesngr2.value = frm.mesngr.value;
		        }
		    }
			
			function insertSex(){ // 성별 셀렉트값 넣기
				var nmeCardSex = document.getElementById("sex").value;
				document.getElementById('nmeCardSex').value = nmeCardSex;
			}
			
			function insertMobil() { // 휴대폰 앞자리 셀렉트값 넣기
				var nmeCardMobil = document.getElementById("mobile").value;
				document.getElementById('nmeCardMobil').value = nmeCardMobil;
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
			
			function sexTr(){ //성별 접기/펼치기
				$('#sexTr').toggleClass("hide");
				if ($('#sexTab').text() == "▼"){
					$('#sexTab').text("▲");
				}
				else {
					$('#sexTab').text("▼");
				}				
			}
			
			function postnTr(){ //직급직무 접기/펼치기
				$('#postnTr').toggleClass("hide");
				if ($('#postnTab').text() == "▼"){
					$('#postnTab').text("▲");
				}
				else {
					$('#postnTab').text("▼");
				}				
			}
			
			function numTr(){ //전화번호 접기/펼치기
				$('#numTr').toggleClass("hide");
				$('#numTr2').toggleClass("hide");
				if ($('#numTab').text() == "▼"){
					$('#numTab').text("▲");
				}
				else {
					$('#numTab').text("▼");
				}				
			}
			
			function netTr(){ //네트워크 접기/펼치기
				$('#netTr').toggleClass("hide");
				$('#netTr2').toggleClass("hide");
				if ($('#netTab').text() == "▼"){
					$('#netTab').text("▲");
				}
				else {
					$('#netTab').text("▼");
				}				
			}
			
			function etcTr(){ //네트워크 접기/펼치기
				$('#etcTr').toggleClass("hide");
				$('#etcTr2').toggleClass("hide");
				$('#etcTr3').toggleClass("hide");
				if ($('#etcTab').text() == "▼"){
					$('#etcTab').text("▲");
				}
				else {
					$('#etcTab').text("▼");
				}				
			}
		</script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script>
		//우편번호 팝업창
		    function searchPostNum() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var fullAddr = ''; // 최종 주소 변수
		                var extraAddr = ''; // 조합형 주소 변수
		
		                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    fullAddr = data.roadAddress;
		
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    fullAddr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
		                if(data.userSelectedType === 'R'){
		                    //법정동명이 있을 경우 추가한다.
		                    if(data.bname !== ''){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있을 경우 추가한다.
		                    if(data.buildingName !== ''){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('postNum').value = data.zonecode; //5자리 새우편번호 사용
		                document.getElementById('bascAdrs').value = fullAddr;
		
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById('bascAdrs2').focus();
		            }
		        }).open();
		    }
		</script>
	</head>
	<body>
		<div class="head">                           
			<c:import url="/title.do"/>
		</div>
		<div class="body">
			<div class="wrapper">
				<form name="frm" method="post">
					<input type="hidden" name="nmeCardMobil" id="nmeCardMobil" value="010">
					<input type="hidden" name="nmeCardSex" id="nmeCardSex" value="남자">
					<input type="hidden" name="licnsSeq" id="licnsSeq" value="0">
					<input type="hidden" id="pageNo" name="currentPageNo" value="${nmeCardValueObject.currentPageNo}">
					<aside>
						<c:import url="/newSpeed.do"/>
					</aside>
					<div class="card">
						<h3 class="page-header" style="border-bottom:0px;padding-left: 200px;padding-right: 200px;">✴ 명함 등록</h3>
						<article class="card-list">
							<div class="col-lg-12" style="padding-left: 80px; padding-right: 80px;">
								<table class="table" style="width:800px; margin:0 auto;">
									<colgroup>
										<col width="100px">
										<col width="300px">
										<col width="100px">
										<col width="300px">
									</colgroup>	
									<!-- 성명 입력란 -->
									<tr>
										<td class="text-left" colspan="4" style="border-top-width: 0px;">
											<img alt="이름" src="resources/img/name.png" width="20px" height="20px" style="vertical-align:top">
											<strong><font size=4  style="vertical-align:middle"> 성명</font></strong>
										</td>
									</tr>
									<tr>
										<td style="text-align:right; vertical-align:middle">								
											<font>* 성 </font>
										</td>
										<td style="vertical-align:middle">
											<input class="form-control" style="width:100px; margin-right: 10px;" type="text" id="nmeCardLastNme" name="nmeCardLastNme" style="min-width:30px" size="5" autofocus required onkeyup="this.value=this.value.replace(/([^가-힣ㄱ-ㅎㅏ-ㅣ\x20])/i,'');">
										</td>
										<td style="text-align:right; vertical-align:middle">
											<font>* 이름 </font>
										</td>
										<td style="vertical-align:middle">
											<input class="form-control" style="width:100px;" type="text" id="nmeCardFirstNme" name="nmeCardFirstNme" style="min-width:30px" size="5" autofocus required onkeyup="this.value=this.value.replace(/([^가-힣ㄱ-ㅎㅏ-ㅣ\x20])/i,'');">
										</td>
									</tr>									
									<tr id="sexTr" class="hide">									
										<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
											<font style="margin-left: 23px;">성별 </font>
										</td>	
										<td style="border-top-width: 0px; vertical-align:middle" colspan="3">
											<select id="sex" class="form-control" style="width:90px" onchange="javascript:insertSex()">
												<option value="남자" selected="selected">남자</option>
												<option value="여자">여자</option>											
											</select>
										</td>
									</tr>
									<tr>
										<td colspan="4" style="border-top-width: 0px; text-align:right">
											<strong>(성별)</strong><a href="javascript:sexTr()"><font id="sexTab">▼</font></a>								
										</td>
									</tr>
									<!-- 회사 입력란 -->
									<tr>
										<td class="text-left" style="width:100%;border-top-width: 0px;" colspan="4">
											<img alt="회사" src="resources/img/company.png" width="20px" height="20px" style="vertical-align:top">
											<strong><font size=4  style="vertical-align:middle"> 회사</font></strong>
										</td>
									</tr>
									<tr>
										<td style="text-align:right; vertical-align:middle">
											<font>회사 </font>
										</td>
										<td>
											<div style="float:left">				
											<select id="nmeCardCompnSeq" name="nmeCardCompnSeq" multiple class="demo-default" style="width:200px">
												<c:forEach items="${compnList}" var="item">
													<option value="${item.compnSeq}">${item.compnNme}</option>
												</c:forEach>
											</select>											
											<script>
												$('#nmeCardCompnSeq').selectize({
													maxItems: 1
												});
											</script>
											</div>											
											<button class="btn btn-default" style="float:left" type="button" onclick="javascript:compnPopup()">+</button>
										</td>
										<td style="text-align:right; vertical-align:middle" >
											<font>부서 </font>	
										</td>
										<td>								
											<div style="float:left">
												<select id="nmeCardDepmtSeq" name="nmeCardDepmtSeq" multiple class="demo-default" style="width:200px;">
													<c:forEach items="${depmtList}" var="item">
														<option value="${item.depmtSeq}">${item.depmtNme}</option>
													</c:forEach>
												</select>
												<script>
													$('#nmeCardDepmtSeq').selectize({
														maxItems: 1
													});
												</script>
											</div>
											<button class="btn btn-default" type="button" style="float:left" onclick="javascript:depmtPopup()">+</button>
										</td>
									</tr>
									<tr id="postnTr" class="hide">									
										<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
											<font>직급 </font>
										</td>	
										<td style="border-top-width: 0px;">
											<input class="form-control" style="width:200px;" type="text" size="16" name="nmeCardPostnNme">
										</td>
										<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
											<font>직무 </font>
										</td>
										<td style="border-top-width: 0px;">
											<input class="form-control" style="width:200px;" type="text" size="16" name="nmeCardJobNme">										
										</td>
									</tr>
									<tr>
										<td colspan="4" style="border-top-width: 0px; text-align:right">
											<strong>(직급,직무)</strong><a href="javascript:postnTr()"><font id="postnTab">▼</font></a>								
										</td>
									</tr>
									<!-- 주소 입력란 -->
									<tr>
										<td class="text-left" style="width:100%; border-top-width: 0px;" colspan="4" >
											<img alt="주소" src="resources/img/juso.png" width="20px" height="20px" style="vertical-align:top">
											<strong><font size=4  style="vertical-align:middle"> 주소</font></strong>
										</td>
									</tr>
									<tr>
										<td style="text-align:right; vertical-align:middle">
											<font>우편번호 </font>
										</td>
										<td colspan="3">
											<input class="form-control" id="postNum" placeholder="우편번호" style="text-align:center; width:100px;" maxlength="6" type="text" name="nmeCardPostNum" readonly>		
											<input class="form-control"  id="bascAdrs" style="width:242px;" type="text" name="nmeCardBascAdrs" readonly>
											<input class="btn btn-primary" type="button" style="margin-left: 10px;" onclick="searchPostNum()" value="우편번호 찾기">
										</td>
									</tr>
									<tr>
										<td style="text-align:right; vertical-align:middle; border-top-width: 0px;">
											<font>상세주소 </font>
										</td>
										<td colspan="3" style="border-top-width: 0px;">
											<input class="form-control" id="bascAdrs2" style="width:347px;" type="text" name="nmeCardDetlAdrs" required="required">
										</td>
									</tr>
									<tr>
										<td style="border-top-width: 0px;" colspan="4">
										<br>
										</td>
									</tr>
									<!-- 연락처 입력란 -->
									<tr>
										<td class="text-left" style="width:100%; border-top-width: 0px;" colspan="4">
											<img alt="연락처" src="resources/img/tel.png" width="20px" height="20px">
											<strong><font size=4  style="vertical-align:middle"> 연락처 </font></strong>
										</td>
									</tr>
									<tr>
										<td style="text-align:right; vertical-align:middle">
											<font>휴대폰 </font>
										</td>
										<td colspan="3">	
											<select id="mobile" class="form-control" style="width:100px;" onchange="javascript:insertMobil()">
													<option value="010">010</option>
													<option value="011">011</option>             
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="018">018</option>
													<option value="019">019</option>            
											</select>
											<font> - </font><input style="width:100px;" class="form-control" type="text" name="nmeCardMobil2" size="10" maxlength="4" autofocus required onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
											<font> - </font><input style="width:100px;" class="form-control" type="text" name="nmeCardMobil3" size="10" maxlength="4" autofocus required onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
										</td>
									</tr>
									<tr id="numTr" class="hide">									
										<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
											<font>전화 </font>	
										</td>
										<td colspan="3" style="border-top-width: 0px; vertical-align:middel">	
											<input style="width:100px" class="form-control" type="text" name="nmeCardTel" size="10" maxlength="3" autofocus required onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
											<font> - </font><input style="width:100px" class="form-control" type="text" name="nmeCardTel2" size="10" maxlength="4" autofocus required onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
											<font> - </font><input style="width:100px" class="form-control" type="text" name="nmeCardTel3" size="10" maxlength="4" autofocus required onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
												
										</td>	
									</tr>
									<tr id="numTr2" class="hide">
										<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
											<font>팩스 </font>													
										</td>
										<td colspan="3" style="border-top-width: 0px; vertical-align:middle">
											<input style="width:100px;" class="form-control" type="text" name="nmeCardFax" size="10" maxlength="3" autofocus required onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
											<font> - </font><input style="width:100px" class="form-control" type="text" name="nmeCardFax2" size="10" maxlength="4" autofocus required onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
											<font> - </font><input style="width:100px" class="form-control" type="text" name="nmeCardFax3" size="10" maxlength="4" autofocus required onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
										</td>
									</tr>
									<tr>
										<td colspan="4" style="border-top-width: 0px; text-align:right">
											<strong>(전화,팩스)</strong><a href="javascript:numTr()"><font id="numTab">▼</font></a>								
										</td>
									</tr>
									<!-- 네트워크 입력란 -->
									<tr>
										<td class="text-left" style="width:100%; border-top-width: 0px;" colspan="4">
											<img alt="네트워크" src="resources/img/network.png" width="20px" height="20px" style="vertical-align:top">
											<strong><font size=4  style="vertical-align:middle"> 네트워크</font></strong>
										</td>
									</tr>
									<tr>
										<td style="text-align:right">
											<font>이메일 </font>
										</td>
										<td colspan="3">
											<input class="form-control" style="width:100px" type="text" size="20" id="nmeCardEmail" name="nmeCardEmail" autofocus required onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9,_,-]/g,'');">
											@
											<input class="form-control" style="width:100px" type="text" size="20" id="nmeCardEmail2" name="nmeCardEmail2" autofocus required onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9,.,_,-]/g,'');">
											<select id="email" class="form-control" style="width:120px;" onChange="insertEmail();">
													<option value="0" selected>직접입력</option>					
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
									<tr>
										<td style="text-align:right; border-top-width: 0px;">
											<font>홈페이지 </font>
										</td>
										<td colspan="3" style="border-top-width: 0px;">
											<input class="form-control" style="width:346px" type="text" size="20" id="nmeCardHompg" name="nmeCardHompg" autofocus required onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9,.,:,_,-/]/g,'');">
										</td>
									</tr>
									<tr id="netTr" class="hide">									
										<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
											<font>SNS</font>
										</td>
										<td colspan="3" style="border-top-width: 0px; vertical-align:middel">	
											<input class="form-control" style="width:100px;" type="text" size="16" name="nmeCardSns" maxlength="20">
											<input class="form-control" style="width:100px" type="text" size="20" id="nmeCardSns2" name="nmeCardSns2">
											<select id="sns" class="form-control" style="width:120px" onChange="insertSns();">
													<option value="0" selected>직접입력</option>					
													<option value="카카오스토리">카카오스토리</option>
													<option value="페이스북">페이스북</option>             
													<option value="트위터">트위터</option>
													<option value="Tumblr">Tumblr</option>
													<option value="Pinterest">Pinterest</option>
													<option value="StumbleUpon">StumbleUpon</option>
													<option value="reddit is fun">reddit is fun</option>
													<option value="Instagram">Instagram</option>
													<option value="LinkedIn">LinkedIn</option>
													<option value="BAND">BAND</option>       				
											</select>
										</td>	
									</tr>
									<tr id="netTr2" class="hide">
										<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
											<font>메신저 </font>												
										</td>
										<td colspan="3" style="border-top-width: 0px; vertical-align:middle">
											<input class="form-control" style="width:100px;" type="text" size="16" name="nmeCardMesngr" maxlength="20">
											<input class="form-control" style="width:100px" type="text" size="20" id="nmeCardMesngr2" name="nmeCardMesngr2">
											<select id="mesngr" class="form-control" style="width:120px" onChange="insertMesngr();">
													<option value="0" selected>직접입력</option>					
													<option value="카카오톡">카카오톡</option>
													<option value="라인">라인</option>             
													<option value="탱고">탱고</option>
													<option value="위챗">위챗</option>
													<option value="바이버">바이버</option>
													<option value="왓츠앱">왓츠앱</option>
													<option value="마이피플">마이피플</option>
													<option value="네이트온">네이트온</option>
													<option value="스카이프">스카이프</option>       				
											</select>
										</td>
									</tr>
									<tr>
										<td colspan="4" style="border-top-width: 0px; text-align:right">
											<strong>(SNS,메신저)</strong><a href="javascript:netTr()"><font id="netTab">▼</font></a>								
										</td>
									</tr>
									<!-- 기타 입력란 -->
									<tr>
										<td class="text-left" style="width:100%; border-top-width: 0px;" colspan="4">
											<img alt="기타" src="resources/img/etc.png" width="20px" height="20px" style="vertical-align:top">
											<strong><font size=4  style="vertical-align:middle"> 기타</font></strong>
										</td>
									</tr>
									<tr id="etcTr" class="hide">									
										<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
											<font>취미 </font>	
										</td>
										<td colspan="3" style="border-top-width: 0px; vertical-align:middel">	
											<input class="form-control" style="width:100px;" type="text" size="16" name="nmeCardHob" maxlength="20">
										</td>	
									</tr>
									<tr id="etcTr2" class="hide">
										<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
											<font>관심사</font>													
										</td>
										<td colspan="3" style="border-top-width: 0px; vertical-align:middle">
											<input class="form-control" style="width:100px;" type="text" size="16" name="nmeCardInterst" maxlength="20">
										</td>
									</tr>
									<tr id="etcTr3" class="hide">
										<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
											<font>자격증</font>													
										</td>
										<td colspan="3" style="border-top-width: 0px; vertical-align:middle">
											<!-- 자격증 입력란 -->			
											<div id="licnsId" style="float:left; width:650px">						
											    <select id="licns" name="dd" multiple class="demo-default">
													<c:forEach items="${selectLicnsList}" var="item">
														<option value="${item.licnsSeq}">${item.licnsNme}</option>
													</c:forEach>
												</select>
												<script>
												$('#licns').selectize({
													  maxItems: 10
												});
												</script>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="4" style="border-top-width: 0px; text-align:right">
											<strong>(취미, 관심사, 자격증)</strong><a href="javascript:etcTr()"><font id="etcTab">▼</font></a>								
										</td>
									</tr>
								</table>
							</div>
							<div class="form-group col-sm-12" style="text-align:right; padding-right:80px">
								<input class="btn btn-default" type="button" value="등록" onclick="javascript:insertNmeCard()">
								<input class="btn btn-white" type="button" value="취소" onclick="javascript:insertCancel()">
							</div>
						</article>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>