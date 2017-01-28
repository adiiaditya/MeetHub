
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.User, com.AutoComplete, com.MySqlDataStoreUtilities, java.io.*, javax.servlet.*,
javax.servlet.http.*, java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="hide-sidebar ls-bottom-footer" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Upload File</title>

<!-- Vendor CSS BUNDLE
    Includes styling for all of the 3rd party libraries used with this module, such as Bootstrap, Font Awesome and others.
    TIP: Using bundles will improve performance by reducing the number of network requests the client needs to make when loading the page. -->
<link href="css/stylesheet.css" rel="stylesheet">
<link href="css/vendor/all.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">


<!-- APP CSS BUNDLE [css/app/app.css]
INCLUDES:
    - The APP CSS CORE styling required by the "social-3" module, also available with main.css - see below;
    - The APP CSS STANDALONE modules required by the "social-3" module;
NOTE:
    - This bundle may NOT include ALL of the available APP CSS STANDALONE modules;
      It was optimised to load only what is actually used by the "social-3" module;
      Other APP CSS STANDALONE modules may be available in addition to what's included with this bundle.
      See src/less/themes/social-3/app.less
TIP:
    - Using bundles will improve performance by greatly reducing the number of network requests the client needs to make when loading the page. -->
<link href="css/app/app.css" rel="stylesheet">
<script type="text/javascript">
	function validate() {

		var a = document.getElementById("inputFile");

		var valid = false;

		if (a.value.endsWith("jpeg") || a.value.endsWith("PNG")
				|| a.value.endsWith("JPEG") || a.value.endsWith("JPG")
				|| a.value.endsWith("jpg") || a.value.endsWith("png")) {
			valid = true;
		} else {
			alert("You can upload only .JPG or .PNG as Cover picture");
			valid = false;
		}
		return valid;
	};
</script>
</head>
<body>

	<div class='st-container'>
		<!-- Fixed navbar -->
		<div class='st-pusher' id='content'>
			<!-- this is the wrapper for the content -->
			<div class='st-content'>
				<!-- extra div for emulating position:fixed of the menu -->
				<div class='st-content-inner'>
					<div class='container'>

						<div class="navbar navbar-main navbar-primary navbar-fixed-top"
							role="navigation">
							<div class="container">
								<div class="navbar-header">
									<strong><a class="navbar-brand" href="index.html">MeetHub</a></strong>
								</div>

							</div>
						</div>


						</p>

					</div>
				</div>
			</div>
		</div>
	</div>



	<div class="site-wrapper">
		<div class="site-wrapper-inner">
			<div class="cover-container">


				<div class="inner cover">
					<h1 class="cover-heading">Upload Cover Photo!</h1>
					</br>

					<form action="UploadCoverPhotoServlet" id='uploadcoverphoto'
						onsubmit="return validate();" method="post"
						enctype="multipart/form-data">
						<input required type="file" class="form-control" name="file"
							size="50" id="inputFile" /> <br /> <br />

						<p class="lead">
							<button class="btn btn-primary">
								Upload <i class="fa fa-fw fa-share-square-o"></i>
							</button>
						</p>
					</form>
				</div>

			</div>
		</div>
	</div>


	<!-- Footer -->
	<footer class="footer"> <strong>MeetHub</strong> v1.0.0 &copy;
	Copyright 2016 </footer>
	<!--  Footer -->
</body>
</html>