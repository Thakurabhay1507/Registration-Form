<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<meta charset="ISO-8859-1">
<title>Registration Form</title>
</head>
<body
	style="background: url(https://images.unsplash.com/photo-1524439188326-e47322d1cef2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;ixlib=rb-1.2.1&amp;auto=format&amp;fit=crop&amp;w=1950&amp;q=80); background-size: cover; background-attachment: fixed;">
	<div class="container">
		<div class="row">
			<div class="col m6 offset-m3">
				<div class="card">
					<div class="card-content">
						<h3 Style="text-align: center;">Signup</h3>
						<h5 id="success" Style="text-align: center;"></h5>
						<div class="row">
							<form action="Login" method="post" class="col s12" id="form">
								<div class="row">
									<div class="input-field col s6">
										<input id="first_name" name="first_name" type="text"
											class="validate"> <label for="first_name">First
											Name</label>
									</div>
									<div class="input-field col s6">
										<input id="last_name" type="text" name="last_name"
											class="validate"> <label for="last_name">Last
											Name</label>
									</div>
								</div>
								<div class="row">
									<div class="input-field col s12">
										<input id="password" type="password" name="password"
											class="validate"> <label for="password">Password</label>
									</div>
								</div>
								<div class="row">
									<div class="input-field col s12">
										<input id="email" type="email" name="email" class="validate">
										<label for="email">Email</label>
									</div>
								</div>
								<div class="file-field input-field">
									<div class="btn">
										<span>File</span> <input name="file" type="file">
									</div>
									<div class="file-path-wrapper">
										<input class="file-path validate" type="text">
									</div>
								</div>

								<button type="submit" class="btn">Submit</button>
							</form>
							<div class="progress" style="margin-top: 10px; display: none;">
								<div class="indeterminate"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
			$("form").on('submit', function(event) {
				event.preventDefault();
				//var f =$(this).serialize();it is used to serialize the data when no fileinput is there
				let f=new FormData(this);
				console.log(f);
				$(".progress").show();
				$("#form").hide();

				$.ajax({
					url : "Login",
					data : f,
					type : "POST",
					success : function(data, textStatus, jqXHR) {
						console.log(data);
						console.log("success");
						$(".progress").hide();
						$("#form").show();
						if (data.trim() === 'Done') {
							$("#success").html("Successfully Registered!");
							$("#success").addClass('green-text');
						} else {
							$("#success").html("Please try again!");
							$("#success").addClass('red-text');
						}

					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(data);
						console.log("failed");
						$(".progress").hide();
						$("#form").show();
						$(".success").show();

					},
					processData: false,
					contentType: false
				})
			})
		})
	</script>
</body>
</html>