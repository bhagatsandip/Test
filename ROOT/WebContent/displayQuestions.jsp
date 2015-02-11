<jsp:include page="header.jsp" />
<!-- Banner -->
<!-- <script language="javascript" type="text/javascript">
  function resizeIframe(obj) {
    obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
  }
</script> -->
<section id="banner">
	<h2>Online Web Directory</h2>
	<ul class="actions">
		<li><a href="#" class="button special">Sign Up</a></li>
		<li><a href="#" class="button">Learn More</a></li>
	</ul>
</section>
<section id="main" class="container 75%">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<div class="box">
		<c:forEach var="questions" items="${questionsList}">
			
				
				<div class="displayblocktitle">${questions.title}</div>
				<%-- <div class="previewbox"><iframe sandbox="allow-same-origin allow-scripts allow-popups allow-forms" src="http://${questions.url}" width = "200px" height = "200px" frameborder="0" scrolling="no" id="iframe" onload='javascript:resizeIframe(this);'></iframe></div> --%>
				<div class="displayblockurl"><a href="http://${questions.url}" target="_blank">${questions.url}</a></div>
				<div class="displayblockdes">${questions.description}</div>
				<hr>
				
		</c:forEach>
		</div>		

	<%--For displaying Page numbers. 
	The when condition does not display a link for the current page--%>
	<table border="1" cellpadding="5" cellspacing="5">
		<tr>
	<%--For displaying Previous link except for the 1st page --%>
	<c:if test="${currentPage != 1}">
		<td><a href="getsites?page=${currentPage - 1}&&category=${category}">Previous</a></td>
	</c:if>
			<c:forEach begin="1" end="${noOfPages}" var="i">
				<c:choose>
					<c:when test="${currentPage eq i}">
						<td>${i}</td>
					</c:when>
					<c:otherwise>
						<td><a href="getsites?page=${i}&&category=${category}">${i}</a></td>
					</c:otherwise>
				</c:choose>
			</c:forEach>
	<%--For displaying Next link --%>
	<c:if test="${currentPage lt noOfPages}">
		<td><a href="getsites?page=${currentPage + 1}&&category=${category}">Next</a></td>
	</c:if>
		</tr>
	</table>
</section>

<!-- Footer -->
<jsp:include page="footer.jsp" />