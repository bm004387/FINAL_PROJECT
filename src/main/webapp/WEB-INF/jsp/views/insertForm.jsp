<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 등록</title>
<c:set var="data" value="${boardList.content}" />
<jsp:include page="../include/header.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<div class="box-wrapper">
		<form action="write.do" method="post">	   			
				<p>
					제목 : <br><input class="form-control" id="title_box" type="text" name="title" value="${param.title}">
				</p>
				<p>
					내용 : <br />
					<textarea class="form-control" id="content_box" name="content" rows="5" cols="30">${param.content}</textarea>
				</p>
				<p>
					작성자 : <br><input class="form-control" id="title_box" type="text" name="writer" value="${param.writer}">
				</p>
				<input class="form-control" type="submit" value="게시글 등록">
				<button type="button" onclick="javascript:history.go(-1);">취소</button>								
			</form>
			
		</div>	
	</div>
</body>
</html>