<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register Account</title>
<%@ include file="/common/head.jsp"%>
</head>

<body>
	<%@ include file="/common/header.jsp"%>

	<div class="container d-flex justify-content-center mt-5">

		<div class="col-md-5 border rounded border-primary py-4 px-4">
			<h3 class="panel-title text-center mb-4">Sign Up</h3>
			<form action="register" method="POST">
				<div class="form-group mt-2">
					<label for="username">Username</label> <input type="text"
						name="username" class="form-control mt-2" placeholder="User name?"
						required />
				</div>
				<div class="form-group mt-3">
					<label for="username">Password</label> <input type="password"
						name="password" class="form-control mt-2" placeholder="Password?"
						required />
				</div>
				<div class="form-group mt-3">
					<label for="username">Confirm Password</label> <input
						type="password" name="cfmPass" class="form-control mt-2"
						placeholder="Confirm Password?" required />
				</div>
				<div class="form-group mt-3">
					<label for="username">Email</label> <input type="email"
						name="email" class="form-control mt-2" placeholder="Email?"
						required />
				</div>
				<div class="form-group ">
					<button type="submit" class="btn btn-primary mt-4 w-100">Register</button>
				</div>
			</form>
			<p class="text-danger">${messageError}</p>
		</div>
	</div>
</body>

</html>