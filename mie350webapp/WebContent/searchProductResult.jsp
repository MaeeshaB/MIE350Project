<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.mie.model.*"%>
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
<title>Search Results</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="css/bootstrap.min.css">
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

<script type="text/javascript" src="js/pagination.js"></script>  

<link rel="stylesheet" type="text/css" href="css/mystyle.css">

<style>
.margins{
	margin-left: 30px;
	margin-right: 30px;
}

.button-margins{
	margin-left:15px;
}
body{
	min-height: 100vh;
	display: flex;
	flex-direction: column;
}

.column-footer {
	float: left;
	width: 50%;
	padding-left: 10px;
	padding-right: 10px;
}
</style>

</head>
<body>

	<%@ include file="navbar.jsp"%>

	<div class="container-fluid text-center">
		
		<div class="row content">
			
			<div class="col-sm-2 sidenav">
				<br></br><b>
				Products</b><br/>
				<br>
				
				<div class="center-align">
				Ergonomic Items
				<div class="list-group w-75 margins" >
				  <a href="FilterController?action=filter&type=desk" class="list-group-item list-group-item-action">
				  	Desks</a>
				  <a href="FilterController?action=filter&type=chair" class="list-group-item list-group-item-action">Chairs</a>
				  <a href="FilterController?action=filter&type=lighting" class="list-group-item list-group-item-action">Lighting</a>
				  <a href="FilterController?action=filter&type=keyboard" class="list-group-item list-group-item-action">Keyboard</a>
				  <a href="FilterController?action=filter&type=monitor" class="list-group-item list-group-item-action">Monitor & Screens</a>
				  <a href="FilterController?action=filter&type=mouse" class="list-group-item list-group-item-action">Mouse</a>
				</div>
				</div>
				<br></br>
				<div class="center-align">
				Productivity Tools
				<div class="list-group center-align margins w-75" >
				  <a href="FilterController?action=filter&type=hardware" class="list-group-item list-group-item-action">
				  	Hardware</a>
				  <a href="FilterController?action=filter&type=software" class="list-group-item list-group-item-action">Software</a>
				  </div>
				</div>
				<br></br>
				<a class="btn btn-outline-secondary" href="SearchController">All
						Products</a>
			</div>
				
			<div class="col-sm-8 text-left">
				<br></br> 
				<h1>
				<svg width="52" height="104" viewBox="0 0 52 104" fill="none" xmlns="http://www.w3.org/2000/svg">
					<path d="M25.5599 103.61C27.6199 103.67 29.6799 103.6 31.7399 103.52C37.4899 103.31 43.2299 103.1 48.9799 102.89C49.8699 102.86 51.0299 102.6 51.0999 101.74C51.1599 100.97 50.2599 100.49 49.4899 100.27C46.7499 99.49 43.8599 99.36 40.9999 99.27C36.7999 99.12 32.59 99.01 28.39 98.94C25.76 98.89 23.0699 98.87 20.6099 99.76C19.2699 100.24 17.2799 102.24 19.3999 103.17C19.9899 103.43 21.1799 103.29 21.8099 103.35C23.0599 103.47 24.3099 103.57 25.5599 103.61Z" fill="url(#paint0_linear)"/>
					<path d="M25.5599 103.61C27.6199 103.67 29.6799 103.6 31.7399 103.52C37.4899 103.31 43.2299 103.1 48.9799 102.89C49.8699 102.86 51.0299 102.6 51.0999 101.74C51.1599 100.97 50.2599 100.49 49.4899 100.27C46.7499 99.49 43.8599 99.36 40.9999 99.27C36.7999 99.12 32.59 99.01 28.39 98.94C25.76 98.89 23.0699 98.87 20.6099 99.76C19.2699 100.24 17.2799 102.24 19.3999 103.17C19.9899 103.43 21.1799 103.29 21.8099 103.35C23.0599 103.47 24.3099 103.57 25.5599 103.61Z" fill="url(#paint1_linear)"/>
					<path d="M5.88 27.22C5.68 26.71 5.48001 26.21 5.29001 25.7C5.21001 25.49 5.11001 25.26 4.92001 25.13C4.80001 25.05 4.63999 25.01 4.54999 24.9C4.44999 24.78 4.46 24.61 4.44 24.45C4.41 24.01 4.18999 23.59 3.89999 23.26C3.53999 22.85 2.97001 22.55 2.45001 22.7C2.16001 22.79 1.92 23 1.72 23.23C1.15 23.88 0.769987 24.8 1.04999 25.63C1.19999 26.07 1.51 26.43 1.81 26.79C2.12 27.17 2.41 27.56 2.69 27.96C2.83 28.16 2.96 28.36 3.09 28.56C3.17 28.69 3.31999 29.08 3.45999 29.15C3.70999 29.28 4.41999 28.89 4.64999 28.78C5.01999 28.59 5.36001 28.35 5.67001 28.06C5.82001 27.92 5.97001 27.74 5.98001 27.53C5.97001 27.44 5.92 27.33 5.88 27.22Z" fill="#F9E9DE"/>
					<path d="M42.7199 31.43C44.0099 34.39 45.1999 37.4 46.1799 40.47C46.6499 41.94 47.0699 43.47 46.9099 45.01C46.7499 46.54 45.8599 48.1 44.4099 48.62C43.8199 48.84 43.1799 48.87 42.5399 48.86C41.2999 48.85 40.01 48.66 38.98 47.97C37.38 46.91 36.7199 44.89 36.3999 43C35.7999 39.48 35.9499 35.88 35.8699 32.3C35.7999 29.08 35.5199 25.86 35.0599 22.66C34.9299 21.74 35.0599 19.5 36.4399 20.42C37.3799 21.05 38.2399 22.87 38.8399 23.82C40.3499 26.25 41.5799 28.83 42.7199 31.43Z" fill="#65627D"/>
					<path d="M40.99 24.63C41.92 26.36 42.55 28.27 43.84 29.75C44.22 30.18 44.67 30.61 44.76 31.18C44.89 32 44.01 32.81 43.2 32.62C42.29 32.4 41.93 31.34 41.66 30.45C40.79 27.62 39.32 24.97 37.37 22.74C36.17 21.37 36.87 20.68 38.38 21.61C39.52 22.32 40.36 23.47 40.99 24.63Z" fill="#5B5870"/>
					<path d="M45.7699 34.38C45.1799 33.59 44.6799 32.74 44.2499 31.85C44.1399 31.61 43.7399 31.61 43.6199 31.85C43.3899 32.32 43.5799 32.63 43.7999 32.99C43.9199 33.55 44.1399 34.08 44.4399 34.58C44.7199 35.05 45.1999 35.87 45.8699 35.63C46.6299 35.36 46.0399 34.75 45.7699 34.38Z" fill="#5B5870"/>
					<path d="M19.4 66.89C19.09 68.68 18.75 70.49 18.9 72.29C19.01 73.6 19.37 74.87 19.75 76.12C21.56 82.13 23.81 88 26.39 93.71C26.54 94.04 26.71 94.39 27.02 94.59C27.66 94.99 28.55 94.43 28.78 93.71C29.01 92.99 28.79 92.21 28.58 91.48C27.08 86.3 26.02 81 24.96 75.71C24.74 74.59 24.51 73.45 24.53 72.31C24.55 70.98 24.89 69.67 25.25 68.39C26.44 64.07 27.78 59.8 29.25 55.57C29.71 54.26 30.17 52.75 29.5 51.53C28.83 50.31 27.29 49.89 25.9 49.75C25.03 49.66 24.16 49.64 23.29 49.68C21.7 49.76 21.26 50.32 21.22 51.75C21.17 53.46 20.95 55.18 20.77 56.88C20.43 60.23 19.97 63.57 19.4 66.89Z" fill="#F9E9DE"/>
					<path d="M31.66 82.6C31.83 86.77 32 90.94 32.37 95.1C33.1 95.19 33.83 95.28 34.55 95.37C34.81 86.63 35.12 77.87 36.23 69.2C36.8 64.71 37.6 60.24 38.03 55.74C38.2 54 38.2 51.97 36.87 50.83C36.29 50.33 35.52 50.08 34.75 50C33.34 49.84 30.69 50.41 30.34 52.1C30.16 52.96 30.5 54.27 30.53 55.16C30.58 56.41 30.63 57.66 30.68 58.92C30.89 63.96 31.09 69.01 31.3 74.05C31.43 76.9 31.55 79.75 31.66 82.6Z" fill="#F9E9DE"/>
					<path d="M32.62 101.84C33.36 101.87 34.0801 101.69 34.7901 101.49C34.9601 101.44 35.15 101.38 35.24 101.22C35.3 101.12 35.3 101 35.3 100.88C35.3 100.73 35.31 100.57 35.31 100.42C35.31 100.38 35.31 100.33 35.28 100.29C35.24 100.24 35.16 100.25 35.09 100.27C33.98 100.55 32.82 100.63 31.68 100.5C31.42 100.47 31.1601 100.43 30.9501 100.27C30.9101 100.24 30.86 100.2 30.81 100.22C30.77 100.23 30.75 100.28 30.74 100.32C30.68 100.51 30.56 100.85 30.65 101.04C30.73 101.22 31.0401 101.38 31.2001 101.47C31.6401 101.71 32.14 101.83 32.62 101.84Z" fill="#F7F7F7"/>
					<path d="M31.8399 94.25C31.7499 93.92 31.6799 93.52 31.9299 93.3C32.0799 93.17 32.2899 93.15 32.4899 93.15C33.1199 93.14 33.7399 93.22 34.3499 93.38C34.4399 93.41 34.5399 93.44 34.5999 93.51C34.6699 93.59 34.6799 93.71 34.6899 93.82C34.7299 94.56 34.6899 95.3 34.5599 96.03C34.5399 96.13 34.5199 96.24 34.4599 96.33C34.3399 96.51 34.1 96.56 33.89 96.59C33.38 96.66 32.7799 96.82 32.4399 96.38C32.0799 95.9 31.9999 94.82 31.8399 94.25Z" fill="#EBEBEB"/>
					<path d="M31.41 98.22C31.64 97.96 31.93 97.76 32.23 97.59C32.6 97.37 33 97.18 33.42 97.17C34.02 97.16 34.58 97.55 34.91 98.06C35.23 98.57 35.36 99.18 35.4 99.78C35.42 100 35.42 100.24 35.31 100.43C35.16 100.7 34.83 100.83 34.53 100.9C33.35 101.18 32.08 101.06 30.97 100.56C30.2 100.22 31.01 98.67 31.41 98.22Z" fill="#EBEBEB"/>
					<path d="M34.8501 95.44C35.0301 95.72 35.06 96.06 35.08 96.39C35.16 97.61 35.24 98.83 35.31 100.04C35.31 100.09 35.3201 100.14 35.2901 100.18C35.2501 100.23 35.1701 100.24 35.1001 100.24C34.0401 100.21 32.9801 100.17 31.9201 100.1C31.6401 100.08 31.29 100.03 31.19 99.76C31.12 99.59 31.19 99.4 31.24 99.22C31.53 98.31 31.61 97.35 31.91 96.44C32.04 96.05 32.22 95.66 32.53 95.39C33.03 94.99 34.4401 94.82 34.8501 95.44Z" fill="#EBEBEB"/>
					<path d="M23.73 100.26C23.91 100.44 24.14 100.58 24.39 100.6C24.56 100.61 24.73 100.56 24.9 100.52C25.42 100.37 25.94 100.23 26.44 100.04C27.94 99.47 29.26 98.52 30.53 97.54C30.62 97.47 30.7 97.41 30.76 97.31C30.94 97.04 30.83 96.69 30.72 96.38C30.69 96.3 30.65 96.22 30.58 96.18C30.5 96.14 30.4 96.18 30.32 96.22C29.91 96.43 29.59 96.76 29.24 97.06C27.82 98.26 26 98.87 24.23 99.45C24.07 99.5 23.51 99.56 23.42 99.67C23.29 99.81 23.61 100.14 23.73 100.26Z" fill="#F7F7F7"/>
					<path d="M26.89 94.96C26.49 94.4 26.11 93.82 25.76 93.23C25.73 93.17 25.69 93.11 25.71 93.05C25.72 93 25.77 92.96 25.81 92.93C26.24 92.63 26.69 92.32 27.22 92.28C27.39 92.27 27.57 92.29 27.71 92.4C27.84 92.5 27.9 92.67 27.95 92.82C28.14 93.34 28.32 93.87 28.36 94.42C28.37 94.59 28.36 94.79 28.24 94.91C28.19 94.96 28.13 94.99 28.07 95.02C27.88 95.11 27.55 95.35 27.34 95.36C27.07 95.36 27.06 95.19 26.89 94.96Z" fill="#EBEBEB"/>
					<path d="M28.7699 93.05C28.8199 92.99 28.8699 92.92 28.9399 92.89C29.0799 92.83 29.2499 92.92 29.3399 93.04C29.4299 93.17 29.4599 93.32 29.4999 93.47C29.6599 94 30.0199 94.44 30.2999 94.92C30.5799 95.4 30.7899 95.98 30.6099 96.5C30.4299 97.02 29.9199 97.33 29.4399 97.6C28.7299 98.01 28.0299 98.41 27.3199 98.82C26.7099 99.17 26.0999 99.52 25.4299 99.75C24.9799 99.91 24.4999 100.01 24.0299 99.95C23.5599 99.89 23.0899 99.65 22.8399 99.25C22.5799 98.84 22.5599 98.33 22.5999 97.85C22.6399 97.39 22.7199 96.92 23.0099 96.56C23.3499 96.13 23.9199 95.94 24.4699 95.89C25.0199 95.84 25.5699 95.91 26.1299 95.89C26.2599 95.88 26.3899 95.87 26.4999 95.81C26.6099 95.75 26.6899 95.65 26.7599 95.55C27.3899 94.75 28.3099 93.97 28.7699 93.05Z" fill="#EBEBEB"/>
					<path d="M34.17 97.79C33.78 97.78 33.44 97.57 33.05 97.59C32.75 97.61 32.44 97.7 32.2 97.89C32.14 97.94 32.21 98.05 32.28 98.03C32.87 97.8 33.53 97.56 34.05 98.08C34.27 98.31 34.49 97.8 34.17 97.79Z" fill="#B2B2B2"/>
					<path d="M34.17 97.11C33.61 96.82 32.96 96.73 32.41 97.09C32.3 97.16 32.39 97.33 32.52 97.27C33.02 97.02 33.59 97 34.09 97.26C34.18 97.31 34.27 97.16 34.17 97.11Z" fill="#B2B2B2"/>
					<path d="M34.34 96.08C33.74 95.82 33.09 95.85 32.55 96.24C32.47 96.3 32.54 96.41 32.62 96.37C33.13 96.11 33.72 96.05 34.26 96.26C34.37 96.29 34.44 96.12 34.34 96.08Z" fill="#B2B2B2"/>
					<path d="M25.64 95.86C25.55 95.79 25.46 95.94 25.55 96.01C25.93 96.3 26.02 96.82 26.28 97.19C26.35 97.29 26.48 97.22 26.46 97.11C26.38 96.58 26.05 96.18 25.64 95.86Z" fill="#B2B2B2"/>
					<path d="M26.34 95.71C26.29 95.7 26.23 95.77 26.28 95.81C26.56 96.04 26.8101 96.4 26.9501 96.74C27.0001 96.87 27.2 96.82 27.16 96.68C27.02 96.27 26.82 95.79 26.34 95.71Z" fill="#B2B2B2"/>
					<path d="M28.19 95.61C27.8 95.3 27.32 95.21 26.86 95.41C26.77 95.45 26.82 95.59 26.91 95.59C27.3 95.59 27.64 95.69 27.97 95.9C28.14 96 28.35 95.74 28.19 95.61Z" fill="#B2B2B2"/>
					<path d="M30.6599 49.71C29.8799 48.43 28.4 47.69 26.92 47.46C25.44 47.23 23.9199 47.45 22.4399 47.72C21.6899 47.85 20.6199 48.07 20.2799 48.86C20.0099 49.48 20.2099 50.46 20.1499 51.12C19.9299 53.37 19.3199 55.55 18.7899 57.74C18.4799 59 18.1899 60.26 18.0099 61.54C17.7099 63.59 17.6899 65.68 17.6899 67.75C17.6899 71.69 17.8099 75.72 19.1799 79.42C20.2299 82.25 21.9599 84.75 23.7199 87.21C23.0899 87.57 22.8999 87.94 23.4899 88.67C23.6799 88.9 23.9699 89.1 24.3299 89.13C24.5899 89.15 24.8499 89.09 25.0999 89.02C26.2999 88.7 27.4499 88.27 28.5399 87.74C28.6799 87.67 28.8299 87.59 28.8699 87.47C28.8999 87.39 28.8699 87.31 28.8499 87.23C28.7199 86.85 28.4999 86.49 28.2099 86.18C28.1699 86.13 28.1199 86.08 28.0499 86.06C27.9699 86.03 27.8799 86.04 27.7899 86.04C27.6599 86.05 27.5399 86.07 27.4099 86.09C26.8599 81.92 26.3099 77.74 25.7599 73.57C25.6599 72.83 25.5699 72.09 25.5799 71.35C25.6199 69.82 26.1399 68.36 26.6499 66.92C27.8899 63.46 29.1199 59.99 30.3599 56.53C30.7599 55.42 31.1499 54.3 31.2899 53.13C31.4099 51.95 31.2699 50.71 30.6599 49.71Z" fill="#736357"/>
					<path d="M38.25 62.51C38.92 58.2 39.6 53.86 39.42 49.51C39.41 49.25 39.39 48.98 39.31 48.73C39.2 48.41 38.98 48.13 38.72 47.91C38.05 47.35 37.13 47.16 36.26 47.22C35.39 47.28 34.55 47.56 33.72 47.84C32.74 48.17 31.77 48.49 30.79 48.82C30.12 49.05 28.91 49.19 28.38 49.69C27.51 50.51 28.26 52.73 28.3 53.78C28.45 57.59 27.88 61.42 28.33 65.22C28.64 67.83 29.42 70.37 29.72 72.99C29.85 74.06 29.89 75.15 29.99 76.22C30.06 77 30.17 77.77 30.27 78.54C30.55 80.58 30.82 82.62 31.1 84.65C30.88 84.67 30.8 84.76 30.78 85.09C30.76 85.46 30.78 85.93 31.12 86.09C31.23 86.14 31.35 86.15 31.47 86.16C32.37 86.22 33.27 86.29 34.17 86.35C34.45 86.37 34.74 86.39 35.02 86.38C35.1 86.38 35.18 86.37 35.24 86.33C35.31 86.28 35.34 86.18 35.36 86.09C35.44 85.71 35.43 85.32 35.33 84.95C35.31 84.88 35.29 84.81 35.23 84.76C35.2 84.73 35.16 84.72 35.12 84.71C35.27 84.41 35.33 84.04 35.37 83.69C36.05 76.6 37.15 69.55 38.25 62.51Z" fill="#736357"/>
					<path d="M25.39 20.69C25.07 20.06 24.46 19.48 23.76 19.54C23.06 19.6 22.58 20.23 22.19 20.82C19.47 24.95 17.09 29.42 13.41 32.72C13.23 32.88 13.02 33.05 12.78 33.08C12.55 33.1 12.33 32.99 12.12 32.89C9.29 31.41 7.04002 29.2 5.04002 26.71C5.13002 26.82 3.32002 28.43 3.29002 28.64C3.23002 29.08 3.84 29.7 4.09 30.02C4.83 31.02 5.67001 31.94 6.56001 32.81C8.36001 34.56 10.37 36.08 12.38 37.58C13.07 38.1 13.92 38.65 14.75 38.38C15.1 38.26 15.38 38.01 15.66 37.76C18.96 34.75 21.82 31.26 24.15 27.45C24.77 26.43 25.37 25.36 25.67 24.2C25.95 23.04 25.94 21.76 25.39 20.69Z" fill="#F9E9DE"/>
					<path d="M31.95 19.17C32.96 18.94 34.2199 18.61 34.8599 19.42C35.0599 19.67 35.14 19.98 35.23 20.29C36.18 23.89 36.68 27.59 37.17 31.29C37.78 35.89 38.4 40.5 39.01 45.1C39.18 46.38 39.3099 47.83 38.4999 48.84C37.9899 49.48 37.2 49.81 36.42 50.03C35.24 50.36 34.0099 50.5 32.7799 50.57C28.7399 50.8 24.6699 50.38 20.7699 49.31C20.5599 49.25 20.3499 49.19 20.1899 49.06C19.9099 48.84 19.8099 48.46 19.7499 48.11C19.4699 46.49 19.68 44.83 19.89 43.2C20.5 38.42 21.1099 33.64 21.7199 28.86C21.8899 27.5 22.0699 26.13 22.4599 24.81C22.7599 23.8 23.1899 22.83 23.3799 21.79C23.5599 20.84 23.5299 19.82 23.8499 18.9C24.3499 17.47 24.81 18 25.89 18.51C27.76 19.39 29.93 19.64 31.95 19.17Z" fill="#B4C7BA"/>
					<path d="M26.66 17.61C27.31 17.88 27.93 18.05 28.39 18.06C28.92 18.07 29.42 17.81 29.89 17.55C30.85 17.02 31.87 16.44 32.36 15.46C32.65 14.89 32.72 14.23 32.78 13.59C32.92 11.98 32.99 10.37 32.97 8.75C32.96 7.92 32.92 7.04001 32.47 6.35001C31.7 5.18001 30.1 4.98 28.71 4.9C27.33 4.82 25.87 4.75 24.66 5.4C23.38 6.08 23.68 7.08001 23.58 8.33001C23.46 9.89001 23.38 11.46 23.37 13.03C23.36 13.92 23.39 14.86 23.85 15.62C24.26 16.33 25.49 17.13 26.66 17.61Z" fill="#F9E9DE"/>
					<path d="M32.28 11.53C32.29 11.46 32.29 11.39 32.29 11.32C32.25 11.38 32.24 11.45 32.28 11.53Z" fill="#D7C68E"/>
					<path d="M22.4399 7.53C22.4399 7.73 22.4499 7.94 22.5299 8.12C22.7499 8.58 23.3299 8.59 23.7899 8.56C25.8799 8.4 27.9899 8.45 30.0799 8.69C30.3099 8.72 30.5499 8.75001 30.7499 8.88001C30.9299 9.00001 31.0599 9.19001 31.1799 9.38001C31.6299 10.11 31.9699 10.93 32.1899 11.78C32.2699 11.66 32.3599 11.55 32.4399 11.43C32.6999 11.62 32.6399 12.06 32.5399 12.39C32.3599 13.01 32.1799 13.64 31.9899 14.26C31.7699 15.01 31.5499 15.78 31.5499 16.57C31.5499 17.36 31.7999 18.19 32.3699 18.66C33.3099 17.78 34.2499 16.89 35.1899 16.01C35.9299 15.31 36.7099 14.56 37.0199 13.53C37.2799 12.67 37.1699 11.74 37.3099 10.85C37.4299 10.09 37.72 9.37001 37.7 8.60001C37.68 7.92001 37.41 7.28001 37.14 6.66001C36.28 4.66001 35.2799 2.51001 33.4599 1.60001C32.6699 1.20001 31.79 1.09001 30.92 0.990007C28.66 0.750007 27.12 1.14 25.2 2.37C23.59 3.41 22.4499 5.43 22.4399 7.53Z" fill="#D7C68E"/>
					<path d="M33.69 21.91C33.52 22.3 33.48 22.73 33.45 23.15C33.14 27.03 32.97 30.95 33.54 34.8C33.87 37.03 34.47 39.26 35.66 41.18C36.82 43.05 38.49 44.55 39.59 46.45C39.92 47.03 40.21 47.7 40.04 48.34C39.7 48.62 39.19 48.61 38.79 48.43C38.39 48.25 38.08 47.92 37.8 47.58C36.91 46.5 36.25 45.27 35.59 44.04C34.86 42.69 34.14 41.33 33.53 39.92C31.09 34.28 30.63 27.8 32.25 21.87C32.41 21.27 32.61 20.65 33.06 20.22C33.42 19.88 33.89 19.7 34.36 19.56C34.75 19.44 35.17 19.34 35.57 19.42C35.97 19.5 36.36 19.79 36.43 20.19C36.59 21.13 35.67 20.79 35.19 20.83C34.57 20.88 33.95 21.34 33.69 21.91Z" fill="#5B5870"/>
					<path d="M31.75 18.1C31.7 18.11 31.65 18.12 31.61 18.15C31.57 18.18 31.55 18.24 31.53 18.29C31.39 18.72 31.33 19.18 31.36 19.63C31.36 19.7 31.37 19.77 31.41 19.83C31.46 19.91 31.55 19.94 31.63 19.97C31.88 20.06 32.14 20.11 32.4 20.14C32.57 20.16 32.76 20.15 32.88 20.03C32.97 19.94 33 19.82 33.04 19.69C33.1 19.46 33.15 19.24 33.21 19.01C33.42 18.16 32.43 18 31.75 18.1Z" fill="#333333"/>
					<path d="M30.76 21.72C30.52 22.95 30.27 24.2 30.32 25.45C30.36 26.47 30.59 27.48 30.99 28.42C31.03 28.51 31.07 28.6 31.14 28.67C31.3 28.83 31.58 28.81 31.77 28.68C31.96 28.55 32.08 28.34 32.17 28.14C32.95 26.52 32.97 24.65 32.98 22.85C32.98 22.29 32.99 21.73 32.99 21.17C32.99 20.55 32.62 19.71 31.85 19.82C31.09 19.94 30.88 21.11 30.76 21.72Z" fill="#D7C68E"/>
					<path d="M35.2999 20.97C35.8599 21.04 36.36 21.36 36.78 21.72C38.56 23.28 39.14 25.73 40.01 27.91C40.91 30.16 42.18 32.24 43.2 34.43C43.76 35.64 44.25 36.93 44.14 38.25C44.11 38.64 43.99 39.08 43.64 39.28C43.25 39.51 42.75 39.34 42.37 39.1C41.5 38.54 40.95 37.62 40.43 36.73C39.78 35.6 39.12 34.48 38.47 33.35C38.09 32.71 37.72 32.06 37.34 31.42C36.68 30.28 36.02 29.14 35.35 28C34.77 27.01 34.1899 26 33.7999 24.92C33.2799 23.48 32.7799 20.65 35.2999 20.97Z" fill="#F9E9DE"/>
					<path d="M35.75 30.23C34.78 29.62 33.81 29.01 32.84 28.4C32.6 28.25 32.34 28.09 32.07 28.04C31.07 27.87 30.41 29.17 31.06 29.88C31.49 30.35 32.15 30.75 32.62 31.23C33.26 31.89 33.9 32.55 34.53 33.21C36.34 35.09 38.16 36.96 40.1 38.74C40.92 39.49 41.92 40.29 42.96 40.31C44.11 40.33 44.75 39.29 44.57 38.25C44.38 37.21 43.58 36.21 42.71 35.34C40.7 33.34 38.21 31.77 35.75 30.23Z" fill="#F9E9DE"/>
					<path d="M33.9801 28.59C33.9401 28.22 33.7101 27.88 33.4001 27.66C33.1001 27.44 32.7301 27.33 32.3501 27.27C31.9701 27.21 31.5601 27.22 31.2501 27.45C30.9001 27.7 30.7801 28.16 30.7101 28.59C30.6101 29.2 30.55 29.82 30.55 30.45C30.55 30.61 30.5501 30.77 30.6301 30.91C30.7001 31.04 30.8401 31.13 30.9701 31.21C31.3401 31.44 31.7401 31.64 32.1601 31.7C32.5901 31.77 33.0501 31.69 33.3901 31.41C34.1301 30.81 34.0701 29.45 33.9801 28.59Z" fill="#F9E9DE"/>
					<path d="M3.21003 26.87C3.56003 27.69 4.06005 28.63 4.94005 28.75C5.65005 28.85 6.31005 28.37 7.01005 28.19C7.21005 28.14 7.42003 28.11 7.58003 27.98C7.76003 27.83 7.83005 27.58 7.85005 27.34C7.90005 26.73 7.73004 26.13 7.56004 25.54C7.09004 23.94 6.62004 22.33 5.84004 20.86C5.77004 20.73 5.69005 20.59 5.57005 20.5C5.45005 20.41 5.29006 20.38 5.14006 20.37C4.25006 20.27 3.37005 20.52 2.51005 20.77C1.08005 21.18 1.31003 21.93 1.74003 23.05C2.22003 24.34 2.69003 25.62 3.21003 26.87Z" fill="#4D4D4D"/>
					<path d="M4.10005 20.99C4.53005 20.91 5.02005 20.85 5.38005 21.1C5.59005 21.25 5.72003 21.48 5.83003 21.72C6.22003 22.57 6.35005 23.52 6.66005 24.4C6.86005 24.97 7.12004 25.52 7.24004 26.11C7.27004 26.27 7.29004 26.45 7.21004 26.59C7.13004 26.72 6.99003 26.79 6.86003 26.85C6.24003 27.14 5.61004 27.43 4.93004 27.52C4.66004 27.56 4.34005 27.55 4.16005 27.35C4.08005 27.26 4.03004 27.15 3.99004 27.04C3.50004 25.86 2.98004 24.69 2.43004 23.53C2.18004 23.01 1.92005 22.46 1.94005 21.89C1.95005 21.57 2.64006 21.39 2.89006 21.31C3.27006 21.15 3.69005 21.06 4.10005 20.99Z" fill="white"/>
					<path d="M6.51997 27.51L6.30998 27.4C6.20998 27.37 6.08997 27.42 6.01997 27.5C5.94997 27.58 5.91998 27.7 5.92998 27.8C5.92998 27.84 5.93997 27.89 5.95997 27.92C5.98997 27.97 6.03998 27.99 6.08998 28.01C6.23998 28.05 6.40998 28 6.49998 27.87C6.57998 27.78 6.58997 27.62 6.51997 27.51Z" fill="#DDDDDD"/>
					<path d="M22.87 26.69C22.07 29.66 21.39 32.56 21.02 35.62C20.59 39.18 19.8 44.35 15.72 45.49C13.52 46.1 11.83 43.47 10.38 42.17C8.70005 40.68 7.39003 39.56 7.30003 37.08C7.19003 34.08 7.45004 31.79 5.40004 29.34C5.30004 29.23 5.14003 29.39 5.24003 29.5C7.09003 31.74 7.09005 34.05 7.07005 36.79C7.06005 38.16 7.29004 39.42 8.18004 40.5C9.48004 42.08 11.24 43.47 12.72 44.9C13.63 45.78 14.5401 46.21 15.8201 45.86C18.7901 45.05 20.3 41.66 20.91 38.93C21.36 36.87 21.46 34.76 21.8 32.68C22.13 30.68 22.7201 28.74 23.2601 26.79C23.3201 26.55 22.93 26.44 22.87 26.69Z" fill="#DDDDDD"/>
					<path d="M31.85 12.49C31.85 12.49 31.91 12.35 31.92 12.35C31.94 12.33 31.95 12.3 31.97 12.28C32.01 12.22 32.01 12.12 31.97 12.06C31.93 12 31.89 11.95 31.86 11.89C31.79 11.79 31.69 11.77 31.6 11.8H31.59C31.46 11.82 31.35 11.97 31.38 12.11C31.38 12.13 31.39 12.14 31.39 12.16C31.25 12.29 31.35 12.53 31.53 12.58C31.71 14.05 31.79 15.71 31.33 17.09C30.77 18.77 28.99 20.2 27.6 21.19C25.91 22.39 23.53 23.15 23.08 25.42C23.07 25.46 23.14 25.48 23.15 25.44C23.64 23.48 25.56 22.79 27.1 21.84C28.32 21.09 29.41 20.19 30.37 19.12C32.13 17.17 32.08 14.98 31.85 12.49Z" fill="#DDDDDD"/>
					<path d="M23.61 15.4C23.4 16.98 22.69 18.97 22.86 20.55C23.03 22.09 23.27 23.57 23.15 25.12C23.14 25.22 23.29 25.21 23.3 25.12C23.45 23.74 23.28 22.47 23.12 21.11C22.91 19.32 23.53 17.48 23.87 15.72C23.87 15.73 23.65 15.14 23.61 15.4Z" fill="#DDDDDD"/>
					<path d="M5.53999 29.32C5.54999 29.29 5.55999 29.25 5.53999 29.21C5.51999 29.15 5.5 29.09 5.48 29.03C5.47 28.99 5.43999 28.96 5.40999 28.94C5.32999 28.76 5.21998 28.63 4.92998 28.65C4.78998 28.66 4.66997 28.85 4.79997 28.95C4.81997 28.97 4.83997 28.99 4.85997 29.01C4.93997 29.24 5.02999 29.47 5.12999 29.7C5.13999 29.72 5.18 29.74 5.2 29.74C5.52 29.71 5.62999 29.61 5.53999 29.32Z" fill="#DDDDDD"/>
					<path d="M23.7199 25.09C23.6099 24.86 23.2399 24.84 23.0499 24.79C22.9199 24.76 22.8999 25.04 22.8699 25.28C22.7899 25.67 22.6999 26.05 22.6299 26.44C22.5699 26.74 22.4099 27.28 22.4499 27.58C22.4899 27.89 22.9499 28.04 23.1499 27.84C23.2599 27.73 23.2999 27.42 23.3399 27.27C23.4699 26.79 23.5699 26.31 23.6699 25.83C23.7099 25.59 23.8199 25.3 23.7199 25.09Z" fill="#DDDDDD"/>
					<defs>
					<linearGradient id="paint0_linear" x1="18.5412" y1="100.719" x2="51.0752" y2="102.296" gradientUnits="userSpaceOnUse">
					<stop stop-color="#4D4D4D"/>
					<stop offset="1"/>
					</linearGradient>
					<linearGradient id="paint1_linear" x1="18.5412" y1="100.719" x2="51.0752" y2="102.296" gradientUnits="userSpaceOnUse">
					<stop/>
					<stop offset="1"/>
					</linearGradient>
					</defs>
					</svg>
				
				Search Results</h1>
				         <form method="POST" action='SearchController' name="frmAddUser">
						Keyword <small class="text-muted">Try 'professional' or 'software'</small>
						<input type="text" name="keyword"
							value="<c:out value="${product.searchword}" />"><input
							type="submit" class="btn btn-info" style="margin-left:15px;" value="Submit" />
					</form>
				
				
				<p></p>
				<p>Not sure what you need?<a class="btn btn-primary button-margins" href="suggestedProducts.jsp">Take the Quiz</a></p>
				
				<form method="POST" action="FilterController">
				  <select id = "sort" name="action" class="form-control w-25" onchange="this.form.submit()">
				  	<option selected>Sort By</option>
				    <option ${selected_LH} value="Price_LH">Price: Low to High</option>
				    <option ${selected_HL} value="Price_HL">Price: High to Low</option>
				    <option ${selected_AZ} value="Name_AZ">Name: A to Z</option>
				    <option ${selected_ZA} value="Name_ZA">Name: Z to A</option>
				  </select>
				  
				</form>
				
				<br> 
				<p class="lead">${products.size()} Results</p>
				
				<center>
				<!-- IN CASE I MESS UP 
				<table class="table" id="myTable">
					<tbody id="myTableBody">
					<c:forEach begin="0" end="${products.size()}" step="3" var="i">
			                <c:forEach begin="${i}" end="${i+2}" var="j">
				                <td align="center">
				                <c:if test="${j < products.size()}">
				                	<img src="img/${products.get(j).getProductImage()}" height="200">
									<br>
										<a class="btn btn-link" href="ProductController?action=select&prodId=<c:out value="${products.get(j).getProductid()}"/>">${products.get(j).getProductName()}</a>
										<br>
										<div id ="favouriteBtn button-add" style="${showFavBtn}">
								 		<a href="MyWorkspaceController?location=search&action=${wsItems.addOrDelete(products.get(j).getProductid())}&prodid=${products.get(j).getProductid()}&userid=${username}">${wsItems.ProductSaved(products.get(j).getProductid())}</a>  
										</div>
									$ <c:out value="${products.get(j).getProductPriceString()}" />
										<br>
								</c:if>
			             	</c:forEach>
			            </tr>
			            
			        </c:forEach>
			        </tbody> -->
				
				<table class="table">
					<c:forEach begin="0" end="${products.size()}" step="3" var="i">
					<tr>
			                <c:forEach begin="${i}" end="${i+2}" var="j">
				                <td align="center">
				                <c:if test="${j < products.size()}">
				                	<img src="img/${products.get(j).getProductImage()}" height="200">
									<br>
										<a class="btn btn-link" href="ProductController?action=select&prodId=<c:out value="${products.get(j).getProductid()}"/>">${products.get(j).getProductName()}</a>
										<br>
										<div id ="favouriteBtn button-add" style="${showFavBtn}">
								 		<a href="MyWorkspaceController?location=search&action=${wsItems.addOrDelete(products.get(j).getProductid())}&prodid=${products.get(j).getProductid()}&userid=${username}">${wsItems.ProductSaved(products.get(j).getProductid())}</a>  
										</div>
									$ <c:out value="${products.get(j).getProductPriceString()}" />
										<br>
								</c:if>
			             	</c:forEach>
			            </tr>
			        </c:forEach>
			       
			        	
		        </table>
			        
				<div class="col-md-12 text-center">
			<!-- 
		      <ul class="pagination pagination-lg pager" id="myPager"></ul>	   -->  
		      
		      </div>
		       
				</center>
				
			</div>
			
			<div class="col-sm-2 sidenav">
			
			</div>
		</div>
		<!-- 
		<div id= footer-show><%@ include file="footer.jsp"%></div>  -->
	</div>
	
</body>
		      
</html>

