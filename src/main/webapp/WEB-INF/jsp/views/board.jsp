<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<title>메인화면</title>

<jsp:include page="../include/header.jsp"></jsp:include>
	<div class="container">
		<table width="100%" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>#번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>수정일</th>
					</tr>
				</thead>
				<c:forEach items="${boardList}" var="boardList">
					<tr>
						<td><c:out value="${boardList.bno}" /></td>
						<td><a class="move" href='<c:out value="${boardList.bno}"/>'><c:out value="${boardList.title}" /></a></td>
						<td><c:out value="${boardList.writer}" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${boardList.regDate}" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${boardList.updateDate}" /></td>
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
