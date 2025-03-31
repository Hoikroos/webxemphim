<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!doctype html>
<html lang="en">

<head>
<title>User Manage</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="icon" href="/ASSJAVA4_PD10303/image/software-engineer.png">
</head>

<body>
	<div class="container-fluid">
		<nav class="navbar navbar-expand-lg bg-warning border navbar-warning">
			<div class="container">
				<a class="navbar-brand text-danger fw-bolder" href="#">ADMINISTRATION
					TOOLS</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav ms-auto">
						<li class="nav-item"><a class="nav-link active text-primary"
							aria-current="page" href="/ASSJAVA4_PD10303/indexServlet"><i
								class="fa-solid fa-house"></i> HOME</a></li>
						<li class="nav-item"><a class="nav-link text-primary"
							href="/ASSJAVA4_PD10303/video"><i
								class="fa-solid fa-photo-film"></i> VIDEOS</a></li>
						<li class="nav-item"><a class="nav-link text-primary"
							href="/ASSJAVA4_PD10303/user"><i class="fa-regular fa-user"></i>
								USERS</a></li>
						<li class="nav-item"><a class="nav-link text-primary"
							href="/ASSJAVA4_PD10303/category"><i class="fa-solid fa-list"></i>
								CATEGORY</a></li>
						<li class="nav-item"><a class="nav-link text-primary"
							href="/ASSJAVA4_PD10303/report"><i
								class="fa-solid fa-square-poll-horizontal"></i> REPORTS</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="container mt-3">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
						data-bs-target="#home" type="button" role="tab"
						aria-controls="home" aria-selected="true">CATEGORY
						EDITION</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
						data-bs-target="#profile" type="button" role="tab"
						aria-controls="profile" aria-selected="false">CATEGORY
						LIST</button>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home" role="tabpanel"
					aria-labelledby="home-tab">
					<c:url var="url" value="/category" />
					<c:if test="${not empty successMessage}">
						<div class="alert alert-success" id="successMessage">${successMessage}</div>
					</c:if>
					<c:if test="${not empty errorMessage}">
						<div class="alert alert-danger">${errorMessage}</div>
					</c:if>
					<c:if test="${not empty infoMessage}">
						<div class="alert alert-info">${infoMessage}</div>
					</c:if>

					<form method="post">
						<div class="container mt-3 border border-danger">
							<div class="row">
								<div class="col-6 mt-2">
									<div class="mb-3">
										<label for="username" class="form-label">ID</label> <input
											type="text" class="form-control" id="id" name="id"
											placeholder="Vui lòng nhập id" value="${cate.id}">
									</div>
								</div>
								<div class="col-6 mt-2">
									<div class="mb-3">
										<label for="text" class="form-label">Name</label> <input
											type="text" class="form-control" name="name" id="name"
											placeholder="Vui lòng nhập name" value="${cate.name}">
									</div>
								</div>
								<div class="col-6 mt-2">
									<div class="mb-3">
										<label for="fullname" class="form-label">Description</label> <input
											type="text" class="form-control" name="description"
											id="description" placeholder="Vui lòng nhập description"
											value="${cate.description}">
									</div>
								</div>
							</div>
							<hr>
							<div class="text-end ms-3 mb-2">
								<button id="create-btn" type="submit" class="btn btn-primary"
									formaction="${url}/create">Create</button>
								<button id="update-btn" type="submit" class="btn btn-success"
									formaction="${url}/update">Update</button>
								<button id="delete-btn" type="submit" class="btn btn-danger"
									formaction="${url}/delete"
									onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này không?')">Delete</button>
								<button id="resets-btn" type="submit" class="btn btn-secondary"
									formaction="${url}/reset">Reset</button>

							</div>
						</div>
					</form>
					<c:if test="${cate == null}">
						<div class="alert alert-warning mt-3">Chưa chọn người dùng
							để chỉnh sửa.</div>
					</c:if>
				</div>

				<div class="tab-pane fade" id="profile" role="tabpanel"
					aria-labelledby="profile-tab">
					<table class="table table-bordered table-primary">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Name</th>
								<th scope="col">Description</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="c" items="${cates}">
								<tr>
									<td>${c.id}</td>
									<td>${c.name}</td>
									<td>${c.description}</td>
									<td><a href="${url}/edit/${c.id}" class="btn btn-info">Edit</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap JavaScript Libraries -->

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