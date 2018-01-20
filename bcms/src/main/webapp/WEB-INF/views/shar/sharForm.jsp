<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
</script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>^^</title>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="/resources/dist/css/ui.css" type="text/css">
	<link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="./resources/dist/js/jquery-2.1.3.min.js"/></script>
	<script src="./resources/dist/js/jquery-ui.js"></script>
	<script src="./resources/dist/js/shar/etc.js"></script>
<!-- 	<script src="./resources/dist/js/sharFunction.js"></script> -->
</head>
<body onload="javaScript:sharMainDivSizeChager()">
<script>
var gropSaver = "${sharVo.gropSeq}";
var select = ${selector};
$(document).ready(function(){ //명함 상세보기 눌렀을 때 자동으로 화면 포커스
	if(select==1 || select ==3){
		var gropIdMaker = "#grop"+gropSaver
		$(gropIdMaker).css("box-shadow","6px 6px 6px rgb(66, 139, 202)"); //명함 선택했을 때 테두리 색깔 바꾸기
	}	
});
function sharMainDivSizeChager(){
	if(select==1){
			document.title='BCMS - 공유';
	}
	else if(select ==2){
		document.title='BCMS - 공유 관리';
		 $("#sharMainDiv").css("width","560px");
		 $("#sharMainDiv").css("height","800px"); 
		 $("#sharContentsDiv").css("width","560px");
		 $("#sharContentsDiv").css("height","800px"); 
	}
	else if(select ==3){
		document.title='BCMS - 보내기';
	}
}
function plus(){
    var plusRecv ="";
    var plusArray = new Array();
    var sharArray = new Array();    
	sharArray.push(document.sharInfo.sharSearchCnd.value);
	if(document.sharInfo.sharSearchCnd.value!=0){
	sharArray.push(document.sharInfo.sharSearchWrd.value);
	}
    sharArray.push(document.sharInfo.gropSeq.value);
    sharArray.push(document.sharInfo.sharCurrentPageNo.value);
    <c:forEach var="all" items="${allMemList}" varStatus="status">
    plusRecv= "#"+"${all.memSeq}";
    if($(plusRecv).is(":checked")){
  	plusArray.push("${all.memSeq}")
    }
    </c:forEach>
   $.ajax({
      type : 'POST',
      url : 'sharPlus.do',
      data : {
          "plus" : "0",
    	"plus" : plusArray,
    	"sharArray":sharArray
      },
      success:
		    function aa(){
		              $.ajax({
		              type: "POST",
		              url: 'sharForm.do',
		              success: function(msg) {
		                 alert(msg);
		                 document.getElementById("sharTable").innerHTML = msg;
		              }	
		              });
      }
   });
   var plusRecv ="";
   var plusArray = "";  
}

function minus(){
    var minusRecv ="";
    var minusArray = new Array();
    var sharArray = new Array();    
	sharArray.push(document.sharInfo.sharSearchCnd.value);
	if(document.sharInfo.sharSearchCnd.value!=0){
	sharArray.push(document.sharInfo.sharSearchWrd.value);
	}
    sharArray.push(document.sharInfo.gropSeq.value);
    sharArray.push(document.sharInfo.sharCurrentPageNo.value);


    <c:forEach var="all" items="${allMemList}" varStatus="status">
    minusRecv= "#"+"${all.memSeq}";
    if($(minusRecv).is(":checked")){
    	minusArray.push("${all.memSeq}")
    }
    </c:forEach>
   $.ajax({
      type : 'POST',
      url : 'sharMinus.do',
      data : {
          "minus" : "0",
    	  "minus" : minusArray,
    	  "sharArray":sharArray
      },
      success:
    function aa(){
              $.ajax({
              type: "POST",
              url: 'sharForm.do',
              success: function(msg) {
                 
                 document.getElementById("sharTable").innerHTML = msg;
              }	 });}
      
      
      });
   var minusRecv ="";
   var minusArray = "";  
} 

function remvSharRecv(){
    var RelsRecv ="";
    var RelsArray = new Array();  

    <c:forEach var="all" items="${selectSharList}" varStatus="status">
    RelsRecv= "#"+"${all.memSeq}";;
    if($(RelsRecv).is(":checked")){
    	RelsArray.push("${all.memSeq}")
    }
    </c:forEach>

   $.ajax({
      type : 'POST',
      url : 'remvSharRecv.do',
      data : {
          "RelsArray" : "0",
   		"RelsArray" : RelsArray
      },
      success:
         function returning(){
  		groupSessionReset()
    	  location.reload(true);}
   });
   var RelsRecv ="";
   var RelsArray = "";  
} 
function sendPlus(){
    var sPlusRecv ="";
    var sPlusArray = new Array();
    var sharArray = new Array();    
	sharArray.push(document.sharInfo.sharSearchCnd.value);
	if(document.sharInfo.sharSearchCnd.value!=0){
	sharArray.push(document.sharInfo.sharSearchWrd.value);
	}
    sharArray.push(document.sharInfo.gropSeq.value);
    sharArray.push(document.sharInfo.sharCurrentPageNo.value);


    <c:forEach var="all" items="${allSendMemList}" varStatus="status">
    splusRecv= "#"+"${all.memSeq}";
  var splusRec = splusRecv;
    if($(splusRec).is(":checked")){
    	 sPlusArray.push("${all.memSeq}")
    }
    </c:forEach>

   $.ajax({
      type : 'POST',
      url : 'sendPlus.do',
      data : {
		"sPlus" : "0",
		"sPlus" : sPlusArray,
    	"sharArray":sharArray
      },
      success:
    	  function returning(){
              $.ajax({
              type: "POST",
              url: 'sendForm.do',
              success: function(msg) {
                 
                 document.getElementById("sendTableForm").innerHTML = msg;
              }	 });
      }
         
        
   });
   var sPlusRecv ="";
   var sPlusArray = "";  
}

function sendMinus(){
    var sMinusRecv ="";
    var sMinusArray = new Array();
    var sharArray = new Array();    
	sharArray.push(document.sharInfo.sharSearchCnd.value);
	if(document.sharInfo.sharSearchCnd.value!=0){
	sharArray.push(document.sharInfo.sharSearchWrd.value);
	}
    sharArray.push(document.sharInfo.gropSeq.value);
    sharArray.push(document.sharInfo.sharCurrentPageNo.value);


    <c:forEach var="all" items="${allSendMemList}" varStatus="status">
    sMinusRecv= "#"+"${all.memSeq}";
    if($(sMinusRecv).is(":checked")){
    	sMinusArray.push("${all.memSeq}")
    }
    </c:forEach>

   $.ajax({
      type : 'POST',
      url : 'sendMinus.do',
      data : {
    	  "sMinus" : "0",
    	  "sMinus" : sMinusArray,
    	  "sharArray":sharArray
      },
      success:
    function aa(){
              $.ajax({
              type: "POST",
              url: 'sendForm.do',
              success: function(msg) {
                 
                 document.getElementById("sendTableForm").innerHTML = msg;
              }	 });
      }
      
   });
   var sMinusRecv ="";
   var sMinusArray = "";  
} 

function groupSessionReset(){
    $.ajax({
    type: "POST",
    url: 'groupSessionReset.do',
    success: function(msg) {
    }	 });
}
function sharSelectForm(sharpage) {
	groupSessionReset();
	var select = ${selector};
	var pagingUrl = "";
	document.sharInfo.sharCurrentPageNo.value = sharpage;
	document.sharInfo.gropSeq.value = gropSaver;
	if(select==1){
		pagingUrl = "/sharForm.do"
		}
	if(select==2){
		pagingUrl= "/sharRelsForm.do"
		}
	if(select==3){
		pagingUrl = "/sendForm.do"
		}	
	document.sharInfo.action = pagingUrl
	document.sharInfo.submit();
}
function sendedSubFrm(){
	document.sharInfo.gropSeq.value = gropSaver;
	var select = ${selector};
	if(select==1){
		pagingUrl = "/sharForm.do"
		}
	if(select==2){
		pagingUrl= "/sharRelsForm.do"
		}
	if(select==3){
		pagingUrl = "/sendForm.do"
		}
	document.sharInfo.action = pagingUrl;
	document.sharInfo.submit();
}

function groupWholeListClickForm(page, gropSeq) { //전체 명단 보기
		var select = ${selector};
		groupSessionReset()
		document.sharInfo.sharCurrentPageNo.value = 1;
		document.sharInfo.gropSeq.value = gropSeq;
		if(select==1){
			pagingUrl = "/sharForm.do"
			}
		if(select==2){
			pagingUrl= "/sharRelsForm.do"
			}
		if(select==3){
			pagingUrl = "/sendForm.do"
			}
		document.sharInfo.sharSearchWrd.value = "";
		document.sharInfo.sharSearchCnd.value = 0;
		document.sharInfo.action = pagingUrl;
		document.sharInfo.submit();
}

//공유 검색
function sharSearch(sharpage) {
	if(document.getElementById("sharSearchCnd").value==0){
		alert("검색 조건을 선택해주십시오.")
	}
	else if(document.getElementById("sharSearchWrd").value==""){
		alert("검색어를 선택해주십시오.")		
	}
	else{
	groupSessionReset();
	var sharSearchWrd = document.getElementById("sharSearchWrd").value;
	var sharSearchCnd = document.getElementById("sharSearchCnd").value;
	document.sharInfo.gropSeq.value = gropSaver;
	document.sharInfo.sharCurrentPageNo.value = 1;
	document.sharInfo.sharSearchWrd.value = sharSearchWrd;
	document.sharInfo.sharSearchCnd.value = sharSearchCnd;
	var select = ${selector};
	var pagingUrl = "";
	var bodyId = ""
	if(select==1){
		pagingUrl = "/sharForm.do"
		}
	if(select==2){
		pagingUrl= "/sharRelsForm.do"
		}
	if(select==3){
		pagingUrl = "/sendForm.do"
		}
	document.sharInfo.action = pagingUrl
	document.sharInfo.submit();
	}
}

function sharInsert(){
	 var sharProcessing="/sharInsert.do";
	  $.ajax({
          type: "POST",
          url: sharProcessing,
          success: function() {
      		groupSessionReset()
        	  self.close();
          }
	  });
}
function sendInsert(){
	var sendProcessing="/insertSend.do";
	  $.ajax({
          type: "POST",
          url: sendProcessing,
          success: function() {
      		groupSessionReset()
        	  self.close();
          }
	  });
}
var separation ="";
   
function sharCancel(separation){
	if(separation==1){
		groupSessionReset()
		sharCancelProcessing="/sharCancel.do";
		  $.ajax({
		          type: "POST",
		          url: sharCancelProcessing,
		          success: function() {
		        	  self.close();
		          }
		  });
	}
	else if(separation==2){
		self.close();
	}
	else if(separation==3){
		groupSessionReset()
		sendCancelProcessing="/cancelSend.do";
		  $.ajax({
	          type: "POST",
	          url: sendCancelProcessing,
	          success: function() {
	        	  self.close();
	          }
		  });
	}
}
</script>
<div id = "sharMainDiv" style=" width:1210;height:750">
	<form name="sharInfo" method="post">
		<input type="hidden" name="sharCurrentPageNo" id="sharCurrentPageNo" value="${sharVo.sharCurrentPageNo}">
		<input type="hidden" name="sharSearchCnd" value="${sharVo.sharSearchCnd}"> <%--   검색 조건 --%>
		<input type="hidden" name="sharSearchWrd" value="${sharVo.sharSearchWrd}"> <%--  검색 단어 --%>
		<input type="hidden" name="gropSeq" value="${sharVo.gropSeq}" onchange="shi()">
	</form>
	<div style=" height:750px; margin-left:22px; margin-bottom:0px; margin-top:20px; margin-right:20px; border: ">
		<c:if test="${selector == 1||selector == 3}">	
		<div style= "float:left; height:750px; width:180px; border:1px gray solid">
			<a href="javascript:nmeCardLogo()"><img src="resources/img/BCMS.png"  style="margin-left:15px; margin-top:25px; max-width:80%; height:auto"></a>
				<div class="static">
						<div style="overflow:auto; width:200px; height:300px; margin-top:30px">
							<input type="text"  id= "grop0" value="전체명단" readonly class="btn btn-default" style="margin-left:12px; width:150px" onclick="javascript:groupWholeListClickForm(1,0)">
		 					<table style="margin-left:12px;"> 
								<c:forEach var="group" items="${groupList}" varStatus="Status">
									<tr >
										<td style="width:200px;margin-right:15px;" onclick="javascript:groupWholeListClickForm(1,${group.gropSeq})">
											<input id= "grop${group.gropSeq}" type ="text" value="${group.gropNme}" readonly class="btn btn-default" name="name" id="test" style=" width:150px">
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
		</c:if>
		<div id ="sharContentsDiv" style="float:left;height: 750px;width:1000px;">
			<c:if test="${selector == 1}">	    
				<c:import url="/sharTableForm.do"/>
			</c:if>
			<c:if test="${selector == 2}">	    
				<c:import url="/sharRelsTableForm.do"/>
			</c:if>
			<c:if test="${selector == 3}">	    
				<c:import url="/sendTableForm.do"/>
			</c:if>
		</div>
	</div>
</div>			
</body>
</html>