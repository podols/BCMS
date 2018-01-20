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
<script type="text/javascript">
</script>
<body id="sharRelsTable">
	<form id="sharing"  style="float:center;height: 780px;width:560px;">
		<div style="float:center;height: 780px;width:560px;margin-left:8px;">
			<div style="font-size:30px;margin-bottom:10px;">
				공유 관리
			</div>
			<div style="float:center;width:550px;height:550px;overflow:auto; border-top:1px solid; border-bottom:1px solid;">
				<table class="table table-hover" id="sharMemList" style="table-layout:fixed; word-break:break-all;">
					<tbody>
						<tr>
							<th width="30"><input type="checkbox" id = "allACheck" onclick="allAChecking()"/></th>				
							<th width="80">이름</th>
							<th width="100">부서</th>
							<th width="100">직급</th>
							<th width="180">이메일</th>
						</tr>
						<c:forEach var="shar" items="${sharMemList}" varStatus="status">
							<tr style="text-align:left">
								<td><input type="checkbox" id="${shar.memSeq}" name="ACheck" ></td>
								<td><span style="color:gray;font-size:11pt;">${shar.memNme}</span></td>    
								<td><span style="color:gray;font-size:11pt;">${shar.memDepmtNme}</span></td>
								<td><span style="color:gray;font-size:11pt;">${shar.memPostnNme}</span></td>
								<td><span style="color:gray;font-size:11pt;">${shar.memEmail}</span></td>
							</tr>
						</c:forEach>
					</tbody>  
				</table>
			</div>
			<c:if test="${sharVo.sharLastRecordIndex != 1}">
				<div style="text-align:center;width:420px;margin-left:40px;">
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
			<div style="text-align:center;margin-left:80px;width:380px">
				<select id="sharSearchCnd" class="form-control" style="margin-right:5px;width: 86px;">
					<c:choose>
						<c:when test="${sharVo.sharSearchCnd == 0}">
							<option value="0" selected="selected">선택</option>
							<option value="1">이름</option>
							<option value="2">부서</option>
						</c:when>
						<c:when test="${sharVo.sharSearchCnd == 1}">
							<option value="0">전체</option>
							<option value="1" selected="selected">이름</option>
							<option value="2">부서</option>
						</c:when>
						<c:when test="${sharVo.sharSearchCnd == 2}">
							<option value="0">전체</option>
							<option value="1" >이름</option>
							<option value="2"selected="selected">부서</option>
						</c:when>
					</c:choose>
				</select>
				<input id="sharSearchWrd" class="form-control" type="text" name="search" style="margin-right:5px;width: 216px;">
				<input class="btn btn-default"  type="button" value="검색" onclick="javascript:sharSearch(1)"style="margin-right:5px;">
			</div>			
			<div style="text-align:center;height:50px;margin-right:50px;margin-top:30px;">
				<input class = "btn btn-default" type="button" Style="width:100px;height:40px" value="공유해제"onclick="remvSharRecv()">
				<input class = "btn btn-default-mina" type="button" Style="width:100px;height:40px" value="닫기"onclick="sharCancel(2)">
			</div>
		</div>
	</form>
</body>
</html>