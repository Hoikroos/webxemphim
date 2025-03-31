<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">

<head>
<title>Title</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="icon" href="/ASSJAVA4_PD10303/image/video.png">


</head>
<style>
.navbar-nav .dropdown:hover .dropdown-menu {
	display: block;
	margin-top: 0;
}

.dropdown-menu {
	border: none;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

.dropdown-item:hover {
	background-color: #007bff;
	color: white;
}

.navbar {
	padding: 1rem;
}

.navbar-nav .nav-link {
	font-weight: 500;
	transition: all 0.3s ease-in-out;
}

.navbar-nav .nav-link:hover {
	color: yellow;
}

.form-control {
	width: 250px;
	border: 2px solid #ffc107;
}

.btn-success {
	background-color: #28a745;
	border: none;
}

.btn-success:hover {
	background-color: #218838;
}

.carousel-img {
	height: 400px;
	object-fit: cover;
	border-radius: 8px; . card img { height : 200px;
	object-fit: cover;
}

.badge {
	font-size: 0.75rem;
	padding: 0.4em 0.6em;
	border-radius: 4px;
}

}
.carousel .btn {
	background-color: #222;
	border: none;
	padding: 5px 10px;
}

.carousel .btn i {
	color: #fff;
}

.carousel-inner {
	padding-top: 10px;
}

footer {
	background-color: #000;
	color: #fff;
}

footer a {
	text-decoration: none;
}

footer a:hover {
	color: #007bff;
}

footer h5, footer h6 {
	font-weight: bold;
}

footer .fab {
	font-size: 1.2rem;
}

footer hr {
	border-top: 1px solid #444;
}

.video-card {
	position: relative;
	overflow: hidden;
	cursor: pointer;
}

.video-link {
	display: block;
	position: relative;
}

.card-img-top {
	transition: transform 0.3s ease;
}

.video-card:hover .card-img-top {
	transform: scale(1.1);
}

.play-icon {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
	font-size: 2.5rem;
	opacity: 0;
	transition: opacity 0.3s ease;
	z-index: 10;
}

.video-card:hover .play-icon {
	opacity: 1;
}

.video-card:hover .play-icon i {
	animation: pulse 1.5s infinite;
}

@
keyframes pulse { 0%, 100% {
	transform: scale(1);
	opacity: 1;
}

50


%
{
transform


:


scale
(


1
.2


)
;


opacity


:


0
.8
;


}
}
.video-list {
	max-height: 400px;
}

.video-item:hover .video-title a {
	color: #007bff;
	text-decoration: underline;
}

.video-thumbnail {
	border-radius: 5px;
	transition: transform 0.2s ease;
}

.video-item:hover .video-thumbnail {
	transform: scale(1.1);
}

.dropdown-menu {
	min-width: 300px;
	padding: 10px;
}

.dropdown-item {
	font-size: 14px;
	padding: 8px 12px;
}
</style>
<script>
	$(document).on("submit", "#searchForm", function(event) {
		event.preventDefault();
		const videoName = $("#searchInput").val();
		if (videoName.trim() === "") {
			$("#results").html("<p>Vui lòng nhập từ khóa tìm kiếm.</p>");
			return;
		}
		$.ajax({
			url : "VideoSearchServlet",
			method : "GET",
			data : {
				videoName : videoName
			},
			success : function(response) {
				$("#results").html(response);
			},
			error : function() {
				$("#results").html("<p>Đã xảy ra lỗi khi tìm kiếm.</p>");
			}
		});
	});
</script>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg bg-primary ">
			<div class="container-fluid ">
				<a class="navbar-brand" href="#"><img src="Logo.png" height="50"
					width="50" alt=""></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="/ASSJAVA4_PD10303/indexServlet">Home</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/myFavoriteServlet">Yêu
								thích</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Phim Lẻ</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">Phim Bộ</a>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdownMenu1"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Thể Loại </a>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
								<div class="row">
									<div class="col-6">
										<li><a class="dropdown-item" href="#">Phim Hài Hước</a></li>
										<li><a class="dropdown-item" href="#">Phim Võ Thuật</a></li>
										<li><a class="dropdown-item" href="#">Phim Kinh Dị</a></li>
										<li><a class="dropdown-item" href="#">Phim Tình Cảm</a></li>
										<li><a class="dropdown-item" href="#">Phim Cổ Trang</a></li>
										<li><a class="dropdown-item" href="#">Phim Tâm Lí</a></li>
										<li><a class="dropdown-item" href="#">Phim Hình Sự</a></li>
									</div>
									<div class="col-6">
										<li><a class="dropdown-item" href="#">Phim Hoạt Hình</a></li>
										<li><a class="dropdown-item" href="#">Phim Viễn Tưởng</a></li>
										<li><a class="dropdown-item" href="#">Phim Khoa Học</a></li>
										<li><a class="dropdown-item" href="#">Phim Phiêu Lưu</a></li>
										<li><a class="dropdown-item" href="#">Phim Ma - Kinh
												Dị</a></li>
										<li><a class="dropdown-item" href="#">Phim Chiếu Rạp</a></li>
									</div>
									<div />
							</ul></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdownMenu2"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Quốc Gia </a>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
								<div class="row">
									<div class="col-6">
										<li><a class="dropdown-item" href="#">Phim Trung Quốc</a></li>
										<li><a class="dropdown-item" href="#">Phim Nhật Bản</a></li>
										<li><a class="dropdown-item" href="#">Phim Hàn Quốc</a></li>
										<li><a class="dropdown-item" href="#">Phim Đài Loan</a></li>
										<li><a class="dropdown-item" href="#">Phim Hồng Kông</a></li>
									</div>
									<div class="col-6">
										<li><a class="dropdown-item" href="#">Phim Thái Lan</a></li>
										<li><a class="dropdown-item" href="#">Phim Âu Mỹ</a></li>
										<li><a class="dropdown-item" href="#">Phim Tổng Hợp</a></li>
										<li><a class="dropdown-item" href="#">Phim Ấn Độ</a></li>
									</div>
									<div />
							</ul></li>
					</ul>
					<form class="d-flex" role="search" action="VideoSearchServlet"
						method="GET">
						<input class="form-control me-3" type="search"
							placeholder="Search" name="videoName" aria-label="Search">
						<button class="btn btn-danger" type="submit">Search</button>
					</form>
					<div id="results"></div>
					<ul class="navbar-nav ms-5 me-3">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdownMenu3"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<c:choose>
									<c:when test="${not empty sessionScope.user}">
                                        Hi,${sessionScope.user.fullname}
                                    </c:when>
									<c:otherwise>
                                        Tài Khoản 
                                    </c:otherwise>
								</c:choose>
						</a>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenu3">
								<c:choose>
									<c:when test="${empty sessionScope.user}">
										<li><a class="dropdown-item"
											href="${pageContext.request.contextPath}/login"> <i
												class="fa-solid fa-right-to-bracket"></i> Login
										</a></li>
										<li><a class="dropdown-item"
											href="${pageContext.request.contextPath}/forgotPass"> <i
												class="fa-solid fa-lock"></i> Forgot Password
										</a></li>
										<li><a class="dropdown-item"
											href="${pageContext.request.contextPath}/register"> <i
												class="fa-solid fa-user-plus"></i> Registration
										</a></li>
									</c:when>
									<c:otherwise>
										<li><a class="dropdown-item"
											href="${pageContext.request.contextPath}/Logout"> <i
												class="fa-solid fa-right-from-bracket"></i> Logoff
										</a></li>
										<li><a class="dropdown-item"
											href="${pageContext.request.contextPath}/changePass"> <i
												class="fa-solid fa-rotate"></i> Change Password
										</a></li>
										<li><a class="dropdown-item"
											href="${pageContext.request.contextPath}/editProfile"> <i
												class="fa-solid fa-pen-to-square"></i> Edit Profile
										</a></li>
										<c:if
											test="${not empty sessionScope.user and sessionScope.user.admin}">
											<li><a class="dropdown-item"
												href="${pageContext.request.contextPath}/video"> <i
													class="fa-solid fa-cogs"></i> Admin Dashboard
											</a></li>
										</c:if>
									</c:otherwise>
								</c:choose>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="container mt-4 border">
			<div class="row">
				<article class="col-12 col-lg-9 border-end">
					<div id="carouselExampleDark" class="carousel carousel-dark slide">
						<div class="carousel-indicators">
							<c:forEach var="video" items="${latestVideos1}"
								varStatus="status">
								<button type="button" data-bs-target="#carouselExampleDark"
									data-bs-slide-to="${status.index}"
									class="${status.first ? 'active' : ''}"
									aria-current="${status.first ? 'true' : ''}"
									aria-label="Slide ${status.index + 1}"></button>
							</c:forEach>
						</div>
						<div class="carousel-inner">
							<c:forEach var="video" items="${latestVideos1}"
								varStatus="status">
								<div class="carousel-item ${status.first ? 'active' : ''}">
									<a
										href="${pageContext.request.contextPath}/videochitiet?id=${video.id}">
										<img src="${video.poster}" class="d-block w-100"
										alt="${video.title}">
									</a>
								</div>
							</c:forEach>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleDark" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleDark" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
					<div class="container mt-4">
						<div class="d-flex justify-content-between align-items-center">
							<h4 class="text mb-3">Phim mới nổi bật</h4>
							<div>
								<button class="btn btn-dark btn-sm me-2" type="button"
									data-bs-target="#carouselPhimMoiNoiBat" data-bs-slide="prev">
									<i class="fa-solid fa-chevron-left"></i>
								</button>
								<button class="btn btn-dark btn-sm" type="button"
									data-bs-target="#carouselPhimMoiNoiBat" data-bs-slide="next">
									<i class="fa-solid fa-chevron-right"></i>
								</button>
							</div>
						</div>
						<div id="carouselPhimMoiNoiBat" class="carousel slide"
							data-bs-ride="carousel">
							<div class="carousel-inner">
								<c:forEach var="entry" items="${categoryVideos}">
									<div
										class="carousel-item ${entry.key == categoryVideos.keySet().iterator().next() ? 'active' : ''}">
										<div class="row row-cols-2 row-cols-md-4 g-4">
											<c:forEach var="video" items="${entry.value}">
												<c:if test="${fn:indexOf(entry.value, video) > 4 }">
													<div class="col">
														<div class="card bg-dark text-white h-100">
															<a
																href="${pageContext.request.contextPath}/videochitiet?id=${video.id}">
																<img
																src="${pageContext.request.contextPath}/${video.poster}"
																class="card-img-top" alt="${video.title}">
															</a>
															<div class="card-body">
																<h6 class="card-title text-uppercase">${video.title}</h6>
																<p class="card-text">${video.years}</p>
															</div>
															<div
																class="badge bg-danger position-absolute top-0 start-0 m-2">Nổi
																bật</div>
														</div>
													</div>
												</c:if>
											</c:forEach>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="container mt-4">
						<c:forEach var="entry" items="${categoryVideos}">
							<div
								class="d-flex justify-content-between align-items-center mb-2 mt-2">
								<h4>${entry.key.name}</h4>
								<a
									href="${pageContext.request.contextPath}/categoryvideos?id=${entry.key.id}"
									class="btn btn-primary btn-sm">Xem thêm</a>
							</div>
							<div class="row row-cols-2 row-cols-md-4 g-4">
								<c:forEach var="video" items="${entry.value}">
									<div class="col">
										<div class="card bg-dark text-white h-100 video-card">
											<a
												href="${pageContext.request.contextPath}/videochitiet?id=${video.id}">
												<img
												src="${pageContext.request.contextPath}/${video.poster}"
												class="card-img-top" alt="${video.title}">
												<div class="play-icon">
													<i class="fas fa-play"></i>
												</div>
											</a>
											<div class="card-body">
												<h6 class="card-title text-uppercase">${video.title}</h6>
												<p class="card-text">${video.years}</p>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</c:forEach>
					</div>
				</article>
				<aside class="col-12 col-lg-3">
					<div class="p-3 border bg-light">
						<h4>TOP 15</h4>
						<div class="video-list">
							<c:forEach var="video" items="${latestVideos}">
								<div class="video-item d-flex align-items-center mb-3">
									<a
										href="${pageContext.request.contextPath}/videochitiet?id=${video.id}"
										class="d-flex"> <img
										src="${pageContext.request.contextPath}/${video.poster}"
										alt="${video.title}" class="video-thumbnail me-2"
										style="width: 80px; height: 50px; object-fit: cover;">
									</a>
									<div>
										<h6 class="video-title mb-1">
											<a
												href="${pageContext.request.contextPath}/videochitiet?id=${video.id}"
												class="text-dark text-decoration-none"> ${video.title} </a>
										</h6>
										<p class="text-muted small mb-0">${video.years}</p>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</aside>
			</div>
		</div>
		<footer class="bg-dark text-white mt-4 py-4">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<h5 class="mb-3">PHIMMOI.NET</h5>
						<p>Phimmoi - Trang xem phim Online với giao diện mới. Nguồn
							phim được tổng hợp từ các website lớn với đa dạng các đầu phim
							thể loại vô cùng phong phú.</p>
						<p>
							<strong>Contact:</strong> <a href="#" class="text-info">Call
								Now</a>
						</p>
						<p>
							<a href="#" class="text-secondary">anime</a>, <a href="#"
								class="text-secondary">animetv</a>, <a href="#"
								class="text-secondary">anime vietsub</a>, <a href="#"
								class="text-secondary">xem anime</a>
						</p>
					</div>
					<div class="col-md-2">
						<h6 class="mb-3">Phim mới</h6>
						<ul class="list-unstyled">
							<li><a href="#" class="text-secondary">Phim Khoa Học</a></li>
							<li><a href="#" class="text-secondary">Phim Kinh Dị</a></li>
							<li><a href="#" class="text-secondary">Phim Chiếu Rạp</a></li>
							<li><a href="#" class="text-secondary">Phim Hình Sự</a></li>
							<li><a href="#" class="text-secondary">Phim Hành Động</a></li>
						</ul>
					</div>
					<div class="col-md-2">
						<h6 class="mb-3">Phim hay</h6>
						<ul class="list-unstyled">
							<li><a href="#" class="text-secondary">Phim Âu Mỹ</a></li>
							<li><a href="#" class="text-secondary">Phim Hàn Quốc</a></li>
							<li><a href="#" class="text-secondary">Phim Trung Quốc</a></li>
							<li><a href="#" class="text-secondary">Phim Nhật Bản</a></li>
							<li><a href="#" class="text-secondary">Phim Thái Lan</a></li>
						</ul>
					</div>
					<div class="col-md-4">
						<h6 class="mb-3">Thông tin</h6>
						<ul class="list-unstyled">
							<li><a href="#" class="text-secondary">Giới thiệu</a></li>
							<li><a href="#" class="text-secondary">Liên hệ chúng tôi</a></li>
							<li><a href="#" class="text-secondary">Điều khoản sử
									dụng</a></li>
							<li><a href="#" class="text-secondary">Chính sách riêng
									tư</a></li>
							<li><a href="#" class="text-secondary">Khiếu nại bản
									quyền</a></li>
						</ul>
						<div class="mt-3">
							<a href="#" class="text-white me-2"><i
								class="fab fa-facebook"></i></a> <a href="#" class="text-white me-2"><i
								class="fab fa-twitter"></i></a> <a href="#" class="text-white me-2"><i
								class="fab fa-instagram"></i></a> <a href="#" class="text-white"><i
								class="fab fa-youtube"></i></a>
						</div>
					</div>
				</div>
				<div class="text-center mt-4">
					<hr class="border-secondary">
					<p class="mb-0">© Phimmoi</p>
				</div>
			</div>
		</footer>

	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
</body>

</html>