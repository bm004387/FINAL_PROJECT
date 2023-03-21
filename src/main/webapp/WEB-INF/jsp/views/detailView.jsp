<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>게시글 - ${detail.title }</title>
<link rel="stylesheet" href="../css/detailView.css">
<script type="text/javascript">
	function del() {
		alert("정말 게시글을 삭제하시겠습니까?");
		window.location.href="/deleteSuccess.jsp";
	}
</script>

<c:set var="detail" value="${detail}" />
<jsp:include page="../include/header.jsp"></jsp:include>
	<div class="container">
		<div class="box-wrapper">	
			<p>제목 : <br>
				<input id="title_box" type="text" name="title" value="${detail.title}">			
			</p>
			<p>글 내용 :
				<div id="content_box">${detail.content}</div>
			</p>
			<form action="/board.do">
				<input type="submit" value="목록으로">
			</form>
				<c:if test="${resultVO.memberId == 'admin'}">
					<form action="/modify.do/bno=${detail.bno}">
						<input type="submit" value="수정하기">
					</form>
					<form action="/delete.do" method="post">
						<input type="submit" onclick="javascript:del()" value="삭제">
					</form>
				</c:if>
		</div>
	</div>
