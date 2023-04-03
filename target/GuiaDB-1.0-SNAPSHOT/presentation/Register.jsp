<!DOCTYPE html>
<html>
<head>
	<title>Registration Form</title>
        <%@ include file="/presentation/Head.jsp" %>
</head>
<body>
	<h2>Registration Form</h2>
	<form name="regForm" action="presentation/login/register" method="post">
		<label for="name">Name:</label>
		<input type="text" id="name" name="name" required><br><br>

	<!--	<label for="email">Email:</label>
		<input type="email" id="email" name="email" required><br><br>
        -->
		<label for="password">Password:</label>
		<input type="password" id="password" name="password" minlength="1" required><br><br>

	<!--	<label for="confirmPassword">Confirm Password:</label>
		<input type="password" id="confirmPassword" name="confirmPassword" minlength="8" required><br><br>
        -->
		<input type="submit" value="Submit">
	</form>
</body>
</html>
