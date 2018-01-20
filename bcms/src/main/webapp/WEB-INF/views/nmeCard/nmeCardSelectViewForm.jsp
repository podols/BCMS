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
				$('.cardBox${selectNmeCardView.nmeCardSeq}').css("box-shadow","6px 6px 6px rgb(66, 139, 202)"); //명함 선택했을 때 테두리 색깔 바꾸기
				});
			function nmeCardUpdateForm() { //명함 수정 화면
				document.nmeCardView.action = "/nmeCardUpdateForm.do";
				document.nmeCardView.submit();
			}
			function nmeCardComnctnSelectForm(nmeCardSeq) {
				//nmeCardComnctnSelectForm 으로 nmeCardSeq 를 보낸다.
				document.nmeCardInfo.nmeCardSeq.value = nmeCardSeq;
				document.nmeCardInfo.action = "/nmeCardComnctnSelectForm.do";
				document.nmeCardInfo.submit();
			}
			function nmeCardHistrSelectForm() {
				//nmeCardComnctnSelectForm 으로 nmeCardSeq 를 보낸다.
				document.nmeCardView.action = "/nmeCardHistrSelectForm.do";
				document.nmeCardView.submit();
			}
			function nmeCardButtonForm(nmeCardSeq) {
				//nmeCardButtonForm 으로 nmeCardSeq 를 보낸다.
				document.nmeCardInfo.nmeCardSeq.value = nmeCardSeq;
				document.nmeCardInfo.action = "/nmeCardButtonForm.do";
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
	<body onload="nmeCardButtonForm">
	<script>

	function sharForm(){
    var popUrl = "/sharForm.do";
	var popOption = "width=1400, height=820,  toolbar=no, location=no, directories=no, scrollbars=no, resizable=no, ";    //공유 팝업창 옵션(optoin)
	window.open(popUrl,"sharPopUp",popOption);
	}
	function sharRelsForm(){
	    var popUrl = "/sharRelsForm.do";
		var popOption = "width=590px, height=850,  toolbar=no, location=no, directories=no, scrollbars=no, resizable=no, ";    //공유해제 팝업창 옵션(optoin)
		window.open(popUrl,"sharRelsPopUp",popOption);
	}
	</script>
	<c:choose>
		<c:when test="${selectNmeCardView.nmeCardUseAt == 'Y'}">
			<c:import url="/nmeCardSelectForm.do"/>
		</c:when>
		<c:otherwise>
			<c:import url="/nmeCardBinSelectForm.do"/>
		</c:otherwise>
	</c:choose>
		<div class="body">
			<form name="nmeCardView" method="post">
				<input type="hidden" name="nmeCardSeq" value="${selectNmeCardView.nmeCardSeq}">
				<input type="hidden" name="currentPageNo" value="${selectNmeCardView.currentPageNo}"> <!-- 현재 페이지값 -->
				<input type="hidden" name="searchCnd" value="${selectNmeCardView.searchCnd}"> <!-- 검색조건 -->
				<input type="hidden" name="searchWrd" value="${selectNmeCardView.searchWrd}"> <!-- 검색단어 -->
			</form>
			<c:choose>
				<c:when test="${selectNmeCardView.nmeCardUseAt == 'Y'}">
					<div class="wrapper" style="width:600px; float:left; margin-left:250px;">
				</c:when>
				<c:otherwise>
					<div class="wrapper" style="width:600px;">
				</c:otherwise>	
			</c:choose>		
				<div class="card" style="width:500px">
					<div style="border:1px solid white">
					<h3  id="test" class="page-header" style="border-bottom:0px;float:left;">✴ 명함정보	</h3>	
					</div>
					<c:if test="${selectNmeCardView.nmeCardUseAt == 'Y'}">
						<div class="dropdown" style="width:30px;margin-left:133px;margin-top:35px;">
 							<input type="image" src="resources/img/share2.png" id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width:30px;height:30px; border:none ">
							<ul class="dropdown-menu" role="menu" style="text-align:left;">
								<li><a href="javascript:sharForm()">공유</a></li>
								<li><a href="javascript:sharRelsForm()">공유 관리</a></li>
							</ul>
						</div>
						<input class="btn btn-default" type="button" value="수정" style="float:right" onclick="javascript:nmeCardUpdateForm()">
					</c:if>
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
										<font>${selectNmeCardView.nmeCardLastNme}${selectNmeCardView.nmeCardFirstNme}</font>
									</td>
								</tr>
								<tr id="sexTr" class="hide">									
									<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
										<strong><font>성별 </font></strong>
									</td>	
									<td style="border-top-width: 0px; vertical-align:middle" colspan="3">
										<font> ${selectNmeCardView.nmeCardSex}</font>
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
										<font>${selectNmeCardView.nmeCardCompnNme}</font>
									</td>
									<td style="text-align:right; vertical-align:middle" >
										<strong>부서</strong>	
									</td>
									<td>								
										<font> ${selectNmeCardView.nmeCardDepmtNme}</font>
									</td>
								</tr>
								<tr id="postnTr" class="hide">									
									<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
										<strong>직급 </strong>
									</td>	
									<td style="border-top-width: 0px;">
									<c:choose>
										<c:when test="${selectNmeCardView.nmeCardPostnNme != ''}">
											<font>${selectNmeCardView.nmeCardPostnNme}</font>
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
										<c:when test="${selectNmeCardView.nmeCardJobNme != ''}">
											<font>${selectNmeCardView.nmeCardJobNme}</font>
										</c:when>
										<c:otherwise>
											<font>없음</font>
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
										<c:when test="${selectNmeCardView.nmeCardPostNum != ''}">
											<font>${selectNmeCardView.nmeCardPostNum}</font>
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
										<c:when test="${selectNmeCardView.nmeCardBascAdrs != ''}">
											<font>${selectNmeCardView.nmeCardBascAdrs}</font>
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
										<c:when test="${selectNmeCardView.nmeCardDetlAdrs != ''}">
											<font>${selectNmeCardView.nmeCardDetlAdrs}</font>
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
										<font>${selectNmeCardView.nmeCardMobil}</font>
									</td>
								</tr>
								<tr id="numTr" class="hide">									
									<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
										<strong>전화 </strong>	
									</td>
									<td colspan="3" style="border-top-width: 0px; vertical-align:middel">	
										<font>${selectNmeCardView.nmeCardTel}</font>
									</td>	
								</tr>
								<tr id="numTr2" class="hide">
									<td style="border-top-width: 0px; text-align:right; vertical-align:middle">
										<strong>팩스 </strong>													
									</td>
									<td colspan="3" style="border-top-width: 0px; vertical-align:middle">
										<font>${selectNmeCardView.nmeCardFax}</font>
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
										<c:when test="${selectNmeCardView.nmeCardEmail != ' '}">
											<font>${selectNmeCardView.nmeCardEmail}</font>
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
										<c:when test="${selectNmeCardView.nmeCardHompg != ''}">
											<font>${selectNmeCardView.nmeCardHompg}</font>
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
										<c:when test="${selectNmeCardView.nmeCardSns != ' '}">
											<font>${selectNmeCardView.nmeCardSns}</font>
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
										<c:when test="${selectNmeCardView.nmeCardMesngr != ' '}">
											<font>${selectNmeCardView.nmeCardMesngr}</font>
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
										<c:when test="${selectNmeCardView.nmeCardHob != ''}">
											<font>${selectNmeCardView.nmeCardHob}</font>
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
										<c:when test="${selectNmeCardView.nmeCardInterst != ''}">
											<font>${selectNmeCardView.nmeCardInterst}</font>
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
			<c:when test="${selectNmeCardView.nmeCardUseAt == 'Y'}">
				<c:import url="/nmeCardButtonForm.do"/>
			</c:when>
			<c:otherwise>
				
			</c:otherwise>
		</c:choose>
	</body>
</html>