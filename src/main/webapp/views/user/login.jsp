<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<%@ include file="/common/head.jsp"%>
</head>

<body>
	<%@ include file="/common/header.jsp"%>
	<div class="container d-flex justify-content-center mt-5">
		<div class="col-md-5 border border-primary rounded py-4 px-4"
			style="height: 400px;">
			<h3 class="panel-title text-center mb-4">Login</h3>
			<p class="text-danger">${messageError}</p>
			<form action="login" method="POST">
				<div class="form-group mt-3">
					<label for="username">Username</label> <input type="text"
						class="form-control mt-2" id="username" name="username"
						placeholder="Enter username">
				</div>
				<div class="form-group mt-3">
					<label for="password">Password</label> <input type="password"
						class="form-control mt-2" id="password" name="password"
						placeholder="Enter password">
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-primary mt-5 w-100">Login</button>
				</div>
				
			</form>

		</div>
	</div>





	<!-- <%@ include file="/common/footer.jsp" %> -->
</body>

</html>