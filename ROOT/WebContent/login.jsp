<jsp:include page="header.jsp" />
	<!-- Main -->
	<section id="main" class="container 75%">
		<header>
			<h2>Login</h2>
			<p>Easy login..</p>
		</header>
		<div class="box">
			<form id="login" method="post" action="/login" onsubmit="setcookies()">
				<div class="row uniform 50%">
					<div class="6u 12u(mobilep)">
						<input type="text" name="username" id="username" value=""
							placeholder="Name" />
					</div>
				</div>
				<div class="row uniform 50%">
					<div class="6u 12u(mobilep)">
						<input type="password" name="password" id="password" value=""
							placeholder="Password" />
					</div>
				</div>

				<div class="row uniform">
				<div class="12u">
					<ul class="actions align-center">
						<li><input type="submit" value="Login" /></li>
					</ul>
				</div>
			</div>
			</form>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
	