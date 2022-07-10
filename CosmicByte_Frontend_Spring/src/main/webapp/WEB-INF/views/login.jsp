<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Browser Tab Icon -->
<link rel="icon" href="https://cfassets.kartrocket.co/all-stores/image_cosmic/data/logo/transparent-logo.png?v=768c75194e238a7b61f0342b425ca295"/>
<title>Login</title>
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

        .login-card {
            width: 30%;
            border: 1px solid #e2e2e2;
            background-color: white;
            border-radius: 6px; 
        }

        .login-form {
            display: flex;
            flex-direction: column;
            padding: 10px 20px;
            text-align: center;
        }

        .login-form h2 {
            color: #161616;
            margin-bottom: 10px;
        }

        #feild-username,
        #feild-password {
            background-color: inherit;
            margin-bottom: 15px;
            border: 0;
            border-bottom: 1px solid #d1d1d1;
            outline: none;
            font-size: 18px;
            padding: 5px 10px;
        }
        
        #feild-password {
        	margin-bottom: 0;
        }

        #btn-form-login {
            margin: 5px 0;
            border: none;
            outline: none;
            background-color: #262626;
            color: white;
            font-size: 18px;
            padding: 5px 10px;
            cursor: pointer;
        }

        #btn-form-login:hover {
            background-color: black;
        }

        #link-to-register {
            margin: 5px 0;
            font-size: 15px;
        }

        #link-forget-pass {
            text-decoration: none;
            font-size: 15px;
            text-align: right;
            color: #a1a1a1;
            margin-bottom: 15px
        }

        #link-forget-pass:hover {
            text-decoration: underline;
            color: black;
        }

        #link-to-register a {
            text-decoration: none;
            color: #a1a1a1;
        }

        #link-to-register a:hover {
            text-decoration: underline;
            color: black;
        }

        @media all and (max-width: 1500px) {
            .login-card {
                width: 35%;
                border: 1px solid #e2e2e2;
            }
        }

        @media all and (max-width: 1300px) {
            .login-card {
                width: 50%;
                border: 1px solid #e2e2e2;
            }
        }

        @media all and (max-width: 900px) {
            .login-card {
                width: 60%;
                border: 1px solid #e2e2e2;
	            }
        }

        @media all and (max-width: 700px) {
            .login-card {
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
        <div class="login-card">
            <form action="${pageContext.request.contextPath}/loginaction" method="post" class="login-form">
                <h2>Login</h2>
                <input type="text" name="username" placeholder="Username" id="feild-username">		<!-- We need to provide property name in 'name' attribute. -->
                <input type="password" name="password" placeholder="Password" id="feild-password">
                <a href="#" id="link-forget-pass">Forgot Password?</a>
                <input type="submit" value="Login" id="btn-form-login">
                <p id="link-to-register">
                	Don't have account? <a href="${pageContext.request.contextPath}/user/register">Register Now</a>
                </p>
            </form>
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