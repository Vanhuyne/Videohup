<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!-- Page Loader -->
<fmt:setLocale value="${sessionScope.lang}" scope="request" />
<fmt:setBundle basename="global" scope="request" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<%@ include file="/common/head.jsp"%>
<title>Home</title>
<style>
</style>
</head>

<body>
	<%@ include file="/common/header.jsp"%>
	
	<div class="container">
	<%@ include file="/common/banner.jsp"%>
		<div class="row mb-4 mt-2">
			<h2 class="col-12"><fmt:message key="listVideo"></fmt:message></h2>
			<!-- <div class="col-6 d-flex justify-content-end align-items-center">
							<button class="btn btn-primary tm-btn-prev mb-2 disabled">
								Page ${currentPage} of ${maxPage}</button>
						</div> -->
		</div>
		<div class="row mb-4 ">
			<c:forEach items="${videos}" var="video">
				<div class="col-3">
					<div class="card mt-3" style="width: 18rem;">
						<p class="card-title p-1 fw-bold">${video.title}</p>
						<div class="card-body p-0">
							<!--  	<img src="<c:url value='${video.poster}'/>" alt="Image" class="img-fluid">-->
							<a href="<c:url value='/video?action=watch&id=${video.href}'/>"><img
								class="card-img-top "
								style="width: 100%; height: 100%; object-fit: cover;" alt=".."
								src="${video.poster}"></a>
						</div>
						<div
							class="card-footer d-flex justify-content-between tm-text-gray">
							<span class="tm-text-gray-light">${video.views} - <fmt:message key="like"></fmt:message></span> <span>${video.shares}
								- <fmt:message key="shares"></fmt:message></span>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- row -->
	<div class="container">
		<div class="row">
			<div class="col-12 d-flex justify-content-between align-items-center">
				<c:choose>
					<c:when test="${currentPage == 1}">
						<a href="#" class="btn btn-primary mb-2 disabled"><fmt:message key="previous"></fmt:message></a>
					</c:when>
					<c:otherwise>
						<a href="index?page=${currentPage - 1}"
							class="btn btn-primary mb-2"><fmt:message key="previous"></fmt:message></a>
					</c:otherwise>
				</c:choose>

				<div class="d-flex">
					<c:forEach varStatus="i" begin="1" end="${maxPage}">
						<c:choose>
							<c:when test="${currentPage == i.index}">
								<span class="active tm-paging-link btn btn-primary mb-2">${i.index}</span>
							</c:when>
							<c:otherwise>
								<a href="index?page=${i.index}"
									class="tm-paging-link btn btn-outline-primary mb-2">${i.index}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>

				<c:choose>
					<c:when test="${currentPage == maxPage}">
						<a href="javascript:void(0);"
							class="btn btn-primary tm-btn-prev mb-2 disabled"><fmt:message key="next"></fmt:message></a>
					</c:when>
					<c:otherwise>
						<a href="index?page=${currentPage + 1}"
							class="btn btn-primary tm-btn-prev mb-2"><fmt:message key="next"></fmt:message></a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>


	</div>


	<%@ include file="/common/footer.jsp"%>
</body>

</html>