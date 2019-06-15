<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>Insert title here</title>
<style>
table, th, td {
	border:0px solid black;
	color: blue;
}

body {
	
}
</style>
<style type="text/css">
.error {
	color: red;
}
</style>
</head>
<body>
	<font color='green'>${msg}</font>
	<div align="center">
		<h2 style="color: Maroon">Student Registration Form</h2>
	</div>
	<form:form method="POST" action="register" modelAttribute="user"
		id="registration">
		<div align="center">
			<table>
				<tr>
					<td>First Name</td>
					<td><form:input path="fname" /></td>
					<td><form:errors path="fname" cssClass="error" /></td>
				</tr>

				<tr>
					<td>Last Name</td>
					<td><form:input path="lname" /></td>
					<td><form:errors path="lname" cssClass="error" /></td>

				</tr>
				<tr>
					<td>Gender</td>
					<td><form:radiobuttons path="genders" items="${genders}"
							element="genders" /></td>
					<td><form:errors path="genders" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><form:input path="email" /></td>
					<td><form:errors path="email" cssClass="error" /></td>
				</tr>

				<tr>
					<td>PassWord</td>
					<td><form:password path="pwd" showPassword="true" /></td>
					<td><form:errors path="pwd" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Confirm Password</td>
					<td><form:password path="confirmPwd" showPassword="true" /></td>
					<td><form:errors path="confirmPwd" cssClass="error" /></td>


				</tr>
				<tr>
					<td>Choose Batch Timings</td>
					<td><form:checkboxes items="${timings}" path="timings"
							element="timings" /></td>
					<td><form:errors path="timings" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Select Courses</td>
					<td><form:select path="courses">
							<form:option value="" label="Please Select Course" />
							<form:options items="${courseDetails}" />


						</form:select></td>
					<td><form:errors path="courses" cssClass="error" /></td>

				</tr>
				<tr>
					<td><input type="submit" value="submit" name="Register"></td>
					<td><input type="reset" value="clear"></td>
				</tr>

			</table>
		</div>
	</form:form>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.js"></script>


	<script type="text/javascript">
		jQuery.validator.addMethod("noSpace", function(value, element) {
			return value == '' || value.trim().length != 0;
		}, "No space please and don't leave it empty");
		jQuery.validator
				.addMethod(
						"customEmail",
						function(value, element) {
							return this.optional(element)
									|| /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/
											.test(value);
						}, "Please enter valid email address!");
		$.validator.addMethod("alphanumeric", function(value, element) {
			return this.optional(element) || /^\w+$/i.test(value);
		}, "Letters, numbers, and underscores only please");
		var $registrationForm = $('#registration');
		if ($registrationForm.length) {
			$registrationForm.validate({
				rules : {

					email : {
						required : true,
						customEmail : true
					},
					pwd : {
						required : true
					},
					confirmPwd : {
						required : true,
						equalTo : '#pwd'
					},

					fname : {
						required : true,
						noSpace : true
					},
					lname : {
						required : true,
						noSpace : true
					},
					genders : {
						required : true
					},
					courses : {
						required : true
					},
					timings : {
						required : true
					},

				},
				messages : {

					email : {
						required : 'Please enter email!',
						email : 'Please enter valid email!'
					},
					pwd : {
						required : 'Please enter password!'
					},
					confirmPwd : {
						required : 'Please enter confirm password!',
						equalTo : 'Please enter same password!'
					},

					fname : {
						required : 'Please enter first name!'
					},
					lname : {
						required : 'Please enter last name!'
					},
					courses : {
						required : 'Please enter at least one course'
					},
					timings : {
						required : 'Please atlest choose one time'
					},
					genders : {
						required : 'Please Mention the gender'
					},

				},

			});
		}
	</script>

</body>
</html>