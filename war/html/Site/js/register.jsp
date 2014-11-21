<%@ include file="header.jsp"%>

	<section id="form" style="margin-top:10px; margin-bottom:70px"><!--form-->
		<div class="container">
			<div class="row">				
				
				<div class="col-sm-6">
					<div class="signup-form"><!--sign up form-->
						<h2>Create your Sithija</h2>
						<form method="post" action="../../start">
							<input type="text" name="companyName" placeholder="Name" required/>
							<input type="email" name="email" placeholder="Email Address" required/>
							<input type="password" placeholder="Password" required/>
							<button type="submit" class="btn btn-default">Signup</button>
							
						</form>
					</div><!--/sign up form-->
					
				</div>
			</div>
		</div>
	</section><!--/form-->

<%@ include file="footer.jsp"%>