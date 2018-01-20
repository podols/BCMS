<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		
		   	<link rel="stylesheet" href="/resources/dist/css/ui.css" type="text/css">
 			<link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">			
			<script src="http://code.jquery.com/jquery-latest.min.js"></script>
			<script src="/resources/dist/js/selectize/selectize.js"></script>
			<link rel="stylesheet" href="/resources/dist/css/css/normalize.css">
			<link rel="stylesheet" href="/resources/dist/css/css/default.css">
		<script>
			document.title = 'BCMS - ${selectNmeCardHistrView.nmeCardHistrLastNme}${selectNmeCardHistrView.nmeCardHistrFirstNme} 님의 명함 변경내역';
		</script>
		<script type="text/javascript">
			function nmeCardHistrBack(page) { //명함 변경내역 리스트
		    	document.getElementById("after").value = "";
				document.getElementById("before").value = "";
				document.nmeCardInfo.currentPageNo.value = page;		
				document.nmeCardInfo.action = "/nmeCardHistrSelectForm.do";
				document.nmeCardInfo.submit();
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
		
	</head>
	<body>
		<div class="wrapper" style="width:600px;">
			<form name="nmeCardInfo" method="post">		
				<input type="hidden" name="nmeCardHistrSeq" value="${nmeCardHistrValueObject.nmeCardHistrSeq}">
				<input type="hidden" name="nmeCardSeq" value="${nmeCardHistrValueObject.nmeCardSeq}">
				<input type="hidden" id="pageNo" name="currentPageNo" value="1">			
				<input type="hidden" id="after" name="searchAfter" value="">
				<input type="hidden" id="before" name="searchBefore" value="">
			</form>
			<div class="card" style="width:500px">
				<div style="border:1px solid white">
				<h3 class="page-header" style="border-bottom:0px">✴ 명함 변경내역	</h3>	
				</div>
				
				<article>
					<div class="col-lg-12">
						<table class="table" style="width:100%;">
							<colgroup>
								<col width="80px">
								<col width="170px">
								<col width="80px">
								<col width="170px">
							</colgroup>	
							<!-- 성명 입력란 -->
							<tr>
								<td class="text-left" colspan="4" style="border-top-width: 0px;">
									<img alt="이름" src="resources/img/name.png" width="20px" height="20px" style="vertical-align:top">
									<strong><font size=4  style="vertical-align:middle"> 성명</font></strong>
								</td>
							</tr>
							<tr>
								<td style="text-align:right; vertical-align:middle;">								
									<strong><font>이름</font></strong>
								</td>
								<td style="vertical-align:middle" colspan="3">
									<font>${selectNmeCardHistrView.nmeCardHistrLastNme}${selectNmeCardHistrView.nmeCardHistrFirstNme}</font>
								</td>
							</tr>
							<tr id="sexTr" class="hide">									
								<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
									<strong><font>성별 </font></strong>
								</td>	
								<td style="border-top-width: 0px; vertical-align:middle" colspan="3">
									<font>${selectNmeCardHistrView.nmeCardHistrSex}</font>
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
									<strong>회사</strong>
								</td>
								<td>
									<font>${selectNmeCardHistrView.nmeCardHistrCompnNme}</font>
								</td>
								<td style="text-align:right; vertical-align:middle" >
									<strong>부서</strong>	
								</td>
								<td>								
									<font>${selectNmeCardHistrView.nmeCardHistrDepmtNme}</font>
								</td>
							</tr>
							<tr id="postnTr" class="hide">									
								<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
									<strong>직급 </strong>
								</td>	
								<td style="border-top-width: 0px;">
								<c:choose>
									<c:when test="${selectNmeCardHistrView.nmeCardHistrPostnNme != ''}">
										<font>${selectNmeCardHistrView.nmeCardHistrPostnNme}</font>
									</c:when>
									<c:otherwise>
										없음
									</c:otherwise>
								</c:choose>									
								</td>
								<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
									<strong>직무</strong>
								</td>
								<td style="border-top-width: 0px;">
								<c:choose>
									<c:when test="${selectNmeCardHistrView.nmeCardHistrJobNme != ''}">
										<font>${selectNmeCardHistrView.nmeCardHistrJobNme}</font>
									</c:when>
									<c:otherwise>
										없음
									</c:otherwise>
								</c:choose>	
								</td>
							</tr>
							<tr>
								<td colspan="4" style="border-top-width: 0px; text-align:right" onclick="javascript:postnTr()">
									<strong>(직급,직무)</strong><font id="postnTab">▼</font>	
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
									<strong>우편번호</strong>
								</td>
								<td colspan="3">
								<c:choose>
									<c:when test="${selectNmeCardHistrView.nmeCardHistrPostNum != ''}">
										<font>${selectNmeCardHistrView.nmeCardHistrPostNum}</font>
									</c:when>
									<c:otherwise>
										없음
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
							<tr>
								<td style="text-align:right; border-top-width: 0px; vertical-align:middle">
									<strong>기본주소</strong>
								</td>
								<td style=" border-top-width: 0px;" colspan="3">
								<c:choose>
									<c:when test="${selectNmeCardHistrView.nmeCardHistrBascAdrs != ''}">
										<font>${selectNmeCardHistrView.nmeCardHistrBascAdrs}</font>
									</c:when>
									<c:otherwise>
										없음
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
							<tr>
								<td style="text-align:right; vertical-align:middle; border-top-width: 0px;">
									<strong>상세주소</strong>
								</td>
								<td colspan="3" style="border-top-width: 0px;">
								<c:choose>
									<c:when test="${selectNmeCardHistrView.nmeCardHistrDetlAdrs != ''}">
										<font>${selectNmeCardHistrView.nmeCardHistrDetlAdrs}</font>
									</c:when>
									<c:otherwise>
										없음
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
							<tr>
								<td style="border-top-width: 0px;" colspan="4">
								<br>
								</td>
							</tr>
							<!-- 연락처 입력란 --><tr>
							<td class="text-left" style="width:100%; border-top-width: 0px;" colspan="4">
								<img alt="연락처" src="resources/img/tel.png" width="20px" height="20px">
								<strong><font size=4  style="vertical-align:middle"> 연락처 </font></strong>
							</td>
							</tr>
							<tr>
								<td style="text-align:right; vertical-align:middle">
									<strong>휴대폰 </strong>
								</td>
								<td colspan="3">	
									<font>${selectNmeCardHistrView.nmeCardHistrMobil}</font>
								</td>
							</tr>
							<tr id="numTr" class="hide">									
								<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
									<strong>전화 </strong>	
								</td>
								<td colspan="3" style="border-top-width: 0px; vertical-align:middel">	
									<font>${selectNmeCardHistrView.nmeCardHistrTel}</font>
								</td>	
							</tr>
							<tr id="numTr2" class="hide">
								<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
									<strong>팩스 </strong>													
								</td>
								<td colspan="3" style="border-top-width: 0px; vertical-align:middle">
									<font>${selectNmeCardHistrView.nmeCardHistrFax}</font>
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
									<strong>이메일 </strong>
								</td>
								<td colspan="3">
								<c:choose>
									<c:when test="${selectNmeCardHistrView.nmeCardHistrEmail != ' '}">
										<font>${selectNmeCardHistrView.nmeCardHistrEmail}</font>
									</c:when>
									<c:otherwise>
										없음
									</c:otherwise>
								</c:choose>
								</td>
							<tr>
								<td style="text-align:right; border-top-width: 0px;">
									<strong>홈페이지</strong>
								</td>
								<td colspan="3" style="border-top-width: 0px;">
								<c:choose>
									<c:when test="${selectNmeCardHistrView.nmeCardHistrHompg != ''}">
										<font>${selectNmeCardHistrView.nmeCardHistrHompg}</font>
									</c:when>
									<c:otherwise>
										없음
									</c:otherwise>
								</c:choose>	
								</td>
							</tr>
							<tr id="netTr" class="hide">									
								<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
									<strong>SNS</strong>
								</td>
								<td colspan="3" style="border-top-width: 0px; vertical-align:middel">	
								<c:choose>
									<c:when test="${selectNmeCardHistrView.nmeCardHistrSns != ' '}">
										<font>${selectNmeCardHistrView.nmeCardHistrSns}</font>
									</c:when>
									<c:otherwise>
										없음
									</c:otherwise>
								</c:choose>	
								</td>	
							</tr>
							<tr id="netTr2" class="hide">
								<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
									<strong>메신저 </strong>												
								</td>
								<td colspan="3" style="border-top-width: 0px; vertical-align:middle">
								<c:choose>
									<c:when test="${selectNmeCardHistrView.nmeCardHistrMesngr != ' '}">
										<font>${selectNmeCardHistrView.nmeCardHistrMesngr}</font>
									</c:when>
									<c:otherwise>
										없음
									</c:otherwise>
								</c:choose>	
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
								<td style="text-align:right; vertical-align:middle">
									<strong>취미</strong>
								</td>
								<td colspan="3" style="vertical-align:middel">	
								<c:choose>
									<c:when test="${selectNmeCardHistrView.nmeCardHistrHob != ''}">
										<font>${selectNmeCardHistrView.nmeCardHistrHob}</font>
									</c:when>
									<c:otherwise>
										없음
									</c:otherwise>
								</c:choose>	
								</td>	
							</tr>
							<tr id="etcTr2" class="hide">
								<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
									<strong>관심사</strong>													
								</td>
								<td colspan="3" style="border-top-width: 0px; vertical-align:middle">
								<c:choose>
									<c:when test="${selectNmeCardHistrView.nmeCardHistrInterst != ''}">
										<font>${selectNmeCardHistrView.nmeCardHistrInterst}</font>
									</c:when>
									<c:otherwise>
										없음
									</c:otherwise>
								</c:choose>									
								</td>
							</tr>
							<tr id="etcTr3" class="hide">
								<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
									<strong>자격증</strong>													
								</td>
								<td colspan="3" style="border-top-width: 0px; vertical-align:middle">
									<!-- 자격증 입력란 -->		
									<c:choose>
										<c:when test="${selectLicnsSeqHistr.size() != 0}">	
										<div style="float:left">
											<select id="licnsSeq" name="licnsSeq" multiple class="demo-default" style="width:370px;" disabled>
												<c:forEach items="${selectLicnsSeqHistr}" var="item">
													<option value="${item.licnsSeq}" selected>${item.licnsNme}</option>
												</c:forEach>
											</select>
											<script>
												$('#licnsSeq').selectize({
													maxItems: 10
												});
											</script>
										</div>
										</c:when>
										<c:otherwise>
											없음
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<td colspan="4" style="border-top-width: 0px; text-align:right" onclick="javascript:etcTr()">
									<strong>(취미, 관심사, 자격증)</strong><font id="etcTab">▼</font>					
								</td>
							</tr>
						</table>
						<button class="btn btn-default" style="margin-left:7px; float:right" onclick="javascript:nmeCardHistrBack(1)">돌아가기</button>
					</div>
				</article>
			</div>
		</div>
	</body>
</html>