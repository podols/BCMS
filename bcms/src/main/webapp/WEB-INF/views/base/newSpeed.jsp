<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<head>
		<title>Insert title here</title>
<script type="text/javascript">
		$(document).ready(function newspeed() {
			$.ajax({  
			    type : "POST",  
			    url : "/newSpeedAjax.do",  
			    dataType : "JSON",
			    success : function(data){  
			    	var list = data["newList"];
	                var html = "<table class='table table-hover;' style='background: #EAEAEA;'>";
	                for(var i=0; i<list.length; i++){
	                    html += '<tr>';
	                    html += '<td onclick="javascript:dddd()">'+ '<strong>' + list[i].sendNme + '</strong>' + '님이&nbsp;' + '<strong>'  + list[i].nmeCardLastNme + list[i].nmeCardFirstNme + '</strong>';
	                    if(list[i].newspeedType=='Y'){
	                    	html+= '&nbsp;명함을' + '<br>'+ '공유했습니다.' + '<br>';
	                    }
	                    else if(list[i].newspeedType=='N'){
	                    	html+= '&nbsp;명함을' + '<br>'+ '공유해제했습니다.' + '<br>';
	                    }
	                    else if(list[i].newspeedType=='C'){
	                    	html+= '&nbsp;명함의' + '<br>'+ '커뮤니케이션을 보냈습니다.' + '<br>';
	                    }
	                    else if(list[i].newspeedType=='CC'){
	                    	html+= '&nbsp;명함의' + '<br>'+ '커뮤니케이션을 등록했습니다.' + '<br>';
	                    }
	                    else if(list[i].newspeedType=='CU'){
	                    	html+= '&nbsp;명함의' + '<br>'+ '커뮤니케이션을 수정했습니다.' + '<br>';
	                    }
	                    else if(list[i].newspeedType=='CD'){
	                    	html+= '&nbsp;명함의' + '<br>'+ '커뮤니케이션을 삭제했습니다.' + '<br>';
	                    }
	                    html += '</td>';
	                    html += '</tr>';
	                };
	                html += '</table>';
	                $("#newspeedSelect").html(html);
	            },
			    error:function(xhr,status,error){ //ajax 오류인경우  
			    	alert("$");
		            alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);             
		   		}
			});
		});		
</script>
</head>
<body>

	<div style="width:300px;">
		<div style="width:200px;">
			<div style="width:100%;" align="center">
				<div style="display:inline">
					<h3>최신정보
					</h3>
				</div>
			</div>
		</div>
		<div style="width:200px; height:570px; overflow-y:auto;" id="newspeedSelect"  class="content; table-responsive" data-mcs-theme="dark">
   		</div>
	</div>
</body>
</html>