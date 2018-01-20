<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
		<link rel="stylesheet" href="/resources/dist/css/ui.css" type="text/css">
    	<link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">
    	<script src="./resources/dist/js/ajax.js"/></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    	<script type="text/javascript">
    		$(document).ready(function(){
    			var gropSaver = "${groupValueObject.gropSeq}";
    			var gropIdMaker = "#gropSeq" + gropSaver
				$(gropIdMaker).css("background-color","#737373"); //명함 선택했을 때 테두리 색깔 바꾸기
			});
		 	function home(){
		 		$("#empty").empty() //공간을 비움
// 	 			$("#show").show() // 다시 보여줌
		 	}
			function gropinsert(){ //그룹명 등록
				if (document.getElementById("gropNme").value==""){
					alert("그룹명을 입력하세요");
					document.getElementById("gropNme").focus();
				}
				else
				{
					 $.ajax({
					      type : 'post',
					      url : '/groupInsert.do',
					      data : $('#insert').serialize(),
					     
					      success: function select(){
					    	  location.reload();
					      }
					   });
						$("#empty").empty() //공간을 비움
					}
				}
			function arrayMemGroup(page) { //명함 정렬보기
				var memSearchWrd = document.getElementById("memSearchWrd").value;
				var memSearchCnd = document.getElementById("memSearchCnd").value;
				var memSearchAry = document.getElementById("memSearchAry").value;
				document.groupWholeList.memCurrentPageNo.value = page;				
				document.groupWholeList.memSearchCnd.value = memSearchCnd;
				document.groupWholeList.memSearchWrd.value = memSearchWrd;
				document.groupWholeList.memSearchAry.value = memSearchAry;
				document.groupWholeList.action = "/groupListForm.do";
				document.groupWholeList.submit();
			}
			function groupWholeListForm(page) { //명함 검색 보기
				var memSearchWrd = document.getElementById("memSearchWrd").value;
				var memSearchCnd = document.getElementById("memSearchCnd").value;
				var memSearchAry = document.getElementById("memSearchAry").value;
				if (document.getElementById("memSearchWrd").value==""){
					alert("검색어를 입력하세요");
					document.getElementById("memSearchWrd").focus();
				}
				else{
					document.groupWholeList.memCurrentPageNo.value = page;
					document.groupWholeList.memSearchCnd.value = memSearchCnd;
					document.groupWholeList.memSearchWrd.value = memSearchWrd;
					document.groupWholeList.memSearchAry.value = memSearchAry;
					document.groupWholeList.action = "/groupListForm.do";
					document.groupWholeList.submit();
				}	
			}
			function groupWholeListClickForm(page, gropSeq, gropNme) { //전체명단보기
				if (gropNme == '전체명단'){
					var memSearchWrd = "";
					var memSearchCnd = 0;
					var memSearchAry = 0;
				}
				else{
					var memSearchWrd = document.getElementById("memSearchWrd").value;
					var memSearchCnd = document.getElementById("memSearchCnd").value;
					var memSearchAry = document.getElementById("memSearchAry").value;
				}
					document.groupWholeList.memCurrentPageNo.value = page;
					document.groupWholeList.gropSeq.value = gropSeq;
					document.groupWholeList.memSearchCnd.value = memSearchCnd;
					document.groupWholeList.memSearchWrd.value = memSearchWrd;
					document.groupWholeList.memSearchAry.value = memSearchAry;
					document.groupWholeList.action = "/groupListForm.do";
					document.groupWholeList.submit();					
			}
			function memCheck(){// 그룹할 회원 체크
			    var memRecv ="";
			    var memArray = new Array();  
			
			    <c:forEach var="groupWholeList" items="${groupWholeList}" varStatus="status">
				    memRecv= "#"+"${groupWholeList.memSeq}";
				    if($(memRecv).is(":checked")){ 
				    	memArray.push("${groupWholeList.memSeq}")
				    }
			    </c:forEach>
				if(memArray.length == 0){
					
					alert("그룹할 회원을 선택해주세요.")
				}
				else{
			   $.ajax({
			      type : 'POST',
			      url : 'checkMemSession.do',
			      data : {
			          "mem" : "0",
			    	  "mem" : memArray
			    	 
			      },
			      success:
			         function popUp(){ //성공시 그룹 팝업으로 이동
					      var popUrl = "/groupMemSelect.do";
					      var width = 500;
					      var height = 500;
					      var leftPosition = (screen.width-width)/2;
					      var topPosition = (screen.height-height)/2;
					      
					      var popOption =  "left="+leftPosition+", top="+topPosition+", resizable=no, scrollbars=no, status=no, width="+width+", height="+height;    //그룹 추가 팝업창 옵션(optoin)
		 			      window.open(popUrl,"",popOption);
			        }
			   });
				   var memRecv ="";
				   var memArray = "";  
				}
			}
			function allIn(){ // 체크박스 전체 선택
			    var indibox = check.indicheck;
			    if(indibox.length) {  // 여러 개일 경우
			        for(var i = 0; i<indibox .length;i++) {
			        	indibox [i].checked=check.all.checked;
			        }
			    } else { // 한 개일 경우
			    	indibox.checked=check.all.checked;
			    }
			}
			function gropMemDelete(){ // 그룹 멤버 삭제
			    var memRecv ="";
			    var memArray = new Array();  
			    <c:forEach var="groupWholeList" items="${groupWholeList}" varStatus="status">
			    memRecv= "#"+"${groupWholeList.gropMemSeq}";
			    if($(memRecv).is(":checked")){
			    	memArray.push("${groupWholeList.gropMemSeq}")
			    }
			    </c:forEach>
				if(memArray.length == 0){
					
					alert("그룹에서 삭제할 회원을 선택해 주세요")
				}
				else{
					if(confirm("삭제하시겠습니까?") == true){	
						   $.ajax({
						      type : 'POST',
						      url : 'gropMemDelete.do',
						      data : {
						          "mem" : "0",
						    	  "mem" : memArray
						      },
						      success:
						         function pageReload(){
// 								location.href ='/groupListForm.do';
								location.reload(true);
						        }
						   });
						   var memRecv ="";
						   var memArray = "";  
						}
						else{   //취소
						location.reload(true);
						}
					}
				function allIn(){
			   	 var indibox = check.indicheck;
			    	if(indibox.length) {  // 여러 개일 경우
			        	for(var i = 0; i<indibox .length;i++) {
			        		indibox [i].checked=check.all.checked;
		        		}
	   	 			}
			    	else { // 한 개일 경우
			    		indibox.checked=check.all.checked;
   					} 
				}
			}
			function gropDelete(gropDelSeq){	//그룹명 삭제
				
				if(confirm("그룹을 삭제하시겠습니까?") == true){
					document.groupWholeList.gropDelSeq.value = gropDelSeq;
 					document.groupWholeList.action = "/groupDelete.do";
 					document.groupWholeList.submit();
				}
			}
		
			function gropUpdateText(gropSeq) {	 //텍스트 필드 숨기기 , 보이기
				var gropButton = "#gropButton"+gropSeq;
				var gropText = "#gropText"+gropSeq;
				$(gropButton).css("display","none");
				$(gropText).focus().css("display","block");
			}
			function gropUpdateButton(gropSeq) { //버튼 숨기기, 보이기
				var gropButton = "#gropButton"+gropSeq;
				var gropText = "#gropText"+gropSeq;
				$(gropButton).css("display","block");
				$(gropText).focus().css("display","none");
				
		    
			}
			function gropUpdateCommit(gropSeq,statusCount) { // 그룹명 수정
				
 				document.getElementById("updateGropSeq").value = gropSeq;
 				document.getElementById("updateCount").value = statusCount;
		    	document.updateGrop.action="/gropUpdateCommit.do";
		    	document.updateGrop.submit();
			}
	 	</script>
	</head>
	<body>
		<div class="head">                           
			<c:import url="/title.do"/>
		</div>
		<form name="groupWholeList" method="post">
			<input type="hidden" name="gropMemSeq" value="${groupValueObject.gropMemSeq}">
			<input type="hidden" name="memSeq" value="${groupValueObject.memSeq}">
			<input type="hidden" name="gropSeq" value="${groupValueObject.gropSeq}">
			<input type="hidden" name="memCurrentPageNo" value="${groupValueObject.memCurrentPageNo}">
			<input type="hidden" name="memSearchCnd" value="${groupValueObject.memSearchCnd}"> <!-- 검색조건(숫자값) -->
			<input type="hidden" name="memSearchWrd" value="${groupValueObject.memSearchWrd}"> <!-- 검색단어(문자값) -->
			<input type="hidden" name="memSearchAry" value="${groupValueObject.memSearchAry}"> <!-- 명함정렬조건(숫자값) -->
			<input type="hidden" name="gropDelSeq" id="gropDelSeq" value="1">
		</form>
		<div class="body" style="margin-bottom:3%">
			<div class="wrapper">
				<aside style="height:615px">
					<c:import url="/newSpeed.do"/>
				</aside>
				<div style="margin-left:300px; margin-top:50px;">
					<h3>✴ 그룹관리         
						<c:choose>
							<c:when test="${groupValueObject.gropSeq == 0}">
								(전체명단)
							</c:when>
						</c:choose>
					</h3>
					
				</div>
				<div style="margin-left:50px; margin-top:70px;">
					<input type="button" class="btn btn-default" style="width:150px" value="+그룹 추가하기" onclick="sendAjax('groupAddition.do')"><br>
					<div class="static" id= "ajax" style="width:300px;"></div>
					<div class="static">
 						<div style="overflow:auto; width:240px; height:300px; margin-top:1px">
 						<input type="text" value="전체명단" readonly class="btn btn-default" style="width:150px" onclick="javascript:groupWholeListClickForm(1,0,'전체명단');">
 						<form name="updateGrop" method="POST">
 							<input type="hidden" name="updateGropSeq" id="updateGropSeq" value="1">
 							<input type="hidden" name="updateCount" id="updateCount" value="1">
		 					<table> 
								<c:forEach var="group" items="${groupList}" varStatus="Status">
									<tr id="gropButton${group.gropSeq}" style="display:block">
										<td style="width:200px">
											<button type="button" value="${group.gropSeq}" class="btn btn-default" id="gropSeq${group.gropSeq}" name="gropNme" style="width:150px; overflow:hidden; text-overflow:ellipsis;" onclick="javascript:groupWholeListClickForm(1,${group.gropSeq});return false;">${group.gropNme}</button>
										</td>
										<td>
											<div class="dropdown" style="margin-top:0px; margin-left:-45px;">
	   											<button type="button" style="height:24px" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
	   												<span class="caret" style="margin-top:-10px"></span>
	   											</button>
	   											
	   											<ul class="dropdown-menu" role="menu" style="width:-30px; min-width:60px">
									      			<li style="width:60px"><a href="javascript:gropUpdateText(${group.gropSeq});" style="width:50px">수정</a></li>
									      			<li style="width:60px"><a href="javascript:gropDelete(${group.gropSeq})" style="width:50px">삭제</a></li>
	   											</ul>
											</div>
										</td> 
									</tr>
									<tr id="gropText${group.gropSeq}" style="display:none">						
										<td style="width:200px">
											<input type="hidden" id="qwer">
											<input type="text" value="${group.gropNme}" style="width:150px" id="gropTextNme${group.gropSeq}"  name="updateGropNme" class="form-control" autofocus 
											onkeydown="javascript:if(event.keyCode==13){gropUpdateCommit(${group.gropSeq},${Status.count});}; if(event.keyCode==27){gropUpdateButton(${group.gropSeq});}">
											
										</td>
										<td>
											<div class="dropdown" style="margin-top:0px; margin-left:-45px;">
	   											<button class="btn btn-info dropdown-toggle" style="height:24px"type="button" data-toggle="dropdown" aria-expanded="true">
	   												<span class="caret" style="margin-top:-10px"></span>
	   											</button>
	   											<ul class="dropdown-menu" role="menu" style="width:-30px; min-width:60px">
									      			<li style="width:60px"><a href="javascript:gropUpdateCommit(${group.gropSeq},${Status.count});" style="width:50px">수정</a></li>
									      			<li style="width:60px"><a href="javascript:gropUpdateButton(${group.gropSeq});" style="width:50px">취소</a ></li>
	   											</ul>
											</div>
										</td> 
									</tr>
								</c:forEach>
							</table>
							</form>
						</div>
					</div>
				</div>
				
				<div style="margin-left:1000px; margin-top:-380px">
					<select id ="memSearchAry" onchange="arrayMemGroup(1)" class="form-control" style="width:100px;">
						<c:choose>
							<c:when test="${groupValueObject.memSearchAry == 0}">
								<option value="0" selected="selected">이름</option>
								<option value="1">부서</option>             
								<option value="2">직급</option>
							</c:when>
							<c:when test="${groupValueObject.memSearchAry == 1 }">
								<option value="0">이름</option>
								<option value="1" selected="selected">부서</option>             
								<option value="2">직급</option>
							</c:when>
							<c:when test="${groupValueObject.memSearchAry == 2 }">
								<option value="0">이름</option>
								<option value="1">부서</option>             
								<option value="2" selected="selected">직급</option>
							</c:when>
						</c:choose>
			   		</select>
				</div>
				<div style="margin-top:10px; width:800px; margin-left:300px">		
					<form id="check" name="asdd" method="post">
						<table class= "table table-striped table-bordered">
							<tr>
								<th style = "width:5%; text-align:center"><input type="checkbox" name="all" id="all" style="width:15px; height:15px" onclick="allIn()"></th>
								<th style = "width:15%; text-align:center">이름</th>
								<th style = "width:25%; text-align:center" >부서</th>
								<th style = "width:15%; text-align:center">직급</th>
								<th style = "width:20%; text-align:center">이메일</th>
								<th style = "width:15%; text-align:center">휴대폰</th>
							</tr>
							<c:forEach var="groupWholeList" items="${groupWholeList}" varStatus="Status">
							<tr>                                
								<td style = "text-align:center">
									<c:choose>
										<c:when test="${groupWholeList.gropMemSeq == 0}">
											<input type="checkbox" style="width:15px; height:15px" name = "indicheck" id="${groupWholeList.memSeq}" value="${groupWholeList.memSeq}">
										</c:when>
										<c:when test="${groupWholeList.gropMemSeq != 0}">
											<input type="checkbox" style="width:15px; height:15px" name = "indicheck" id="${groupWholeList.gropMemSeq}" value="${groupWholeList.gropMemSeq}">
										</c:when>
									</c:choose>
								</td>
								<td style = "text-align:center">${groupWholeList.memNme}</td>
								<td style = "text-align:center">${groupWholeList.depmtNme}</td>
								<td style = "text-align:center">${groupWholeList.memPostnNme}</td>
								<td style = "text-align:center">${groupWholeList.memEmail}</td>
								<td style = "text-align:center">${groupWholeList.memMobil}</td>
							</tr>
							</c:forEach>
						</table>
					</form>
					<c:if test="${groupValueObject.memLastPageNoOnPageList != 1}">
						<div style="margin-left:300px">
							<ul class="pagination">
								<c:if test="${groupValueObject.memTotalPageCount > 1 && groupValueObject.memCurrentPageNo != 1}">
									<li class="paginate_button previous"><a href="javascript:arrayMemGroup(1)">&laquo;</a></li>
									<li class="paginate_button previous"><a href="javascript:arrayMemGroup(${groupValueObject.memCurrentPageNo-1})">&lsaquo;</a></li>
								</c:if>
							
								<c:forEach var="page" begin="${groupValueObject.memFirstPageNoOnPageList}" end="${groupValueObject.memLastPageNoOnPageList}">
									<c:if test="${page == groupValueObject.memCurrentPageNo}">
										<li class="paginate_button active"><a href="javascript:arrayMemGroup(${page})">${page}</a></li>
									</c:if>
									<c:if test="${page != groupValueObject.memCurrentPageNo}">
										<li class="paginate_button"><a href="javascript:arrayMemGroup(${page})">${page}</a></li>
									</c:if>
								</c:forEach>
							
								<c:if test="${groupValueObject.memTotalPageCount > 1 && groupValueObject.memTotalPageCount != groupValueObject.memCurrentPageNo}">
									<li class="paginate_button next"><a href="javascript:arrayMemGroup(${groupValueObject.memCurrentPageNo+1})">&rsaquo;</a></li>
									<li class="paginate_button next"><a href="javascript:arrayMemGroup(${groupValueObject.memTotalPageCount})">&raquo;</a></li>
								</c:if>
							</ul>						
						</div>
					</c:if>
					<div style="margin-left:200px">
						<select class="form-control" style="width:100px;" id="memSearchCnd">
							<c:choose>
								<c:when test="${groupValueObject.memSearchCnd == 0 }">
									<option value="0" selected="selected">이름</option>              
									<option value="1">부서</option>
									<option value="2">직급</option>
								</c:when>
								<c:when test="${groupValueObject.memSearchCnd == 1 }">
									<option value="0">이름</option>              
									<option value="1" selected="selected">부서</option>
									<option value="2">직급</option>
								</c:when>
								<c:when test="${groupValueObject.memSearchCnd == 2 }">
									<option value="0">이름</option>              
									<option value="1">부서</option>
									<option value="2" selected="selected">직급</option>
								</c:when>
							</c:choose>		
			   			</select>
			   			<input type="text" class="form-control" style="width:200px" id="memSearchWrd" value="${groupValueObject.memSearchWrd}" onkeydown="javascript:if(event.keyCode==13){groupWholeListForm(1);}">
			   			<input type="button" value="검색" class="btn btn-default" onclick="javascript:groupWholeListForm(1);">
			   			<div style="margin-left:550px; margin-top:-35px">
  							<c:choose>
								<c:when test="${groupValueObject.gropSeq == 0}">
									<input type="button" value="추가" class="btn btn-default" onclick="javascript:memCheck();">
								</c:when>
								<c:when test="${groupValueObject.gropSeq != 0}">
									<input type="button" value="삭제" class="btn btn-default" onclick="javascript:gropMemDelete();">
								</c:when>
							</c:choose>
			   			</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>