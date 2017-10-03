<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<head>
<title>HALKOM Application</title>

<spring:url value="/include/hello.css" var="coreCss" />
<spring:url value="/include/bootstrap.min.css"
	var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />
</head>

<spring:url value="/newtree" var="urlHome" />
<spring:url value="/users/add" var="urlAddUser" />

<nav class="navbar-inverse">
	<div>
		<div class="navbar-header">
			<a class="navbar-brand" href="${urlHome}">HALKOM Form</a>
		</div>
		<div id="navbar">
			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="${urlAddUser}">Add User</a></li>
			</ul>
		</div>
	</div>
</nav>