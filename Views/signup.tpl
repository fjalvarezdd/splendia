{include file=header.tpl title=$title}
<div class="content">
	<div class="leftNav">
		{include file=leftNav.tpl}
	</div>
	<div class="center">
		<h2>Welcome new user!</h2>
		<form action="/users" >
			<label>Email Address</label>
			<input id="user_login" size="30" type="text">
			<label>Address</label>
			<input id="user_address" size="30" type="text">
			<label>Password</label>
			<input id="user_password" size="30" type="text">
			<label>Confirm Password</label>
			<input id="user_password" size="30" type="text">
			<label>Credit Card Number</label>
			<input id="user_ccn" size="30" type="text">
			<button type="submit" id="signup_button">Signup</button>
		</form>
	</div>
	<div class="rightNav">
		{include file=rightNav.tpl}
	</div>
</div>
{include file=footer.tpl} 