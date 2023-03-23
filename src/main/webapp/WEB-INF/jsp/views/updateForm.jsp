<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 수정 - ${detail.title}</title>
<link rel="stylesheet" href="../css/common.css">
<c:set var="detail" value="${detail}" />
<script type="text/javascript">
	function btn() {
		alert('${detail.title}글을 수정하시겠습니까?')
	}
</script>
<jsp:include page="../include/header.jsp"></jsp:include>
</head>

<body>
	<div class="container">
		<div class="box-wrapper">
			<form action="/modifySuccess.do" method="post">
				<p>
					제목 : <br><input id="title_box" type="text" name="title" value="${detail.title}">
				</p>
				<p>
					내용 : <br />
					<textarea id="content_box" name="content" rows="5" cols="30">${detail.content}</textarea>
				</p>
				<p>
					작성자 : <br><input id="title_box" type="text" name="writer" value="${detail.writer}">
				</p>
				<input type="submit" onclick="javascript:btn()" value="게시글 수정">
				<button type="button" onclick="javascript:history.go(-1);">취소</button>				
			</form>		
		</div>
	</div>
</body>
</html>