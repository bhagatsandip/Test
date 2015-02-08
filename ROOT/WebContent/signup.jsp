<jsp:include page="header.jsp" />
	<!-- Main -->
	<section id="main" class="container 75%">
		<header>
			<h2>Sign Up</h2>
			<p>Easy Sign Up..</p>
		</header>
		<div class="box">
			<form method="post" action="/signup">
				<div class="row uniform 50%">
					<div class="6u 12u(mobilep)">
						<input type="text" name="username" id="username" value=""
							placeholder="Name" />
					</div>
				</div>
				<div class="row uniform 50%">
					<div class="12u">
						<input type="email" name="email" id="email" value=""
							placeholder="Email" />
					</div>
				</div>
				<div class="row uniform 50%">
					<div class="6u 12u(mobilep)">
						<input type="text" name="firstname" id="firstname" value=""
							placeholder="First Name" />
					</div>
				</div>
				<div class="row uniform 50%">
					<div class="6u 12u(mobilep)">
						<input type="text" name="lastname" id="lastname" value=""
							placeholder="Last Name" />
					</div>
				</div>
				<div class="row uniform 50%">
					<div class="6u 12u(mobilep)">
						<input type="password" name="password" id="password" value=""
							placeholder="Password" />
					</div>
				</div>
				<div class="row uniform 50%">
					<div class="6u 12u(mobilep)">
						<input type="password" name="repassword" id="repassword" value=""
							placeholder="Reenter Password" />
					</div>
				</div>
				<div class="row uniform 50%">
					<div class="6u 12u(mobilep)">
						<div class="button">
							<input type="submit" value="Submit">
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
	