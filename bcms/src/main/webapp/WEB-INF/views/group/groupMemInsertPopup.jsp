<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
		<link rel="stylesheet" href="/resources/dist/css/ui.css" type="text/css">
	   	<link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	   	
	   	<script type="text/javascript">
	   				function groupCheck(){
				    var groupRecv ="";
				    var groupArray = new Array();  
				
				    <c:forEach var="all" items="${groupList}" varStatus="status">
				    groupRecv= "#"+"${all.gropSeq}";
				    if($(groupRecv).is(":checked")){
				    	groupArray.push("${all.gropSeq}")
				    }
				    </c:forEach>
				    
				    if(groupArray.length == 0){
				    	alert("그룹을 선택하세요.")
				    }
				    else{
						if(confirm("회원을 그룹 하시겠습니까?") == true){ //확인
					    
					   $.ajax({
					      type : 'POST',
					      url : 'groupMemInsert.do',
					      data : {
					          "group" : "0",
					    	  "group" : groupArray
					      },
					      success:
					         function group(){						      
		 						window.close()
		 						opener.location.href ='/groupListForm.do';
					        }
					   });
						   var groupRecv ="";
						   var groupArray = "";  
						}
						else{ //취소
							window.close()
							opener.location.href ='/groupListForm.do';
						}
				    }
 				}
   				function groupCancel(){ 
   				 	self.close();
   				 	opener.location.href ='/groupListForm.do';
   				}
		</script>
	</head>
	<body>
		<h3>✴ 그룹관리</h3>
		<table class= "table table-striped table-bordered">
			<c:forEach var="group" items="${groupList}" varStatus="Status">
				<tr>
					<td><input type="checkbox" id="${group.gropSeq}">${group.gropNme}</td>
				</tr>
			</c:forEach>
		</table>
		<center>
			<input type="button" value="추가" class="btn btn-default" onclick="javascript:groupCheck()">
			<input type="button" value="취소" class="btn btn-default" onclick="javascript:groupCancel()">
		</center>
</body>
</html>