<jsp:include page="header.jsp" />
<!-- Banner -->
<section id="banner">
	<h2>Online Web Directory</h2>
	<ul class="actions">
		<li><a href="#" class="button special">Sign Up</a></li>
		<li><a href="#" class="button">Learn More</a></li>
	</ul>
</section>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table border="1" cellpadding="5" cellspacing="5">
		<tr>
			<th>Title</th>
			<th>URL</th>
			<th>Description</th>
			<th>Cat</th>
		</tr>

		<c:forEach var="questions" items="${questionsList}">
			<tr>
				<td>${questions.title}</td>
				<td><a href="http://${questions.url}" target="_blank">${questions.url}</a></td>
				<td>${questions.description}</td>
				<td>${questions.category}</td>
			</tr>
		</c:forEach>
	</table>

	<%--For displaying Previous link except for the 1st page --%>
	<c:if test="${currentPage != 1}">
		<td><a href="getsites?page=${currentPage - 1}&&category=${category}">Previous</a></td>
	</c:if>

	<%--For displaying Page numbers. 
	The when condition does not display a link for the current page--%>
	<table border="1" cellpadding="5" cellspacing="5">
		<tr>
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
		</tr>
	</table>
	
	<%--For displaying Next link --%>
	<c:if test="${currentPage lt noOfPages}">
		<td><a href="getsites?page=${currentPage + 1}&&category=${category}">Next</a></td>
	</c:if>


<!-- Footer -->
<jsp:include page="footer.jsp" />