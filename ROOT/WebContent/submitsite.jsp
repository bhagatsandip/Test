<jsp:include page="header.jsp" />
<!-- Main -->
<%
	String username = null;
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("user"))
				username = cookie.getValue();
		}
	}
%>

<section id="main" class="container 75%">
	<%
		if (username != null && username != "") {
	%>
	<header>
		<h2>Submit your site.</h2>
		<p>Submit site to Increase Backlinks..</p>
	</header>
	<div class="box">
		<form method="post" action="/submitsite">
			<input type="hidden" name="username" id="username"
				value=<%=username%>>
			<div class="row uniform 50%">
				<div class="12u">
					<input type="url" name="url" id="url" value="" placeholder="url"
						required />
				</div>
			</div>
			<div class="row uniform 50%">
				<div class="12u">
					<input type="text" name="title" id="title" value=""
						placeholder="Title" required />
				</div>
			</div>
			<div class="row uniform 50%">
				<div class="6u 12u(mobilep)">
					<select name="category">
						<option value="business">Business</option>
						<option value="education">Education</option>
						<option value="employment">Employment</option>
						<option value="entertainment">Entertainment</option>
						<option value="fitnesshealth">Fitness/Health</option>
						<option value="graphicsdesign">Graphics/Design</option>
						<option value="internet">Internet</option>
						<option value="itknowledge">IT Knowledge</option>
						<option value="music">Music</option>
						<option value="news">News</option>
						<option value="realestate">Real Estate/Property</option>
						<option value="other">Other</option>
					</select>
				</div>
			</div>

			<div class="row uniform 50%">
				<div class="12u">					
						<textarea name="description" id="description"
							placeholder="Site description" rows="6" required
							onKeyDown="limitText(this.form.description,this.form.countdown,300);"
							onKeyUp="limitText(this.form.description,this.form.countdown,300);"></textarea>
						<font size="1">(Maximum characters: 300)<br> You have
							<input readonly type="text" name="countdown" size="3" value="300">
							characters left.
						</font>
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
	<%
		} else {
	%>
	<header>
		<h2>Submit your site.</h2>
		<p>Login to Submit site..</p>
	</header>
	<%
		}
	%>
</section>
<jsp:include page="footer.jsp" />
