<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>BCMS - 나의 명함 리스트</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<style type="text/css">
			.ellip {
				white-space:nowrap;
				overflow:hidden;
				text-overflow:ellipsis;
			}
		</style>
		
		<script type="text/javascript">
			function nmeCardInsertForm() { //명함 등록 화면
				document.nmeCardInfo.action = "/nmeCardInsertForm.do";
				document.nmeCardInfo.submit();
			}
			
			function nmeCardSelectViewForm(nmeCardSeq) { //명함 상세보기				
				var searchWrd = document.getElementById("searchWrd").value;
				var searchCnd = document.getElementById("searchCnd").value;
				var searchAry = document.getElementById("searchAry").value;
				document.nmeCardInfo.nmeCardSeq.value = nmeCardSeq;
				document.nmeCardInfo.searchCnd.value = searchCnd;
				document.nmeCardInfo.searchWrd.value = searchWrd;
				document.nmeCardInfo.searchAry.value = searchAry;				
				document.nmeCardInfo.action = "/nmeCardSelectViewForm.do";
				document.nmeCardInfo.submit();
			}
			
			function arrayNmeCard(page) { //명함 정렬보기
				var searchWrd = document.getElementById("searchWrd").value;
				var searchCnd = document.getElementById("searchCnd").value;
				var searchAry = document.getElementById("searchAry").value;
				document.nmeCardInfo.currentPageNo.value = page;				
				document.nmeCardInfo.searchCnd.value = searchCnd;
				document.nmeCardInfo.searchWrd.value = searchWrd;
				document.nmeCardInfo.searchAry.value = searchAry;
				document.nmeCardInfo.action = "/nmeCardSelectForm.do";
				document.nmeCardInfo.submit();
			}
			
			function nmeCardSearchForm(page) { //명함 검색 보기
				var searchWrd = document.getElementById("searchWrd").value;
				var searchCnd = document.getElementById("searchCnd").value;
				var searchAry = document.getElementById("searchAry").value;
				if (document.getElementById("searchWrd").value==""){
					alert("검색어를 입력하세요");
				}
				else{
					document.nmeCardInfo.currentPageNo.value = page;
					document.nmeCardInfo.searchCnd.value = searchCnd;
					document.nmeCardInfo.searchWrd.value = searchWrd;
					document.nmeCardInfo.searchAry.value = searchAry;
					document.nmeCardInfo.action = "/nmeCardSelectForm.do";
					document.nmeCardInfo.submit();
				}
			}
					
			function deleteNmeCard(){ //명함 체크박스 삭제
				var nmeCardSeq ="";
				var checkArray = new Array();  
				<c:forEach var="selectNmeCardList" items="${selectNmeCardList}" varStatus="status">
					nmeCardSeq= "#"+"${selectNmeCardList.nmeCardSeq}";
					if($(nmeCardSeq).is(":checked")){
						checkArray.push("${selectNmeCardList.nmeCardSeq}");			
					}
				</c:forEach>
				if(checkArray.length == 0){
					alert("삭제할 명함을 선택하세요.")
				}
				else{
					if (confirm("삭제하시겠습니까?") == true){    //확인
						$.ajax({
						type : 'POST',
						url : 'deleteNmeCard.do',
						data : {  
							0:0,
							checkArray : checkArray},
							success: function pageReload(){
								location.href="/nmeCardSelectForm.do"
							}
						});
						checkArray= new Array();
						nmeCardSeq="";
					}
					else{   //취소	
						location.reload(true);
					}
				}
			}		
			
			$(document).ready(function(){ //체크박스 전체선택,전체해제
				$("#checkAll").click(function() {
					$("input[name=chkbox]:checkbox").prop("checked",true);
				});
				$("#unCheckAll").click(function() {
					$("input[name=chkbox]:checkbox").prop("checked",false);
				});
			});
		</script>
	</head>
	<body>   
		<div class="head">                           
			<c:import url="/title.do"/>
		</div>
		<form name="nmeCardInfo" method="post">		
			<input type="hidden" name="nmeCardSeq" value="0">
			<input type="hidden" name="currentPageNo" value="${nmeCardValueObject.currentPageNo}">
			<input type="hidden" name="searchCnd" value="${nmeCardValueObject.searchCnd}"> <!-- 검색조건(숫자값) -->
			<input type="hidden" name="searchWrd" value="${nmeCardValueObject.searchWrd}"> <!-- 검색단어(문자값) -->
			<input type="hidden" name="searchAry" value="${nmeCardValueObject.searchAry}"> <!-- 명함정렬조건(숫자값) -->	
		</form>			
		<div class="body" style="margin-bottom:60px">
			<div class ="wrapper">
				<aside style="height:615px">
					<c:import url="/newSpeed.do"/>
				</aside>
				<div class="card">
					<h3 class="page-header">
					✴ 나의 명함 리스트 
					<!-- 명함 정렬 -->
					<select id="searchAry" class="form-control" onchange="arrayNmeCard(1)" style="display:inline-block; width:100px; margin-bottom:6px; margin-left:7px;">
					<c:choose>
						<c:when test="${nmeCardValueObject.searchAry == 0}">
							<option value="0" selected="selected">최신순</option>
							<option value="1">이름순</option>
						</c:when>
						<c:when test="${nmeCardValueObject.searchAry == 1}">
							<option value="0">최신순</option>
							<option value="1" selected="selected">이름순</option>
						</c:when>
					</c:choose>              
					</select>	
					<button class="btn btn-default-mina" style="margin-left:7px;" style="display:inline" onclick="location.href='/nmeCardSelectForm.do'"><span class="glyphicon glyphicon-repeat" aria-hidden="true"></span></button>				
					<div class="btn-group">
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							메뉴 <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#" id="checkAll">전체선택</a></li>
							<li><a href="#" id="unCheckAll">전체해제</a></li>
							<li><a href="#" onclick="deleteNmeCard()" id="del">삭제</a></li>
						</ul>
					</div>
					</h3>
					<article>
						<div style="min-height:400px">							
							<div class="product-list">
								<ul id="productList">
									<li id="insertCardBtn">
										<div>
											<input type="checkbox" style="visibility:hidden"> <!-- 줄맞추기용 -->
										</div>
										<div id="cardBox">
										<!-- 명함 등록 버튼 -->
											<table class="tb-radius" id="insertCard">
												<tr>
													<td style="text-align:center">
														<a href="javascript:nmeCardInsertForm()"><img src="resources/img/PLUS.png" id="plus" width="30px" height="30px"></a>
													</td>
												</tr>
											</table>
										</div>
									</li>
									<!-- 명함 리스트 부분 -->
									<c:forEach var="selectNmeCardList" items="${selectNmeCardList}" varStatus="status">
										<li id="selectCardList" style="margin-left:20px;">
											<div style="float:left">
												<input type="checkbox" id="${selectNmeCardList.nmeCardSeq}" name="chkbox" value="${selectNmeCardList.nmeCardSeq}">
											</div>
											<div id="cardBox" class="cardBox${selectNmeCardList.nmeCardSeq}" style="float:left;">
												<a href="javascript:nmeCardSelectViewForm(${selectNmeCardList.nmeCardSeq})" id="cardId" onmouseover="this.style.color='#428BCA'" onmouseout="this.style.color='#333333'" style="text-decoration:none">
													<table class="tb-radius ellip" id="nmecardList">
														<tr>
															<td>
															성명 : <c:out value="${selectNmeCardList.nmeCardNme}"/>
															<c:if test="${selectNmeCardList.nmeCardDateUseAt == 'Y'}">
															<img src="resources/img/new2.png" style="float:right" id="new" width="35px" height="20px">
															</c:if>
															</td>
														</tr>
														<tr>
															<td>휴대폰 : <c:out value="${selectNmeCardList.nmeCardMobil}"/></td>
														</tr>
														<tr>
															<c:if test="${selectNmeCardList.nmeCardEmail == ''}">
															<td>E-mail : 없음</td>
															</c:if>
															<c:if test="${selectNmeCardList.nmeCardEmail != ''}">
															<td>E-mail : <c:out value="${selectNmeCardList.nmeCardEmail}"/></td>
															</c:if>
														</tr>
														<tr>
															<td>전화 : <c:out value="${selectNmeCardList.nmeCardTel}"/></td>
														</tr>
														<tr>
															<td>회사 : <c:out value="${selectNmeCardList.nmeCardCompnNme}"/></td>
														</tr>
													</table>
												</a>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>												
						</div>				
					</article>			
					<c:if test="${nmeCardValueObject.lastPageNoOnPageList != 1}">
						<div style="text-align:center">
							<ul class="pagination">
								<c:if test="${nmeCardValueObject.totalPageCount > 1 && nmeCardValueObject.currentPageNo != 1}">
									<li class="paginate_button previous"><a href="javascript:arrayNmeCard(1)">&laquo;</a></li>
									<li class="paginate_button previous"><a href="javascript:arrayNmeCard(${nmeCardValueObject.currentPageNo-1})">&lsaquo;</a></li>
								</c:if>
							
								<c:forEach var="page" begin="${nmeCardValueObject.firstPageNoOnPageList}" end="${nmeCardValueObject.lastPageNoOnPageList}">
									<c:if test="${page == nmeCardValueObject.currentPageNo}">
										<li class="paginate_button active"><a href="javascript:arrayNmeCard(${page})">${page}</a></li>
									</c:if>
									<c:if test="${page != nmeCardValueObject.currentPageNo}">
										<li class="paginate_button"><a href="javascript:arrayNmeCard(${page})">${page}</a></li>
									</c:if>
								</c:forEach>
							
								<c:if test="${nmeCardValueObject.totalPageCount > 1 && nmeCardValueObject.totalPageCount != nmeCardValueObject.currentPageNo}">
									<li class="paginate_button next"><a href="javascript:arrayNmeCard(${nmeCardValueObject.currentPageNo+1})">&rsaquo;</a></li>
									<li class="paginate_button next"><a href="javascript:arrayNmeCard(${nmeCardValueObject.totalPageCount})">&raquo;</a></li>
								</c:if>
							</ul>							
						</div>
					</c:if>
					<div align="center">
						<table>
							<tr>
								<td>
								<!-- 명함 검색 -->
									<select id="searchCnd" class="form-control" style="width:100px;">
									<c:choose>
										<c:when test="${nmeCardValueObject.searchCnd == 0}">
											<option value="0" selected="selected">이름</option>
											<option value="1">휴대폰</option>             
											<option value="2">Email</option>
										</c:when>
										<c:when test="${nmeCardValueObject.searchCnd == 1}">
											<option value="0">이름</option>
											<option value="1" selected="selected">휴대폰</option>             
											<option value="2">Email</option>
										</c:when>
										<c:when test="${nmeCardValueObject.searchCnd == 2}">
											<option value="0">이름</option>
											<option value="1">휴대폰</option>             
											<option value="2" selected="selected">Email</option>
										</c:when>
									</c:choose>            
									</select>
								</td>
								<td>
									<div class="input-group" style="padding-left:5px;">
										<input type="text" class="form-control" id="searchWrd" maxlength="60" value="${nmeCardValueObject.searchWrd}">
										<span class="input-group-btn">
											<button class="btn btn-default" style="margin-left:7px;" onclick="javascript:nmeCardSearchForm(1)">검색</button>													
										</span>										
									</div>
								</td>
							</tr>
						</table>
					</div>	
					<div class="page-header" style="margin-top: 20px;">
					</div>	
				</div>
			</div>
		</div>		
	</body>
</html>
