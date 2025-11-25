<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Login</title>
	<link rel="stylesheet" href="/stylesheets/register/login.css">
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
	<div class="background"></div>
	<video autoplay muted loop id="bg-video">
		<source src="/assets/videos/trongdong.mp4" type="video/mp4">
		Trình duyệt của bạn không hỗ trợ video nền.
	</video>

	<div class="wrapper">
		<form action="javascript:void(0)" onsubmit="handleLogin(); return false;">
			<h1>Login</h1>

			<div class="input-box">
				<input type="text" id="username" placeholder="Username" required>
				<i class='bx bxs-user'></i>
			</div>

			<div class="input-box">
				<input type="password" id="password" placeholder="Password" required>
				<i class='bx bxs-lock-alt'></i>
			</div> 

			<div class="remenber-forgot">
				<label><input type="checkbox"> Remember me</label>
				<a href="#">Forgot password</a>
			</div>
			
			<button type="submit" class="btn">Login</button>

			<div class="register-link">
				<p>Don't have an account?
					<a href="/register">Register</a>
				</p>
			</div>
		</form>
	</div>

	<script src="/scripts/auth/auth.js"></script>
	<script src="/scripts/register/login.js"></script>
</body>
</html>