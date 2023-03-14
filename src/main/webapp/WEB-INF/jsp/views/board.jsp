<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<title>메인화면</title>
<link rel="stylesheet" href="../css/board.css">

<jsp:include page="../include/header.jsp"></jsp:include>
	<div class="container">
	<div class="boardheader">
		<h1>공지사항</h1>
	</div>
		<table width="100%" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th width="8%">#번호</th>
						<th width="62%">제목</th>
						<th width="10%">작성자</th>
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
		
		<!-- 1. 게시글 등록 -->
		<div class="btn-wrapper">
			<form action="/write.do">
				<input type="submit" value="게시글 등록" style="width:300px"  width="3000px" /><br>
				<br>
			</form>
			<!-- 2. 게시글 조회 -->
			<form action="/read.do">
				<input type="submit" value="최근 게시글 보기" style="width:300px"  width="3000px"  /><br>
				<br>
			</form>
			<!-- 3. 게시글 수정 -->
			<form action="/modify.do">
				<input type="submit" value="최근 게시글 수정" style="width:300px"  width="3000px"  /><br>
				<br>
			</form>
			<!-- 4. 게시글 삭제 -->
			<form action="/delete.do">
				<input type="submit" value="최근 게시글 삭제" style="width:300px"  /><br>
				<br>
			</form>
		</div>
	</div>
