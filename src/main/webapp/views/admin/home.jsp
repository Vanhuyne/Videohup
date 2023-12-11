<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<%@ include file="/common/head.jsp"%>
<title>Home Admin</title>
<style>
</style>
</head>
<body>
	<div class="container mt-4">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav me-auto">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page">${sessionScope.currentUser.username}</a></li>
					</ul>
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="admin">Dashboard</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Settings</a></li>
						<li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- Your content here -->
		<div class="rounded ">
			<h2 class="mt-3">User</h2>
			<table class="table table-bordered mt-3">
				<thead>
					<tr>
						<th scope="col">Id</th>
						<th scope="col">User name</th>
						<th scope="col">Pass word</th>
						<th scope="col">Email</th>
						<th scope="col">Role</th>
						<th scope="col">Active</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${users}" var="user">
						<tr>
							<td>${user.id}</td>
							<td>${user.username}</td>
							<td>${user.password}</td>
							<td>${user.email}</td>
							<td>${user.isAdmin ? 'Admin' : 'User'}</td>
							<td>${user.isActive ? ' 1 ' : ' 0 '}<a
								href="edit?userId=${user.id}">
									<button type="button" class="btn btn-warning">Edit</button>
							</a> <a href="delete?userId=${user.id}">
									<button type="button" class="btn btn-danger">Delete</button>
							</a>

							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="container mt-4">

			<div class="col-md-5 border border-primary rounded py-4 px-4 w-100">
				<form action="add" method="post"class="mt-3 w-50">
					<h3 class="text-center mt-4">Edit User</h3>
					<div class="row">
						<div class="col-8">
							<div class="form-group mt-3">
								<input class="form-control" value="${user.username}"
									name="username" placeholder="username">
							</div>
							<div class="mb-3">
								<input class="form-control mt-3" value="${user.password}"
									name="password" placeholder="password">
							</div>
							<div class="mb-3">
								<input class="form-control mt-3" value="${user.email}"
									name="email" placeholder="email">
							</div>

							<div class="mb-3">
								<div class="form-check">
									Admin<input ${user.isAdmin ? 'checked' : '' } name="admin"
										type="radio" value="true"> User <input
										${user.isAdmin ? ' ': 'checked'} name="admin" type="radio"
										value="false">
								</div>
							</div>
						</div>
						<div class="col-4 ">
							<a>
								<button type="submit" class="btn btn-primary w-50 mt-3">Add
									User</button>
							</a> <a href="update?userId=${user.id}">
								<button type="submit" class="btn btn-success w-50 mt-3">Update</button>
							</a> <a href="resest">
								<button type="button" class="btn btn-secondary w-50 mt-3">Resest</button>
							</a>
						</div>
					</div>

				</form>
			</div>

		</div>
		<div class="rounded ">
			<h2 class="mt-3">Videos</h2>
			<table class="table table-bordered mt-3">
				<thead>
					<tr>
						<th scope="col">Title</th>
						<th scope="col">Link</th>
						<th scope="col">Total Like</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${videos}" var="item">
						<tr>
							<td>${item.title}</td>
							<td><a
								href="<c:url value='/video?action=watch&id=${item.href}'/>">${item.href}</a></td>
							<td>${item.totalLike}</td>
						</tr>
					</c:forEach>
					<!-- Add more rows as needed -->
				</tbody>
			</table>
		</div>

	</div>

</body>
</html>