<%--
	결과처리 페이지
 --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Custom styles for this template -->
<link href="css/signin.css" rel="stylesheet">
<script src="js/jquery-2.2.4.min.js"></script>

<script>
	$(document).ready(function(e){
		alert("${message}");
		location.replace("${returnURL}");
	});
</script>