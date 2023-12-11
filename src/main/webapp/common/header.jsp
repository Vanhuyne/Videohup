<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!-- Page Loader -->
<fmt:setLocale value="${sessionScope.lang}" scope="request" />
<fmt:setBundle basename="global" scope="request" />


<nav class="navbar navbar-expand-lg ms-auto border-bottom border-gray">
	<div class="container">
		<a class="navbar-brand" style="color: red;"
			href="<c:url value='/index' />"> <img class="img-30" alt=".."
			src="./templates/user/img/logo.png"
			style="width: 40px; height: 40px;">
		</a>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fas fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0 ">
				<c:choose>
					<c:when test="${not empty sessionScope.currentUser}">
						<!--  <li class="nav-item"><a class="nav-link " data-toggle="modal"
							data-target="#changePassModal" aria-current="page">${sessionScope.currentUser.username}</a>
						</li> -->

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								${sessionScope.currentUser.username} </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="favorites">Favourites</a></li>
								<li><a class="dropdown-item" href="history">History</a></li>
								<c:if test="${sessionScope.currentUser.getIsAdmin() == true}">
									<li><a class="dropdown-item"
										href="http://localhost:8080/Asm-java4/admin">Statistical</a></li>
								</c:if>
								<li><a class="dropdown-item log-out" id="logout"
									href="logout">Log out</a></li>

								<li><a class="dropdown-item " data-bs-toggle="modal"
									data-bs-target="#changePassModal">Change Password</a></li>
							</ul></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item "><a class="nav-link nav-link-1"
							href="forgotPass"> <fmt:message key="forgot"></fmt:message></a></li>
							
						<li class="nav-item "><a class="nav-link nav-link-1"
							href="login"><fmt:message key="login"></fmt:message></a></li>
						<li class="nav-item "><a class="nav-link nav-link-1"
							href="register"><fmt:message key="register"></fmt:message></a></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Language </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li class="dropdown-item"><a class="nav-link "
									href="change-lang?lang=en">English</a></li>
								<li class="dropdown-item"><a class="nav-link "
									href="change-lang?lang=vi">Vietnamese</a></li>
							</ul></li>

					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>

<!-- Modal -->
<div class="modal fade" id="changePassModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Change Password</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="">
					<input type="password" name="currentPass" id="currentPass"
						class="form-control" placeholder="Current Password?" required>
				</div>
				<br>
				<div class="">
					<input type="password" name="newPass" id="newPass"
						class="form-control " placeholder="New Password?" required>
				</div>
				<p class="text-center" id="messageChangePass"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary" id="changePassBtn">Save
					changes</button>
			</div>
		</div>
	</div>
</div>
<script>
	$('#changePassBtn').click(
			function() {
				$('#messageChangePass').text('');
				var currentPass = $('#currentPass').val();
				var newPass = $('#newPass').val();
				var formData = {
					'currentPass' : currentPass,
					'newPass' : newPass
				};
				var deferred = $.ajax({
					url : 'changePass',
					type : 'POST',
					data : formData
				});

				deferred.done(function(data) {
					$('#messageChangePass').text('Password has been changed!!')
							.css('color', 'green');
				});

				deferred.fail(function(error) {
					$('#messageChangePass').text(
							'ERROR!, Please check your information!!').css(
							'color', 'red');
				});
			});
</script>