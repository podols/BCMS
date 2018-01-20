<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script>
			document.title = 'BCMS - ${selectNmeCardView.nmeCardLastNme}${selectNmeCardView.nmeCardFirstNme} 님의 명함';
		</script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<style type="text/css">
			.ellip {
				white-space:nowrap;
				overflow:hidden;
				text-overflow:ellipsis;
			}
		</style>
		<script type="text/javascript">
		$(document).ready(function(){ //명함 상세보기 눌렀을 때 자동으로 화면 포커스
			$('#test').get(0).scrollIntoView(true);			
			$('.cardBox${selectRecvNmeCardView.nmeCardSeq}').css("box-shadow","6px 6px 6px rgb(66, 139, 202)"); //명함 선택했을 때 테두리 색깔 바꾸기
			});
			
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
		<c:choose>
			<c:when test="${selectRecvNmeCardView.recvNmeCardBinUseAt == 'N'}">
				<c:import url="/recvNmeCardSelectForm.do"/>
			</c:when>
			<c:when test="${selectRecvNmeCardView.recvNmeCardBinUseAt == 'B'}">
				<c:import url="/recvNmeCardBinSelectForm.do"/>
			</c:when>
		</c:choose>
		<div class="body">
			<form name="nmeCardView" method="post">
				<input type="hidden" name="nmeCardSeq" value="${selectRecvNmeCardView.nmeCardSeq}">
				<input type="hidden" name="currentPageNo" value="${selectRecvNmeCardView.currentPageNo}"> <!-- 현재 페이지값 -->
				<input type="hidden" name="searchCnd" value="${selectRecvNmeCardView.searchCnd}"> <!-- 검색조건 -->
				<input type="hidden" name="searchWrd" value="${selectRecvNmeCardView.searchWrd}"> <!-- 검색단어 -->
			</form>
			<c:choose>
				<c:when test="${selectRecvNmeCardView.recvNmeCardUseAt == 'C'}">
					<div class="wrapper" style="width:600px; float:left; margin-left:250px;">
				</c:when>
				<c:when test ="${selectRecvNmeCardView.recvNmeCardUseAt == 'D'}">
					<div class="wrapper" style="width:600px;">
				</c:when>	
			</c:choose>		
				<div class="card" style="width:500px">
					<div style="border:1px solid white">
					<h3  id="test" class="page-header" style="border-bottom:0px;float:left;">✴ 명함정보	</h3>	
					</div>
					<article>
						<div class="col-lg-12" style="margin-top:30px">
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
										<font>${selectRecvNmeCardView.nmeCardLastNme}${selectRecvNmeCardView.nmeCardFirstNme}</font>
									</td>
								</tr>
								<tr id="sexTr" class="hide">									
									<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
										<strong><font>성별 </font></strong>
									</td>	
									<td style="border-top-width: 0px; vertical-align:middle" colspan="3">
										<font> ${selectRecvNmeCardView.nmeCardSex}</font>
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
										<font>${selectRecvNmeCardView.nmeCardCompnNme}</font>
									</td>
									<td style="text-align:right; vertical-align:middle" >
										<strong>부서</strong>	
									</td>
									<td>								
										<font> ${selectRecvNmeCardView.nmeCardDepmtNme}</font>
									</td>
								</tr>
								<tr id="postnTr" class="hide">									
									<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
										<strong>직급 </strong>
									</td>	
									<td style="border-top-width: 0px;">
									<c:choose>
										<c:when test="${selectRecvNmeCardView.nmeCardPostnNme != ''}">
											<font>${selectRecvNmeCardView.nmeCardPostnNme}</font>
										</c:when>
										<c:otherwise>
											<font>없음</font>
										</c:otherwise>
									</c:choose>									
									</td>
									<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
										<strong>직무</strong>
									</td>
									<td style="border-top-width: 0px;">
									<c:choose>
										<c:when test="${selectRecvNmeCardView.nmeCardJobNme != ''}">
											<font>${selectRecvNmeCardView.nmeCardJobNme}</font>
										</c:when>
										<c:otherwise>
											<font>없음</font>
										</c:otherwise>
									</c:choose>	
									</td>
								</tr>
								<tr>
									<td colspan="4" style="border-top-width: 0px; text-align:right" onclick="postnTr()">
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
										<c:when test="${selectRecvNmeCardView.nmeCardPostNum != ''}">
											<font>${selectRecvNmeCardView.nmeCardPostNum}</font>
										</c:when>
										<c:otherwise>
											<font>없음</font>
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
										<c:when test="${selectRecvNmeCardView.nmeCardBascAdrs != ''}">
											<font>${selectRecvNmeCardView.nmeCardBascAdrs}</font>
										</c:when>
										<c:otherwise>
											<font>없음</font>
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
										<c:when test="${selectRecvNmeCardView.nmeCardDetlAdrs != ''}">
											<font>${selectRecvNmeCardView.nmeCardDetlAdrs}</font>
										</c:when>
										<c:otherwise>
											<font>없음</font>
										</c:otherwise>
									</c:choose>	
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
										<strong>휴대폰 </strong>
									</td>
									<td colspan="3">	
										<font>${selectRecvNmeCardView.nmeCardMobil}</font>
									</td>
								</tr>
								<tr id="numTr" class="hide">									
									<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
										<strong>전화 </strong>	
									</td>
									<td colspan="3" style="border-top-width: 0px; vertical-align:middel">	
										<font>${selectRecvNmeCardView.nmeCardTel}</font>
									</td>	
								</tr>
								<tr id="numTr2" class="hide">
									<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
										<strong>팩스 </strong>													
									</td>
									<td colspan="3" style="border-top-width: 0px; vertical-align:middle">
										<font>${selectRecvNmeCardView.nmeCardFax}</font>
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
										<c:when test="${selectRecvNmeCardView.nmeCardEmail != ' '}">
											<font>${selectRecvNmeCardView.nmeCardEmail}</font>
										</c:when>
										<c:otherwise>
											<font>없음</font>
										</c:otherwise>
									</c:choose>	
									</td>
								<tr>
									<td style="text-align:right; border-top-width: 0px;">
										<strong>홈페이지</strong>
									</td>
									<td colspan="3" style="border-top-width: 0px;">
									<c:choose>
										<c:when test="${selectRecvNmeCardView.nmeCardHompg != ''}">
											<font>${selectRecvNmeCardView.nmeCardHompg}</font>
										</c:when>
										<c:otherwise>
											<font>없음</font>
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
										<c:when test="${selectRecvNmeCardView.nmeCardSns != ' '}">
											<font>${selectRecvNmeCardView.nmeCardSns}</font>
										</c:when>
										<c:otherwise>
											<font>없음</font>
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
										<c:when test="${selectRecvNmeCardView.nmeCardMesngr != ' '}">
											<font>${selectRecvNmeCardView.nmeCardMesngr}</font>
										</c:when>
										<c:otherwise>
											<font>없음</font>
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
										<c:when test="${selectRecvNmeCardView.nmeCardHob != ''}">
											<font>${selectRecvNmeCardView.nmeCardHob}</font>
										</c:when>
										<c:otherwise>
											<font>없음</font>
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
										<c:when test="${selectRecvNmeCardView.nmeCardInterst != ''}">
											<font>${selectRecvNmeCardView.nmeCardInterst}</font>
										</c:when>
										<c:otherwise>
											<font>없음</font>
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
											<c:when test="${selectLicnsSeq.size() != 0}">																					
											<div style="float:left">										
												<select id="licnsSeq" name="licnsSeq" multiple class="demo-default" style="width:380px;" disabled>
													<c:forEach items="${selectLicnsSeq}" var="item">
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
						</div>
					</article>
				</div>
			</div>
		</div>
		<c:choose>
			<c:when test="${selectRecvNmeCardView.recvNmeCardBinUseAt == 'N'}">
				<c:import url="/recvNmeCardButtonForm.do"/>
			</c:when>
			<c:otherwise>
				
			</c:otherwise>
		</c:choose>
	</body>
</html>