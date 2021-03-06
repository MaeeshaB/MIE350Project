<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.mie.model.*" import="com.mie.dao.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	session = request.getSession();
	System.out.println(session);
	if (session.getAttribute("username") == null) {
		session.setAttribute("showFavBtn", "display:none");
	} else {
		session.setAttribute("showFavBtn", "display:block");
	}
%>

<html lang="en">
<head>
<link rel='icon' href='img/favicon.ico' type='image/x-icon'/ >
<title>Product Description</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Date Picker Javascript -->
<!-- https://jqueryui.com/datepicker/ -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="css/mystyle.css">

<style>
.prod-img {
	object-fit: contain;
	max-height: 250px;
}

body {
	min-height: 100vh;
	display: flex;
	flex-direction: column;
}
</style>
</head>
<body>

	<%@ include file="navbar.jsp"%>


	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2"></div>

			<div class="col-sm-8 text-left">
				<br>
				<ol class="breadcrumb" style="text-transform: capitalize">
					<li class="breadcrumb-item"><a href="search.jsp">Search</a></li>
					<li class="breadcrumb-item"><a
						href="FilterController?action=filter_category&category=${selectedProduct.getProductCategory()}">${selectedProduct.getProductCategory()}</a></li>
					<li class="breadcrumb-item active">${selectedProduct.getProductName()}</li>
				</ol>
				<div class="card mb-4">
					<h3 class="card-header">${selectedProduct.getProductName()}</h3>
					<div class="card-body">
						<h5 class="card-title">$${selectedProduct.getProductPriceString()}</h5>
						<div id="favouriteBtn button-add" style="${showFavBtn}">
							<a
								href="MyWorkspaceController?location=search&action=${wsItems.addOrDelete(products.get(j).getProductid())}&prodid=${products.get(j).getProductid()}&userid=${username}">${wsItems.ProductSaved(products.get(j).getProductid())}</a>
						</div>
					</div>
					<img class="card-img-top prod-img"
						src="img/${selectedProduct.getProductImage()}">

					<div class="card-body">
						<p class="card-text">${selectedProduct.getProductDesc()}</p>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">
							<p class="card-text">
								<strong>Product Details</strong> <br> <br> <em>Supplier
									or Brand:</em>
							<div style="text-transform: capitalize">
								<p>${selectedProduct.getProductBrand()}
									${selectedProduct.getProductSupplier()}</p>
								<br>
								<p>
									<em>Who would this product likely be most useful for?<br></em>
									${selectedProduct.getProductPersona()}
								</p>
								<p>
									<em> Product Type:</em> ${selectedProduct.getProductType()} <br>
								</p>
								<br> <br>
								<p>
									<em>Specialty:</em><br>
									${selectedProduct.getProductCategory()}<br>
								</p>

							</div>
							
							<p>
								<em>Get the Product from
									${selectedProduct.getProductBrand()}
									${selectedProduct.getProductSupplier()} <a target="_blank"
									href="${selectedProduct.getProductLink()}">here</a> If the link
									does not work, please use the one below: <br>
									${selectedProduct.getProductLink()}
								</em>
							</p>

							</p>
						</li>
					</ul>

				</div>

			</div>
			<%@ include file="footer.jsp"%>
		</div>

	</div>


</body>

</html>

