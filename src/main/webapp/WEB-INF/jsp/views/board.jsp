<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<title>TourVisit 공지사항</title>
<link rel="stylesheet" href="../css/board.css">

<jsp:include page="../include/header.jsp"></jsp:include>
	<div class="container">
	<div class="boardheader">
		<h1>공지사항</h1>
	</div>
	<!-- <c:if test="${resultVO.memberId == 'admin'}"> -->
		<form action="/write.do" class="insertBtn">
			<button type="submit" class="btn btn-primary">게시글 등록</button>
		</form>
	<!-- </c:if> -->
		<table width="100%" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th width="5%">#번호</th>
						<th width="67%">제목</th>
						<th width="8%">작성자</th>
						<th width="10%">작성일</th>
						<th width="10%">수정일</th>
					</tr>
				</thead>
				<c:forEach items="${boardList}" var="boardList">
					<tr>
						<td><c:out value="${boardList.bno}" /></td>
						<td><a class="move" href="/detail.do/bno=${boardList.bno}"><c:out value="${boardList.title}" /></a></td>
						<td><c:out value="${boardList.writer}" /></td>
						<td><c:out value="${boardList.regDate}" /></td>
						<td><c:out value="${boardList.updateDate}" /></td>
						<fmt:parseDate value="${regDate}" pattern="yyyy-MM-dd" var="regDate" type="both"></fmt:parseDate>
						<fmt:parseDate value="${updateDate}" pattern="yyyy-MM-dd" var="updateDate" type="both"></fmt:parseDate>
					</tr>
				</c:forEach>
			</table>
		
			
	</div>
