<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/dist/css/ui.css" type="text/css">
	<link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<script type="text/javascript">
	
	</script>
	
	</head>
	<body>
		<div class="head">
			<c:import url="/title.do"/>
		</div>
		<div class="body">
			<div class ="wrapper">
				<aside>
					<c:import url="/newSpeed.do"/>
				</aside>
				<div class="card">
					<article class="card-list">
					</article>
				</div>
			</div>
		</div>
	</body>
</html>
