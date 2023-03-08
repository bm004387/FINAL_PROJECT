<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>메인화면</title>
<link rel="stylesheet" href="../css/common.css">
<c:set var="data" value="${article.id}" />
</head>
<body>
	<div class="container">
		<div class="box-wrapper">	
		<c:forEach items="${list}" var="data">
						<tr>
							<td><c:out value="${board.bno}" /></td>
					
<!-- Page486 views 폴더 내 board/list.jsp 파일의 일부에 댓글의 숫자 표시를 반영해 줍니다. -->
							<td><a class="move" href='<c:out value="${article.title}"/>'><c:out	value="${article.content}" /></a></td>
							
							<td><c:out value="${board.writer}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.regdate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.updateDate}" /></td>
						</tr>
					</c:forEach>		
			<p>제목 : <br>
			<input id="title_box" type="text" name="title" value="${article.title}">			
			</p>
			
			<p>글 내용 :
			<div id="content_box">${article.content}</div>

			</p>
			<form action="/">
				<input type="submit" value="처음으로">
			</form>
		</div>
	</div>
</body>
</html>