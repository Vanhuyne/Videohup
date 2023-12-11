<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forgot Password</title>
<%@ include file="/common/head.jsp"%>
</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<div class="container">
		<div class="row w-50 mx-auto border border-primary mt-4 rounded">
			<div>
				<h2 class="text-center col-sm-12 col-12 mb-5 mt-5">Forgot
					Password</h2>
			</div>
			<div class="form-group">
				<input type="email" id="email" name="email"
					class="form-control " placeholder="Enter email?" required />
			</div>
			<div class="form-group">
				<center>
					<button type="submit" id="sendBtn" class="btn btn-primary w-100 mt-3">Send
						Request</button>
				</center>
			</div>
			<div>
				<p class="text-center " id="messageReturn"></p>
			</div>

		</div>
	</div>
</body>
<script>
	$('#sendBtn').click(function () {
		$('#messageReturn').text('');
		var email = $('#email').val();
		var formData ={'email' : email};
		$.ajax({
			url: 'forgotPass',
			type: 'POST',
			data: formData
		}).then(function(data) {
			$('#messageReturn').text('Password has been changed!!, Please check your email!!');
			setTimeout(() => {
				window.location.href = "http://localhost:8080/Asm-java4/login";
			}, 5000);
		}).fail(function(error) {
			$('#messageReturn').text('ERROR!, Please check your information!!')
		});
	});
</script>
</html>