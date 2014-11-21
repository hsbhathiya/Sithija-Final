<%@ include file="header.jsp"%>
<link href="css/style.css" rel="stylesheet">
<div class="container">
	<div class="row">
		<div class="col-sm-12">


			<div class="col-sm-5">
				<div class="step" id="step2">
					<div class="number">
						<span>1</span>
					</div>
					<div class="title">
						<h1>Billing Information</h1>
					</div>
				</div>
				<div class="content" id="address">
					<form class="go-right">
						<div>
							<input type="name" name="first_name" value="" id="first_name"
								placeholder="First Name" data-trigger="change"
								data-validation-minlength="1" data-type="name"
								data-required="true" data-error-message="Enter Your First Name" /><label
								for="first_name">First Name</label>
						</div>

						<div>
							<input type="name" name="last_name" value="" id="last_name"
								placeholder="Last Name" data-trigger="change"
								data-validation-minlength="1" data-type="name"
								data-required="true" data-error-message="Enter Your Last Name" /><label
								for="last_name">Last Name</label>
						</div>
						<div>
							<input type="phone" name="telephone" value="" id="telephone"
								placeholder="Phone Number" data-trigger="change"
								data-validation-minlength="1" data-type="number"
								data-required="true"
								data-error-message="Enter Your Telephone Number" /><label
								for="telephone">Telephone</label>
						</div>
						<div>
							<input type="text" name="company" value="" id="company"
								placeholder="Company" data-trigger="change"
								data-validation-minlength="1" data-type="name"
								data-required="false" /> <label for="Company">Company</label>
						</div>
						<div>
							<input type="text" name="address" value="" id="address"
								placeholder="Address" data-trigger="change"
								data-validation-minlength="1" data-type="text"
								data-required="true"
								data-error-message="Enter Your Billing Address" /><label
								for="Address">Address</label>
						</div>
						<div>
							<input type="text" name="city" value="" id="city"
								placeholder="City" data-trigger="change"
								data-validation-minlength="1" data-type="text"
								data-required="true"
								data-error-message="Enter Your Billing City" /><label for="city">City</label>
						</div>
						<div></div>
						<div>
							<input type="text" name="zip" value="" id="zip"
								placeholder="Zip Code" data-trigger="change"
								data-validation-minlength="1" data-type="text"
								data-required="true"
								data-error-message="Enter Your Billing Zip Code" /><label
								for="zip">Zip Code</label>
						</div>
						<div>
							<div class="country_options">
								<div class="select" style="height: 45px">
									<select id="country">
										<option value="1">Sri Lanka</option>
										<option value="2">United States</option>
										<option value="3">United Kingdom</option>
									</select>
								</div>
								<label class="country" for="country">Country</label>
							</div>
						</div>
						<br>
					</form>

				</div>
			</div>
			<div class="col-sm-6 col-offset-1">
				<div class="step" id="step4">
					<div class="number">
						<span>2</span>
					</div>
					<div class="title">
						<h1>Payment Information</h1>
					</div>

				</div>
				<div class="content" id="payment">
					<div class="right col-sm-12">

						<div class="accepted">
							<span><img src="img/Z5HVIOt.png"></span> <span><img
								src="img/Le0Vvgx.png"></span> <span><img
								src="img/D2eQTim.png"></span> <span><img
								src="img/Pu4e7AT.png"></span> <span><img
								src="img/ewMjaHv.png"></span> <span><img
								src="img/3LmmFFV.png"></span>
						</div>
					</div>
					<br>
					<div class="left col-sm-offset-1">
						<form class="go-right" style="margin-top: 20px">
							<div>
								<input type="text" name="card_number" value="" id="card_number"
									placeholder="xxxx-xxxx-xxxx-xxxx" data-trigger="change"
									data-validation-minlength="1" data-type="name"
									data-required="true"
									data-error-message="Enter Your Credit Card Number" /><label
									for="card_number">Card Number</label>
							</div>
							<div>
								<div class="expiry">
									<div class="month_select">
										<select name="exp_month" value="" id="exp_month"
											placeholder="" data-trigger="change" data-type="name"
											data-required="true"
											data-error-message="Enter Your Credit Card Expiration Date">
											<option value="1">01 (Jan)</option>
											<option value="2">02 (Feb)</option>
											<option value="3">03 (Mar)</option>
											<option value="4">04 (Apr)</option>
											<option value="5">05 (May)</option>
											<option value="6">06 (Jun)</option>
											<option value="7">07 (Jul)</option>
											<option value="8">08 (Aug)</option>
											<option value="9">09 (Sep)</option>
											<option value="10">10 (Oct)</option>
											<option value="11">11 (Nov)</option>
											<option value="12">12 (Dec)</option>
										</select>
									</div>
									<div class="year_select">
										<select name="exp_year" value="" id="exp_year" placeholder=""
											data-trigger="change" data-type="name" data-required="true"
											data-error-message="Enter Your Credit Card Expiration Date">
											<option value="1">14</option>
											<option value="2">15 (Feb)</option>
											<option value="3">16 (Mar)</option>
											<option value="4">17 (Apr)</option>
											<option value="5">18 (May)</option>
											<option value="6">19 (Jun)</option>
											<option value="7">20 (Jul)</option>
											<option value="8">22 (Aug)</option>
											<option value="9">23 (Sep)</option>
											<option value="10">24 (Oct)</option>
											<option value="11">25 (Nov)</option>
											<option value="12">26 (Dec)</option>
										</select>
									</div>
									<label class="exp_date" for="Exp_Date">Exp Date</label>
								</div>
							</div>
							<div class="sec_num">
								<div>
									<input type="text" name="ccv" value="" id="ccv"
										placeholder="123" data-trigger="change"
										data-validation-minlength="3" data-type="name"
										data-required="true"
										data-error-message="Enter Your Card Security Code" /><label
										for="ccv">Security Code</label>
								</div>
							</div>
						</form>

					</div>
					<a class="continue" href="#">Continue</a>


				</div>
			</div>
		</div>

	</div>
</div>

<%@ include file="footer.jsp"%>