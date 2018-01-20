<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>BCMS - 명함 수정</title>
		<link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script>		
		    function searchPostNum() { //우편번호 팝업창
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
		<script type="text/javascript">
			function updateNmeCard() { //명함 업데이트
				var arr = [];
				$.each($("#licnsId .item"),function(k,v){
				    arr[arr.length] = $(v).attr('data-value');
				});
				document.getElementById('licnsSeq').value = arr;
				document.frm.action = "/updateNmeCard.do";
				document.frm.submit();
			}
				
			function insertEmail(){ // 이메일 주소 넣기
		        if (frm.email3.value == '0') {
		            frm.nmeCardEmail2.readOnly = false;
		            frm.nmeCardEmail2.value = '';
		            frm.nmeCardEmail2.focus();
		        }
		        else {
		            frm.nmeCardEmail2.readOnly = true;
		            frm.nmeCardEmail2.value = frm.email3.value;
		        }
		    }
			
			function insertSns(){ // SNS 종류 넣기
		        if (frm.sns3.value == '0') {
		            frm.nmeCardSns2.readOnly = false;
		            frm.nmeCardSns2.value = '';
		            frm.nmeCardSns2.focus();
		        }
		        else {
		            frm.nmeCardSns2.readOnly = true;
		            frm.nmeCardSns2.value = frm.sns3.value;
		        }
		    }
			
			function insertMesngr(){ // 메신저 종류 넣기
		        if (frm.msg3.value == '0') {
		            frm.nmeCardMesngr2.readOnly = false;
		            frm.nmeCardMesngr2.value = '';
		            frm.nmeCardMesngr2.focus();
		        }
		        else {
		            frm.nmeCardMesngr2.readOnly = true;
		            frm.nmeCardMesngr2.value = frm.msg3.value;
		        }
		    }
				
			function nmeCardSelectForm() { //명함 수정 취소
				document.frm.action = "/nmeCardSelectForm.do";
				document.frm.submit();
			}
			
			function selectSex(){	//성별 선택
				var nmeCardSex = document.getElementById("sex").value;
				document.getElementById('nmeCardSex').value = nmeCardSex;
			}
			
			function selectMobil() { //휴대폰 앞자리 선택
				var nmeCardMobil = document.getElementById("mobil").value;
				document.getElementById('nmeCardMobil').value = nmeCardMobil;
			}
			
			function cutInfo() { // 개인정보 자르기
				//휴대폰 번호 자르기
				var mob = $("input[name=mobile]").attr("value");
				if (mob == '없음'){
					document.getElementById("mobil").value = '010';
					document.getElementById("mobil2").value = '';
					document.getElementById("mobil3").value = '';
				}
				else {
					mob = mob.replace(/\-/g,'');
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
					document.getElementById("mobil").value = fmob;
					document.getElementById("mobil2").value = mmob;
					document.getElementById("mobil3").value = lmob;
				}
				
				//전화번호 자르기
				var num = $("input[name=phone]").attr("value");
				if (num == '없음'){
					document.getElementById("tel").value = '';
					document.getElementById("tel2").value = '';
					document.getElementById("tel3").value = '';
				}
				else {
					num = num.replace(/\-/g,'');
					if (num.length==11){ 
						var fnum = (num.substring(0,3)); //3자리
						var mnum = (num.substring(3,7)); //4자리
						var lnum = (num.substring(7,11)); //4자리
					}
					else if (num.length==10){
						if(num.substring(0,2)== '02'){
							var fnum = (num.substring(0,2)); //2자리
							var mnum = (num.substring(2,6)); //4자리
							var lnum = (num.substring(6,10)); //4자리
						}
						else{
							var fnum = (num.substring(0,3)); //3자리
							var mnum = (num.substring(3,6)); //3자리
							var lnum = (num.substring(6,10)); //4자리
						}
					}
					else {
						var fnum = (num.substring(0,2)); //2자리
						var mnum = (num.substring(2,5)); //3자리
						var lnum = (num.substring(5,9)); //4자리
					}
					document.getElementById("tel").value = fnum;
					document.getElementById("tel2").value = mnum;
					document.getElementById("tel3").value = lnum;
				}
				
				//팩스번호 자르기
				var fax = $("input[name=fax]").attr("value");
				if (fax == '없음'){
					document.getElementById("fax").value = '';
					document.getElementById("fax2").value = '';
					document.getElementById("fax3").value = '';
				}
				else{
					fax = fax.replace(/\-/g,'');
					if (fax.length==11){
						var ffax = (fax.substring(0,3)); //3자리
						var mfax = (fax.substring(3,7)); //4자리
						var lfax = (fax.substring(7,11)); //4자리
					}
					else if (fax.length==10){
						if(fax.substring(0,2)== '02'){
							var ffax = (fax.substring(0,2)); //2자리
							var mfax = (fax.substring(2,6)); //4자리
							var lfax = (fax.substring(6,10)); //4자리
						}
						else{
							var ffax = (fax.substring(0,3)); //3자리
							var mfax = (fax.substring(3,6)); //3자리
							var lfax = (fax.substring(6,10)); //4자리
						}
					}
					else {
						var ffax = (fax.substring(0,2)); //2자리
						var mfax = (fax.substring(2,5)); //3자리
						var lfax = (fax.substring(5,10)); //4자리
					}
					document.getElementById("fax").value = ffax;
					document.getElementById("fax2").value = mfax;
					document.getElementById("fax3").value = lfax;
				}

				//이메일 주소 자르기
				var eadrs = $("input[name=eadrs]").attr("value");
				var email = eadrs.split("@");
				
				if (eadrs==" "){
					document.getElementById("email").value = "";
					document.getElementById("email2").value = "";
				}
				else {
					document.getElementById("email").value = email[0];
					document.getElementById("email2").value = email[1];
				}
				//SNS 자르기
				var social = $("input[name=social]").attr("value");
				social = social.replace(/\)/g,'');
				var sns = social.split("(");		
				
				if (social == " "){
					document.getElementById("sns").value = "";
					document.getElementById("sns2").value = "";	
				}
				else {
					document.getElementById("sns").value = sns[0];
					document.getElementById("sns2").value = sns[1];
				}
				
				//메신저 자르기
				var msg = $("input[name=msg]").attr("value");
				msg = msg.replace(/\)/g,'');
				var mesngr = msg.split("(");		
				
				if (msg == " "){
					document.getElementById("msg").value = "";
					document.getElementById("msg2").value = "";
				}
				else {
					document.getElementById("msg").value = mesngr[0];
					document.getElementById("msg2").value = mesngr[1];
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
		<script type="text/javascript"> //성별 disabled submit할 때 걸기
		$("#sex option").not(":selected").attr("disabled", "disabled");

		// to remove readonly, enable them again:
		$("#sex option").not(":selected").attr("disabled", "")
		</script>
	</head>
	<body onload="cutInfo()">
		<div class="head">
			<c:import url="/title.do"/>
		</div>
		<div class="wrapper">		
			<form name="frm" method="post">
				<input type="hidden" name="nmeCardSeq" value="${selectNmeCardView.nmeCardSeq}">
				<input type="hidden" name="nmeCardUseAt" value="${selectNmeCardView.nmeCardUseAt}">
				<input type="hidden" name="cretrSeq" value="${selectNmeCardView.cretrSeq}">
				<input type="hidden" name="nmeCard`" value="010">
				<input type="hidden" name="nmeCardSex" id="nmeCardSex" value="${selectNmeCardView.nmeCardSex}">
				<input type="hidden" name="nmeCardMobil" id="nmeCardMobil" value="010">
				<input type="hidden" name="licnsSeq" id="licnsSeq" value="0">
				<input type="hidden" name="mobile" value="${selectNmeCardView.nmeCardMobil}"> <!-- 휴대폰 번호 -->
				<input type="hidden" name="phone" value="${selectNmeCardView.nmeCardTel}"> <!-- 전화 번호 -->
				<input type="hidden" name="fax" value="${selectNmeCardView.nmeCardFax}"> <!-- FAX 번호 -->
				<input type="hidden" name="eadrs" value="${selectNmeCardView.nmeCardEmail}"> <!-- 이메일 주소 -->
				<input type="hidden" name="social" value="${selectNmeCardView.nmeCardSns}"> <!-- SNS -->
				<input type="hidden" name="msg" value="${selectNmeCardView.nmeCardMesngr}"> <!-- 메신저 -->
 				<aside>
					<c:import url="/newSpeed.do"/>
				</aside>
				<div class="card">
					<h3 class="page-header" style="border-bottom:0px;padding-left: 200px;padding-right: 200px;">✴ 명함 수정</h3>
						<article class="card-list">
							<div class="col-lg-12" style="padding-left: 80px; padding-right: 80px;">
								<table class="table" style="width:800px; margin:0 auto;">
								<colgroup>
									<col width="100px">
									<col width="300px">
									<col width="100px">
									<col width="300px">
								</colgroup>	
								<!-- 이름 입력란 -->
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
										<input class="form-control" value="${selectNmeCardView.nmeCardLastNme}" style="width:100px; margin-right: 10px;" type="text" id="nmeCardLastNme" name="nmeCardLastNme" style="width:30px" size="5" readonly>
									</td>
									<td style="text-align:right; vertical-align:middle">
										<font>* 이름 </font>
									</td>
									<td style="vertical-align:middle">
										<input class="form-control" value="${selectNmeCardView.nmeCardFirstNme}" style="width:100px;" type="text" id="nmeCardFirstNme" name="nmeCardFirstNme" style="width:30px" size="5" readonly>
									</td>
								</tr>									
								<tr id="sexTr" class="hide">									
									<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
										<font style="margin-left: 23px;">성별 </font>
									</td>	
									<td style="border-top-width: 0px; vertical-align:middle" colspan="3">
										<select id="sex" class="form-control" style="width:80px" onchange="javascript:selectSex()">
											<c:choose>
												<c:when test="${selectNmeCardView.nmeCardSex == '남자'}">
													<option value="남자" selected="selected" disabled="disabled">남자</option>
													<option value="여자" disabled="disabled" >여자</option>
												</c:when>
												<c:when test="${selectNmeCardView.nmeCardSex == '여자'}">
													<option value="남자" disabled="disabled" >남자</option>
													<option value="여자" selected="selected" disabled="disabled" >여자</option>
												</c:when>
											</c:choose>        
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="4" style="border-top-width: 0px; text-align:right" onclick="javascript:sexTr()">
										<strong>(성별)</strong><font id="sexTab">▼</font>								
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
											<select id="nmeCardCompnSeq" name="nmeCardCompnSeq" multiple class="demo-default" style="width:200px;">
												<c:forEach items="${compnList}" var="item">
													<c:if test="${selectNmeCardView.nmeCardCompnSeq == item.compnSeq}">
														<option value="${item.compnSeq}" selected>${item.compnNme}</option>
													</c:if>
													<c:if test="${selectNmeCardView.nmeCardCompnSeq != item.compnSeq}">
														<option value="${item.compnSeq}">${item.compnNme}</option>
													</c:if>
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
													<c:if test="${selectNmeCardView.nmeCardDepmtSeq == item.depmtSeq}">
														<option value="${item.depmtSeq}" selected>${item.depmtNme}</option>
													</c:if>
													<c:if test="${selectNmeCardView.nmeCardDepmtSeq != item.depmtSeq}">
														<option value="${item.depmtSeq}">${item.depmtNme}</option>
													</c:if>
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
										<input class="form-control" value="${selectNmeCardView.nmeCardPostnNme}" style="width:100px; margin-right: 10px;" type="text" size="16" name="nmeCardPostnNme" maxlength="20"></td>
									<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
										<font>직무 </font>
									</td>
									<td style="border-top-width: 0px;">
										<input class="form-control" value="${selectNmeCardView.nmeCardJobNme}" style="width:100px;" type="text" size="16" name="nmeCardJobNme" maxlength="20">
									</td>
								</tr>
								<tr>
									<td colspan="4" style="border-top-width: 0px; text-align:right" onclick="javascript:postnTr()">
										<strong>(직급,직무)</strong><font id="postnTab">▼</font>			
									</td>
								</tr>
								<!-- 주소 입력란 --><tr>
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
										<input class="form-control" value="${selectNmeCardView.nmeCardPostNum}" id="postNum" placeholder="우편번호" style="text-align:center; width:100px;" maxlength="6" type="text" name="nmeCardPostNum" readonly>		
										<input class="form-control"  value="${selectNmeCardView.nmeCardBascAdrs}" id="bascAdrs" style="width:242px;" type="text" name="nmeCardBascAdrs" readonly>
										<input class="btn btn-primary" type="button" style="margin-left: 10px;" onclick="searchPostNum()" value="우편번호 찾기">
									</td>
								</tr>
								<tr>
									<td style="text-align:right; vertical-align:middle; border-top-width: 0px;">
										<font>상세주소 </font>
									</td>
									<td colspan="3" style="border-top-width: 0px;">
										<input class="form-control" value="${selectNmeCardView.nmeCardDetlAdrs}" id="bascAdrs2" style="width:347px;" type="text" name="nmeCardDetlAdrs" required="required">
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
										<select id="mobil" class="form-control" style="width:100px;" onchange="javascript:selectMobil()">
											<option value="010">010</option>
											<option value="011">011</option>             
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>            
										</select>
										<font> - </font><input style="width:100px;" class="form-control" type="text" name="nmeCardMobil2" size="10" maxlength="4" id="mobil2" autofocus required onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
										<font> - </font><input style="width:100px;" class="form-control" type="text" name="nmeCardMobil3" size="10" maxlength="4" id="mobil3" autofocus required onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
									</td>
								</tr>
								<tr id="numTr" class="hide">									
									<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
										<font>전화 </font>	
									</td>
									<td colspan="3" style="border-top-width: 0px; vertical-align:middel">	
										<input style="width:100px" class="form-control" id="tel" type="text" name="nmeCardTel" size="10" maxlength="3" autofocus required onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
										<font> - </font><input style="width:100px" id="tel2" class="form-control" type="text" name="nmeCardTel2" size="10" maxlength="4" autofocus required onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
										<font> - </font><input style="width:100px" id="tel3" class="form-control" type="text" name="nmeCardTel3" size="10" maxlength="4" autofocus required onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
									</td>	
								</tr>
								<tr id="numTr2" class="hide">
									<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
										<font>팩스 </font>													
									</td>
									<td colspan="3" style="border-top-width: 0px; vertical-align:middle">
										<input style="width:100px;" class="form-control" id="fax" type="text" name="nmeCardFax" size="10" maxlength="4">
										<font> - </font><input style="width:100px" id="fax2" class="form-control" type="text" name="nmeCardFax2" size="10" maxlength="4">
										<font> - </font><input style="width:100px" id="fax3" class="form-control" type="text" name="nmeCardFax3" size="10" maxlength="4">
									</td>
								</tr>
								<tr>
									<td colspan="4" style="border-top-width: 0px; text-align:right" onclick="javascript:numTr()">
										<strong>(전화,팩스)</strong><font id="numTab">▼</font>		
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
										<input class="form-control" id="email" style="width:100px" type="text" size="20" name="nmeCardEmail" autofocus required onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9,_,-]/g,'');">
											@
										<input class="form-control" id="email2" style="width:100px" type="text" size="20" name="nmeCardEmail2" autofocus required onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9,.,_,-]/g,'');">
										<select id="email3" class="form-control" style="width:120px;" onChange="insertEmail();">
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
										<input class="form-control" value="${selectNmeCardView.nmeCardHompg}" style="width:346px" type="text" size="20" id="nmeCardHompg" name="nmeCardHompg" autofocus required onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9,.,:,_,-/]/g,'');">
									</td>
								</tr>
								<tr id="netTr" class="hide">									
									<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
										<font>SNS</font>
									</td>
									<td colspan="3" style="border-top-width: 0px; vertical-align:middel">	
										<input class="form-control" style="width:100px;" id="sns" type="text" size="16" name="nmeCardSns" maxlength="20">
										<input class="form-control" style="width:100px" id="sns2" type="text" size="20" name="nmeCardSns2">
										<select id="sns3" class="form-control" style="width:120px" onChange="insertSns();">
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
										<input class="form-control" id="msg" style="width:100px;" type="text" size="16" name="nmeCardMesngr" maxlength="20">
										<input class="form-control" id="msg2" style="width:100px" type="text" size="20" name="nmeCardMesngr2">
										<select id="msg3" class="form-control" style="width:120px" onChange="insertMesngr();">
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
									<td colspan="4" style="border-top-width: 0px; text-align:right" onclick="javascript:netTr()">
										<strong>(SNS,메신저)</strong><font id="netTab">▼</font>		
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
										<input class="form-control" value="${selectNmeCardView.nmeCardHob}" style="width:100px;" type="text" size="16" name="nmeCardHob" maxlength="20">
									</td>	
								</tr>
								<tr id="etcTr2" class="hide">
									<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
										<font>관심사</font>													
									</td>
									<td colspan="3" style="border-top-width: 0px; vertical-align:middle">
										<input class="form-control" value="${selectNmeCardView.nmeCardInterst}" style="width:100px;" type="text" size="16" name="nmeCardInterst" maxlength="20">
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
													<c:forEach items="${selectLicnsSeq}" var="seq">
														<c:if test="${seq.licnsSeq eq item.licnsSeq}">
															<option value="${item.licnsSeq}" selected>${item.licnsNme}</option>		
														</c:if>									
													</c:forEach>
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
									<td colspan="4" style="border-top-width: 0px; text-align:right" onclick="javascript:etcTr()">
										<strong>(취미, 관심사, 자격증)</strong><font id="etcTab">▼</font>				
									</td>
								</tr>
							</table>
						</div>
						<div class="form-group col-sm-12" style="text-align:right; padding-right:80px">
							<input class="btn btn-primary" type="button" value="수정" onclick="javascript:updateNmeCard()">
							<input class="btn btn-default" type="button" value="취소" onclick="javascript:nmeCardSelectForm()">
						</div>
					</article>
				</div>
			</form>
		</div>
	</body>
</html>