<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${video.title}</title>
<%@ include file="/common/head.jsp"%>

</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<div class="container mb-5">
		<div class="row mb-2">
			<h2 class="col-12 ">${video.title}</h2>
		</div>
		<div class="row">
			<div class="col-xl-8 border-end border-gray">
				<iframe width="100%" height="100%"
					src="https://www.youtube.com/embed/${video.href}"></iframe>
			</div>
			<div class="col-xl-4 border-start border-gray"
				style="min-height: 450px !important">
				<div class="">
					<div class="mb-4 row text-center">
						<h3 class="text-gray-dark mb-3">Description</h3>
						<p>${video.description}</p>
					</div>
					<c:if test="${not empty sessionScope.currentUser}">
						<div class="row">
							<div class="col-12 d-flex justify-content-center">
								<button id="likeOrUnlikeBtn" class="btn btn-primary w-50 me-2">
									<c:choose>
										<c:when test="${flagLikedBtn == true}">
                                Unlike
                            </c:when>
										<c:otherwise>Like</c:otherwise>
									</c:choose>
								</button>
								<a href="#" class="btn btn-primary w-50 ms-2">Share</a>
							</div>
						</div>
					</c:if>
					<input id="videoIdHidden" type="hidden" value="${video.href}" />
				</div>
			</div>

		</div>
	</div>


	<%@ include file="/common/footer.jsp"%>
	<script>
		$('#likeOrUnlikeBtn').click(function() {
			var videoId = $('#videoIdHidden').val();
			$.ajax(
			{
				url : 'video?action=like&id=' + videoId
			}).then(function(data) {
				var text = $('#likeOrUnlikeBtn').text();
				if (text.indexOf('Like') != -1) { // tim ra
					$('#likeOrUnlikeBtn').text('Unlike');
				} else {
					$('#likeOrUnlikeBtn').text('Like');
				}
			}).fail(function(error) {
				alert('Please try again!!! System has been erorr!!!')
			});
		});
	</script>
</body>
</html>