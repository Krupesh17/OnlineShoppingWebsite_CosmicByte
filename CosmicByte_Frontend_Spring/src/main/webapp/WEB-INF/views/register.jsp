<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Browser Tab Icon -->
<link rel="icon" href="https://cfassets.kartrocket.co/all-stores/image_cosmic/data/logo/transparent-logo.png?v=768c75194e238a7b61f0342b425ca295"/>
<title>Register</title>
<style type="text/css">
  	@import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        font-family: 'Poppins', sans-serif;
    }
    
     body {
     	 background-image: url("https://wallpaperaccess.com/full/6091442.jpg");
         background-repeat: no-repeat;
         background-position: center;
         background-size: cover;
         background-color: white;
     }

     .container {
         display: flex;
         justify-content: center;
         align-items: center;
         min-height: 90vh;
     }

     .register-card {
         width: 30%;
         border: 1px solid #e2e2e2;
         background-color: white;
         border-radius: 6px;
         margin-top: 10px;
     }

     .register-form {
         display: flex;
         flex-direction: column;
         padding: 10px 20px;
         text-align: center;
     }

     .register-form h2 {
         color: #161616;
     }

     #feild-email,
     #feild-password,
     .feild-text {
         background-color: inherit;
         margin: 10px 0;
         margin-bottom: 0px;
         border: 0;
         border-bottom: 1px solid #d1d1d1;
         outline: none;
         font-size: 18px;
         padding: 5px 10px;
     }
     
     .feild-select {
     	width: 100%;
     	background-color: inherit;
     	margin: 10px 0;
     	margin-bottom: 0;
     	border: 0;
        border-bottom: 1px solid #d1d1d1;
        outline: none;
        font-size: 18px;
         padding: 5px 10px;
     }
     
     .text-red {
     	color: red;
     	margin-bottom: 10px;
     	text-align: left;
     	font-size: 14px
     }

     #btn-form-register {
         margin: 15px 0 5px 0;
         border: none;
         outline: none;
         background-color: #262626;
         color: white;
         font-size: 18px;
         padding: 5px 10px;
         cursor: pointer;
     }

     #btn-form-register:hover {
         background-color: black;
     }

     #btn-form-reset {
         margin: 5px 0;
         border: none;
         outline: none;
         color: black;
         background-color: #e7e7e7;
         font-size: 18px;
         padding: 5px 10px;	
         cursor: pointer;
     }

     #btn-form-reset:hover {
         background-color: #e0e0e0;
     }

     #link-to-login {
         margin: 5px 0;
         font-size: 15px;
     }

     #link-to-login a {
         text-decoration: none;
         color: #a1a1a1;
     }

     #link-to-login a:hover {
         text-decoration: underline;
         color: black;
     }

     @media all and (max-width: 1500px) {
         .register-card {
             width: 35%;
             border: 1px solid #e2e2e2;
         }
     }

     @media all and (max-width: 1300px) {
         .register-card {
             width: 50%;
             border: 1px solid #e2e2e2;
         }
     }

     @media all and (max-width: 900px) {
         .register-card {
             width: 60%;
             border: 1px solid #e2e2e2;
         }
     }

     @media all and (max-width: 700px) {
         .register-card {
             width: 100%;
             border: 1px solid #e2e2e2;
             margin: 0 10px;
         }
     }
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<section class="container">
        <div class="register-card">
            <sp:form action="${pageContext.request.contextPath}/user/add" method="post" modelAttribute="user" class="register-form">
                <h2>Register</h2>
                <sp:input path="fullName" type="text" placeholder="Full Name" class="feild-text"/>
                <sp:errors path="fullName" class="text-red"/>
                
                <sp:input path="username" type="text" placeholder="Username" class="feild-text"/>
                <sp:errors path="username" class="text-red"/>
                
                <sp:select path="gender" class="feild-select">
                	<option>Male</option>
                    <option>Female</option>
                </sp:select>
                
                <sp:input path="mobileNumber" type="text" placeholder="Mobile Number" class="feild-text"/>
                <sp:errors path="mobileNumber" class="text-red"/>
                
                <sp:input path="email" type="text" placeholder="Email" id="feild-email"/>
                <sp:errors path="email" class="text-red"/>
                
                <sp:input path="password" type="password" placeholder="Password" id="feild-password"/>
                <sp:errors path="password" class="text-red"/>
                
                <input type="submit" value="Register" id="btn-form-register">
                <input type="reset" value="Reset" id="btn-form-reset">
                <p id="link-to-login">
                	Already have an account? <a href="${pageContext.request.contextPath}/user/login">Login Now</a>
                </p>
            </sp:form>
        </div>
    </section>
    
    <jsp:include page="footer.jsp"></jsp:include>
    
    <!-- JavaScript -->
    <script type="text/javascript">
    	let linkLoginRegister = document.getElementById('btn-lg-rg');
    	linkLoginRegister.style.color = "#e9a825";
    </script>
</body>
</html>