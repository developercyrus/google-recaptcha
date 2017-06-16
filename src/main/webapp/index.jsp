<!DOCTYPE html>
<html>
	<head>
		<meta charset="US-ASCII">
		<title>Login Page</title>
		<script src="https://www.google.com/recaptcha/api.js"></script>
	</head>
<body>
    <div>ip:<%=request.getRemoteAddr()%></div><br> 
	<form action="GoogleLoginServlet" method="post">

		Username: <input type="text" name="username" value="john"> <br> 
		Password: <input type="password" name="password" value="12345678"> <br>
		<div class="g-recaptcha" data-sitekey="6LfJciUUAAAAAEuTC3QUbhm1jn35v6V8ouiX7Cao"></div><br> 
		<input type="submit" value="Login">
	</form>
</body>
</html>