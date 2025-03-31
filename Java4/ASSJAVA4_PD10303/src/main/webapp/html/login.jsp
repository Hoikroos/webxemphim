<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link rel="icon" href="/ASSJAVA4_PD10303/image/video.png">
</head>
<style>
.dropdown-menu {
	min-width: 300px;
	padding: 10px;
}

.dropdown-item {
	font-size: 14px;
	padding: 8px 12px;
}

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

.form-container {
	width: 400px;
	background-color: #ffffff;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
	border-radius: 12px;
	padding: 30px;
	box-sizing: border-box;
}

.title {
	text-align: center;
	font-size: 24px;
	font-weight: bold;
	color: #333333;
	margin-bottom: 20px;
}

.form {
	display: flex;
	flex-direction: column;
	gap: 15px;
}

.input {
	border-radius: 8px;
	border: 1px solid #cccccc;
	padding: 12px;
	font-size: 14px;
}

.input:focus {
	border-color: teal;
	outline: none;
}

.page-link {
	display: flex;
	justify-content: space-between;
	font-size: 12px;
	color: #555555;
}

.page-link-label {
	cursor: pointer;
	text-decoration: none;
}

.page-link-label:hover {
	color: teal;
}

.form-btn {
	padding: 12px;
	background-color: teal;
	color: white;
	border: none;
	border-radius: 8px;
	font-size: 16px;
	cursor: pointer;
}

.form-btn:hover {
	background-color: #006666;
}

.sign-up-label {
	text-align: center;
	font-size: 14px;
	color: #555555;
}

.sign-up-link {
	color: teal;
	font-weight: bold;
	cursor: pointer;
	text-decoration: none;
}

.sign-up-link:hover {
	color: #006666;
}

.buttons-container {
	margin-top: 20px;
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.social-login-button {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 10px;
	padding: 12px;
	border-radius: 8px;
	font-size: 14px;
	cursor: pointer;
	font-weight: bold;
}

.apple-login-button {
	background-color: #000000;
	color: #ffffff;
}

.google-login-button {
	border: 1px solid #cccccc;
	background-color: #ffffff;
	color: #555555;
}

.google-login-button:hover {
	background-color: #f8f9fa;
}

.social-login-button svg {
	font-size: 18px;
}

.page-link {
	display: flex;
	align-items: center;
	justify-content: space-between;
	font-size: 14px;
}

.page-link-checkbox {
	display: flex;
	align-items: center;
}

.page-link-checkbox-input {
	margin-right: 5px;
}

.page-link-checkbox-label {
	color: #555;
}

.page-link-label a {
	color: #007bff;
	text-decoration: none;
}

.page-link-label a:hover {
	text-decoration: none;
}
</style>

<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg bg-primary">
			<div class="container-fluid">
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
							aria-current="page" href="/ASSJAVA4_PD10303/indexServlet">Home</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="/ASSJAVA4_PD10303/myFavoriteServlet">Yêu thích</a></li>
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
					<form class="d-flex" role="search">
						<input class="form-control me-3" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-danger" type="submit">Search</button>
					</form>
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

		<div class="d-flex justify-content-center mt-4 border">
			<div class="form-container border-2">
				<p class="title">LOGIN</p>
				<c:if test="${not empty errorMessage}">
					<div class="alert alert-danger text-center m-3" role="alert" id="errorMessage">
						${errorMessage}</div>
				</c:if>
				<form class="form" method="post" action="login">
					<input type="text" class="input" name="idOrEmail" id="idOrEmail"
						placeholder="Username" > <input type="password"
						class="input" name="password" id="password" placeholder="Password"
						>
					<div class="page-link">
						<label class="page-link-checkbox"> <input
							class="page-link-checkbox-input" type="checkbox"
							name="rememberMe" id="rememberMe"> <span
							class="page-link-checkbox-label">Remember me?</span>
						</label> <span class="page-link-label"><a
							href="/ASSJAVA4_PD10303/forgotPass">Forgot Password?</a></span>
					</div>

					<button type="submit" class="form-btn">Log in</button>
				</form>
				<p class="sign-up-label">
					Don't have an account? <span class="sign-up-link"><a
						href="/ASSJAVA4_PD10303/register">Sign up</a></span>
				</p>
				<div class="buttons-container">
					<div class="social-login-button apple-login-button">
						<svg stroke="currentColor" fill="currentColor" stroke-width="0"
							viewBox="0 0 1024 1024" height="1em" width="1em"
							xmlns="http://www.w3.org/2000/svg">
                            <path
								d="M747.4 535.7c-.4-68.2 30.5-119.6 92.9-157.5-34.9-50-87.7-77.5-157.3-82.8-65.9-5.2-138 38.4-164.4 38.4-27.9 0-91.7-36.6-141.9-36.6C273.1 298.8 163 379.8 163 544.6c0 48.7 8.9 99 26.7 150.8 23.8 68.2 109.6 235.3 199.1 232.6 46.8-1.1 79.9-33.2 140.8-33.2 59.1 0 89.7 33.2 141.9 33.2 90.3-1.3 167.9-153.2 190.5-221.6-121.1-57.1-114.6-167.2-114.6-170.7zm-105.1-305c50.7-60.2 46.1-115 44.6-134.7-44.8 2.6-96.6 30.5-126.1 64.8-32.5 36.8-51.6 82.3-47.5 133.6 48.4 3.7 92.6-21.2 129-63.7z">
                            </path>
                        </svg>
						<span>Log in with Apple</span>
					</div>
					<div class="social-login-button google-login-button">
						<svg stroke="currentColor" fill="currentColor" stroke-width="0"
							viewBox="0 0 48 48" height="1em" width="1em"
							xmlns="http://www.w3.org/2000/svg">
                            <path fill="#FFC107"
								d="M43.611,20.083H42V20H24v8h11.303c-1.649,4.657-6.08,8-11.303,8c-6.627,0-12-5.373-12-12 c0-6.627,5.373-12,12-12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657C34.046,6.053,29.268,4,24,4C12.955,4,4,12.955,4,24 c0,11.045,8.955,20,20,20c11.045,0,20-8.955,20-20C44,22.659,43.862,21.35,43.611,20.083z">
                            </path>
                            <path fill="#FF3D00"
								d="M6.306,14.691l6.571,4.819C14.655,15.108,18.961,12,24,12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657 C34.046,6.053,29.268,4,24,4C16.318,4,9.656,8.337,6.306,14.691z">
                            </path>
                            <path fill="#4CAF50"
								d="M24,44c5.166,0,9.86-1.977,13.409-5.192l-6.19-5.238C29.211,35.091,26.715,36,24,36 c-5.202,0-9.619-3.317-11.283-7.946l-6.522,5.025C9.505,39.556,16.227,44,24,44z">
                            </path>
                            <path fill="#1976D2"
								d="M43.611,20.083H42V20H24v8h11.303c-0.792,2.237-2.231,4.166-4.087,5.571 c0.001-0.001,0.002-0.001,0.003-0.002l6.19,5.238C36.971,39.205,44,34,44,24C44,22.659,43.862,21.35,43.611,20.083z">
                            </path>
                        </svg>
						<span>Log in with Google</span>
					</div>
				</div>
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