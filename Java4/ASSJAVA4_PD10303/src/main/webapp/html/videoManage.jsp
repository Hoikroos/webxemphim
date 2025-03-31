<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!doctype html>
<html lang="en">

<head>
<title>Video Manage</title>
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
							aria-current="page" href="/ASSJAVA4_PD10303/indexServlet"> <i
								class="fa-solid fa-house"></i> HOME
						</a></li>
						<li class="nav-item"><a class="nav-link text-primary"
							href="/ASSJAVA4_PD10303/video"> <i
								class="fa-solid fa-photo-film"></i> VIDEOS
						</a></li>
						<li class="nav-item"><a class="nav-link text-primary"
							href="/ASSJAVA4_PD10303/user"> <i class="fa-regular fa-user"></i>
								USERS
						</a></li>
						<li class="nav-item"><a class="nav-link text-primary"
							href="/ASSJAVA4_PD10303/category"><i class="fa-solid fa-list"></i>
								CATEGORY</a></li>
						<li class="nav-item"><a class="nav-link text-primary"
							href="/ASSJAVA4_PD10303/report"> <i
								class="fa-solid fa-square-poll-horizontal"></i> REPORTS
						</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="container mt-3">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
						data-bs-target="#home" type="button" role="tab"
						aria-controls="home" aria-selected="true">VIDEO EDITION</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
						data-bs-target="#profile" type="button" role="tab"
						aria-controls="profile" aria-selected="false">VIDEO LIST
					</button>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home" role="tabpanel"
					aria-labelledby="home-tab">
					<div class="container mt-3 border border-danger">
						<c:url var="url" value="/video" />
						<form method="post" enctype="multipart/form-data">
							<div class="row">
								<div class="container mt-5 d-flex">
									<div class="left-section text-center"
										style="flex: 1; margin-right: 20px;">
										<div class="form-group">
											<input type="file" class="form-control-file d-none"
												id="poster" name="poster" accept="image/*"
												onchange="previewImage(event)" />
										</div>
										<div id="imageContainer" onclick="triggerFileInput()"
											style="cursor: pointer; border: 1px solid #ddd; width: 750px; height: 500px; display: flex; align-items: center; justify-content: center; border-radius: 5px;">
											<img id="currentImage" src="/default-placeholder.png"
												alt="Thêm ảnh/video"
												style="width: 750px; height: 500px; display: none;" /> <span
												id="placeholderText"
												style="text-align: center; font-size: 16px;"> Thêm
												ảnh<br />hoặc kéo và thả
											</span>
										</div>
									</div>

									<div class="right-section" style="flex: 2;">
										<div class="form-group p-2">
											<label for="youtubeId">YouTube ID:</label> <input type="text"
												class="form-control border border-warning" id="youtubeId"
												name="id" value="${video.id}" />
										</div>
										<div class="form-group p-2">
											<label for="videoFile">Upload Video:</label> <input
												type="file" class="form-control border border-warning"
												id="videoFile" name="videoFile" accept="video/*" />
										</div>
										<div class="form-group p-2">
											<label for="videoTitle">Video Title:</label> <input
												type="text" class="form-control border border-warning"
												id="videoTitle" name="title" value="${video.title}" />
										</div>
										<div class="form-group p-2">
											<label for="viewCount">View Count:</label> <input
												type="number" class="form-control border border-warning"
												id="viewCount" name="views" value="${video.views}" />
										</div>
										<div class="form-group p-2">
											<label for="nationals1">Nationals:</label> <input type="text"
												class="form-control border border-warning" id="nationals1"
												name="nationals" value="${video.nationals}" />
										</div>
										<div class="form-group p-2">
											<label for="years1">Year:</label> <input type="text"
												class="form-control border border-warning" id="years1"
												name="years" value="${video.years}" />
										</div>
										<div class="form-group p-2">
											<label for="director1">Director:</label> <input type="text"
												class="form-control border border-warning" id="director1"
												name="director" value="${video.director}" />
										</div>
										<div class="form-group p-2">
											<label for="performer1">Performer:</label> <input type="text"
												class="form-control border border-warning" id="performer1"
												name="performer" value="${video.performer}" />
										</div>
										<div class="form-group p-2">
											<label>Status:</label><br />
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="active"
													id="active" value="true" ${video.active ? 'checked' : ''} />
												<label class="form-check-label" for="active">Active</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="active"
													id="inactive" value="false"
													${!video.active ? 'checked' : ''} /> <label
													class="form-check-label" for="inactive">Inactive</label>
											</div>
										</div>
										<div class="form-group p-2">
											<label for="category">Category:</label> <select
												class="form-select border border-warning" id="category"
												name="categoryId">
												<c:forEach var="category" items="${categories}">
													<option value="${category.id}"
														${category.id == video.category.id ? 'selected' : ''}>${category.name}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group p-2">
											<label for="description">Description:</label>
											<textarea class="form-control border border-warning"
												id="description" name="description" rows="3">${video.description}</textarea>
										</div>
									</div>
								</div>
							</div>
							<hr />
							<div class="text-end mb-2">
								<button type="submit" class="btn btn-primary"
									formaction="${url}/create">Create</button>
								<button type="submit" class="btn btn-success"
									formaction="${url}/update">Update</button>
								<button type="submit" class="btn btn-danger"
									formaction="${url}/delete"
									onclick="return confirm('Bạn có chắc chắn muốn xóa video này không?')">
									Delete</button>
								<button type="submit" class="btn btn-warning"
									formaction="${url}/reset">Reset</button>
							</div>
						</form>

					</div>
				</div>
				<div class="tab-pane fade" id="profile" role="tabpanel"
					aria-labelledby="profile-tab">
					<table class="table table-bordered table-primary">
						<thead>
							<tr>
								<th scope="col">Video ID</th>
								<th scope="col">Video</th>
								<th scope="col">Video Title</th>
								<th scope="col">View Count</th>
								<th scope="col">Poster</th>
								<th scope="col">Status</th>
								<th scope="col">National</th>
								<th scope="col">Director</th>
								<th scope="col">Performer</th>
								<th scope="col">Category</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty videos}">
									<c:forEach var="v" items="${videos}">
										<tr>
											<td>${v.id}</td>
											<td>${v.videoFile}</td>
											<td>${v.title}</td>
											<td>${v.views}</td>
											<td><img
												src="${pageContext.request.contextPath}/${v.poster}"
												alt="Poster" width="100"></td>
											<td>${v.active ? 'Active' : 'Inactive'}</td>
											<td>${v.nationals}</td>
											<td>${v.director}</td>
											<td>${v.performer}</td>
											<td>${v.category.name}</td>
											<td><a
												href="${pageContext.request.contextPath}/video/edit/${v.id}"
												class="btn btn-info">Edit</a></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="11" class="text-center">No videos available</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<script>
			function triggerFileInput() {
				document.getElementById("poster").click();
			}

			function previewImage(event) {
				const file = event.target.files[0];
				const image = document.getElementById("currentImage");
				const placeholderText = document
						.getElementById("placeholderText");

				if (file) {
					const reader = new FileReader();

					reader.onload = function(e) {
						image.src = e.target.result;
						image.style.display = "block";
						placeholderText.style.display = "none";
					};

					reader.readAsDataURL(file);
				}
			}
		</script>
		<!-- Bootstrap JS -->
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
