<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/common/taglib.jsp"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Favourite</title>
<%@ include file="/common/head.jsp"%>
<style>
</style>
</head>
<body>
	<%@ include file="/common/header.jsp"%>

	<div class="container">
		<div class="row mb-4">
			<h2 class="col-12 tm-text-primary text-center">List Favorites</h2>
		</div>
		<div class="row mb-4">
			<c:forEach items="${videos}" var="video">
				<div class="col-3">
					<div class="card" style="width: 18rem;">
						<h5 class="card-title p-2">${video.title}</h5>
						<div class="card-body p-0">
							<!--  	<img src="<c:url value='${video.poster}'/>" alt="Image" class="img-fluid">-->
							<a href="<c:url value='/video?action=watch&id=${video.href}'/>"><img
								class="card-img-top "
								style="width: 100%; height: 100%; object-fit: cover;" alt=".."
								src="${video.poster}"></a>
						</div>
						<div
							class="card-footer d-flex justify-content-between tm-text-gray">
							<span class="tm-text-gray-light">${video.views} - Views</span> <span>${video.shares}
								- Shares</span>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- container-fluid, tm-container-content -->

	<%@ include file="/common/footer.jsp"%>
</body>
</html>