<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 삭제 - ${detail}</title>
<link rel="stylesheet" href="../css/common.css">
<c:set var="detail" value="${detail}" />
</head>
<body>
	<div class="container">
		<div class="box-wrapper">
			<p>제목 : <br>
			<input id="title_box" type="text" name="title" value="${detail.title}">			
			</p>			
			<p>글 내용 :
			<div id="content_box">${detail.content}</div>
			</p>			
			<div class="subbtn-wrapper">
			<form action="delete.do" method="post">
				<input type="submit" value="글 삭제">				
			</form>
			</div>
			<div class="subbtn-wrapper">
			<form action="/board.do">
			    <input type="submit" value="취소">  
			</form>			
			</div>
		</div>
	</div>
</body>
</html>