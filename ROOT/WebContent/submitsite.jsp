<jsp:include page="header.jsp" />
	<!-- Main -->
	<%
String username = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
    if(cookie.getName().equals("user")) username = cookie.getValue();
}
}
%>
	
	<section id="main" class="container 75%">
	<%if(username != null && username!="") {%>
		<header>
			<h2>Submit your site.</h2>
			<p>Submit site to Increase Backlinks..</p>
		</header>
		<div class="box">
			<form method="post" action="/submitsite">
				<input type="hidden" name="username" id="username" value=<%=username%> >
				<div class="row uniform 50%">
					<div class="12u">
						<input type="text" name="url" id="url" value=""
							placeholder="url" />
					</div>
				</div>
			<div class="row uniform 50%">
				<div class="12u">
					<input type="text" name="title" id="title" value=""
						placeholder="Title" />
				</div>
			</div>
			<div class="row uniform 50%">
				<div class="6u 12u(mobilep)">
					<select name="category">
						<option value="Education">Education</option>
						<option value="Travel">Travel</option>
						<option value="Organization">Organization</option>
						<option value="Other">Other</option>
					</select>
				</div>
			</div>

			<div class="row uniform 50%">
				<div class="12u">
					<textarea name="description" id="description"
						placeholder="Site description" rows="6"></textarea>
				</div>
			</div>
			<div class="row uniform">
				<div class="12u">
					<ul class="actions align-center">
						<li><input type="submit" value="Submit Site" /></li>
					</ul>
				</div>
			</div>
		</form>
		</div>
		<%} else { %>
			<header>
			<h2>Submit your site.</h2>
			<p>Login to Submit site..</p>
		</header>
		<%} %>
	</section>
	<jsp:include page="footer.jsp" />
	