<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>게시글 등록</title>
<link rel="stylesheet" href="../css/common.css">
<c:set var="data" value="${board.content}" />
</head>
<body>
	<div class="container">
		<div class="box-wrapper">
		<form action="write.do" method="post">	   			
				<p>
					제목 : <br><input id="title_box" type="text" name="title" value="${param.title}">
				</p>
				<p>
					내용 : <br />
					<textarea id="content_box" name="content" rows="5" cols="30">${param.content}</textarea>
				</p>
				<p>
					작성자 : <br><input id="title_box" type="text" name="writer" value="${param.writer}">
				</p>
				<fmt:parseDate value="${regDate}" pattern="yyyy-MM-dd" var="regDate" type="both"></fmt:parseDate>
				<fmt:formatDate pattern="yyyy-MM-dd" value="${regDate}"/>
				<input type="submit" value="게시글 등록">
				<button type="button" onclick="javascript:history.go(-1);">취소</button>								
			</form>
			
		</div>	
	</div>
</body>
</html>