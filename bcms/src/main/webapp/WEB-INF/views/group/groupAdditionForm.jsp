<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="./resources/dist/js/ajax.js"/></script>
<style type="text/css">
		#absolute1
		{
		width:1px;
		height:1px;
		position:absolute;
		}
		
		#absolute1
		{
		z-index: 1;
		}
</style>
</head>
	<body>
		<div id="absolute1">
		    <div class="col-xs-2;static;" id="empty">
				<div class="static" style="text-align:right">
					<form method="POST" id="insert">
						<table>
							<tr>
								<td><input type="text" style="width:150px" id="gropNme"  name="gropNme" class="form-control" placeholder="그룹명 입력" autofocus onkeydown="javascript:if(event.keyCode==13){gropinsert();};if(event.keyCode==27){home();}"></td>
			
						   	</tr>
						   
						   	<tr>
						  		<td>
									<button type="button" class="btn btn-default btn-xs _btnAddGroup" onclick="javascript:gropinsert();">추가하기</button>
									<button type="button" class="btn btn-default btn-xs _btnAddGroup" onclick="javascript:home();">취소</button>
						    	<td>
						  	</tr>
						</table> 
					</form>
				</div>
		 	</div>
	 	</div>
	</body>
</html>