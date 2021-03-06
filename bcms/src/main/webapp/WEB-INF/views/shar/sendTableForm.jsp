<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> <!-- -->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
<link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet"> <!-- 	선있는 테이블 css -->

</head>
<body id = "sendTableForm">
	<input type = "hidden" id="noneSendMemCount" name="noneSendMemCount"  value="${noneSendMemCount }">
	<form id="sharing">
		<div style="float:center;height: 750px;width:1050px;margin-left:8px;">
			<div style="font-size:30px;padding:15px;">
				보내기
			</div>
			<div style="float:left;width:480px;height:550px;margin-left:15px;">
				<div style="width:470px;height:550px;overflow:auto;border-top:1px solid; border-bottom:1px solid;"">
					<table class="table table-hover"  id="noneSendMemList" style="table-layout:fixed;word-break:break-all;">
						<tbody>
						<tr class="active">
								<th width="30"><input type="checkbox" id = "allACheck" onclick="allAChecking()"/></th>				
								<th width="70">이름</th>
								<th width="90">부서</th>
								<th width="90">직급</th>
								<th width="190">이메일</th>
							</tr>
							<c:forEach var="nonSend" items="${noneSendMemList}" varStatus="status">
								<tr style="text-align:left">
									<td><input type="checkbox" id="${nonSend.memSeq}" name="ACheck"  /></td>
									<td><span style="color:gray;font-size:11pt;">${nonSend.memNme}</span></td>    
									<td><span style="color:gray;font-size:11pt;">${nonSend.memDepmtNme}</span></td>
									<td><span style="color:gray;font-size:11pt;">${nonSend.memPostnNme}</span></td>
									<td><span style="color:gray;font-size:11pt;">${nonSend.memEmail}</span></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<c:if test="${sharVo.sharLastRecordIndex != 1}">
					<div style="text-align:center;margin-top:20px;">
						<ul class="pagination">
							<c:if test="${sharVo.sharTotalPageCount > 1 && sharVo.sharCurrentPageNo != 1}">
								<li class="paginate_button previous"><a href="javascript:sharSelectForm(1)">&laquo;</a></li>
								<li class="paginate_button previous"><a href="javascript:sharSelectForm(${sharVo.sharCurrentPageNo-1})">&lsaquo;</a></li>
							</c:if>
						
							<c:forEach var="sharpage" begin="${sharVo.sharFirstPageNoOnPageList}" end="${sharVo.sharLastPageNoOnPageList}">
								<c:if test="${sharpage == sharVo.sharCurrentPageNo}">
									<li class="paginate_button active"><a href="javascript:sharSelectForm(${sharpage})">${sharpage}</a></li>
								</c:if>
								<c:if test="${sharpage != sharVo.sharCurrentPageNo}">
									<li class="paginate_button"><a href="javascript:sharSelectForm(${sharpage})">${sharpage}</a></li>
								</c:if>
							</c:forEach>
						
							<c:if test="${sharVo.sharTotalPageCount > 1 && sharVo.sharTotalPageCount != sharVo.sharCurrentPageNo}">
								<li class="paginate_button next"><a href="javascript:sharSelectForm(${sharVo.sharCurrentPageNo+1})">&rsaquo;</a></li>
								<li class="paginate_button next"><a href="javascript:sharSelectForm(${sharVo.sharTotalPageCount})">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</c:if>
				<div style="text-align:center; float:left; margin-left:50px">
					<select id="sharSearchCnd" class="form-control" style="width: 126px;">
						<c:choose>
							<c:when test="${sharVo.sharSearchCnd == 0}">
								<option value="0" selected="selected">선택</option>
								<option value="1">이름</option>
								<option value="2">부서</option>
							</c:when>
							<c:when test="${sharVo.sharSearchCnd == 1}">
								<option value="0">선택</option>
								<option value="1" selected="selected">이름</option>
								<option value="2">부서</option>
							</c:when>
							<c:when test="${sharVo.sharSearchCnd == 2}">
								<option value="0">선택</option>
								<option value="1" >이름</option>
								<option value="2"selected="selected">부서</option>
							</c:when>
						</c:choose>
					</select>
					<input id="sharSearchWrd" class="form-control" type="text" name="search" style="width: 176px;">
					<input class="btn btn-default"  type="button" value="검색" onclick="javascript:sharSearch(1)">
				</div>
			</div>
			<div style="margin-top:180px; margin-left:18px; float:left; width:65px; height:400px;">
				<div>
					<a href="javascript:sendPlus()"><img src="resources/img/sharPlus.png"  style="width:70px; margin-left:-10px; margin-bottom:70px"></a>
					<a href="javascript:sendMinus()"><img src="resources/img/sharMinus.png"  style="width:70px; margin-left:-10px;margin-bottom:20px"></a>		
				</div>
			</div>
			<div style="float:left; width:470px; height:550px; border-top:1px solid; border-bottom:1px solid; overflow:auto">
				<table class="table table-hover"  id="sendMemList" style="table-layout:fixed;word-break:break-all;">
					<tbody>
						<tr class="active">
							<th width="30"><input type="checkbox" id = "allBCheck" onclick="allBChecking()"/></th>				
							<th width="70">이름</th>
							<th width="90">부서</th>
							<th width="90">직급</th>
							<th width="150">이메일</th>
						</tr>
						<c:forEach var="send" items="${sendMemList}" varStatus="status">
							<tr style="text-align:left">
								<td width="30"><input type="checkbox" id="${send.memSeq}" name="BCheck" /></td>
								<td width="90"><span style="color:gray;font-size:11pt;">${send.memNme}</span></td>    
								<td width="90"><span style="color:gray;font-size:11pt;">${send.memDepmtNme}</span></td>
								<td width="60"><span style="color:gray;font-size:11pt;">${send.memPostnNme}</span></td>
								<td width="150"><span style="color:gray;font-size:11pt;">${send.memEmail}</span></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div style="float:right; height:50px; margin-top:90px; margin-right:10px;">
				<input class="btn btn-default" Style="width:100px;height:40px" value="보내기"onclick="sendInsert()">
				<input class="btn btn-default-mina" Style="width:100px;height:40px" value="닫기"onclick="sharCancel(3)">
			</div>
		</div>
	</form>
</body>
</html>