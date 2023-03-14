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
			<form action="/modify.do/bno=${detail.bno}">
				<input type="submit" value="수정하기">
			</form>
			<button type="button" onclick="delete()" class="btn btn-primary">삭제</button>
		</div>
	</div>
