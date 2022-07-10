<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"/>
    <link rel="icon" href="https://cfassets.kartrocket.co/all-stores/image_cosmic/data/logo/transparent-logo.png?v=768c75194e238a7b61f0342b425ca295"/>
	<title>My Account : ${userDetails.username}</title>

    <style>
		@import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            border: none;
            outline: none;
            text-decoration: none;
            font-family: 'Poppins', sans-serif;
        }

        body {
            min-height: 100vh;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .grid-container {
            display: grid;
            grid-template-columns: 50% 50%;
            gap: 5px;
            background-color: white;
            color: #404040;
            margin: 10px 0;
        }

        .header {
            padding-bottom: 10px;
            border-bottom: 2px solid #fba819;
        }

        .myProfile,
        .addressDetails {
            padding: 10px;
        }

        .input-field-container {
            margin: 20px 0;
        }

        .grid-input-field-container {
            display: grid;
            grid-template-columns: 49% 49%;
            gap: 10px;
            overflow: hidden;
        }

        .input-field {
            width: 100%;
            border: 1px solid #dbdbdb;
            font-size: 16px;
            padding: 5px;
            margin-top: 10px;
        }

        .input-field[disabled] {
            background-color: inherit;
        }

        .btn {
            display: none;
            width: 100%;
            font-size: 16px;
            padding: 5px;
            margin: 10px 0;
            color: #fff;
        }

        .btn-edit, 
        .btn-save {
            background-color: #fba819;

        }
        
        .btn-edit:hover, 
        .btn-save:hover {
        	background-color: #e09616;
        }

        .btn-cancel {
            background-color: #282828;
        }
        
        .btn-cancel:hover {
            background-color: #000;
        }

        .show {
            display: block;
        }
        
        .hide {
            display: none;
        }

        @media all and (max-width: 680px) {
            .grid-container {
                grid-template-columns: 100%;
            }

            .grid-input-field-container {
                grid-template-columns: 100%;
            }
        }
    </style>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	
        <div class="container">
        
            <div class="grid-container">
            
            	<!-- MY PROFILE FORM START -->
            	<sp:form action="${pageContext.request.contextPath}/user/update" method="post" modelAttribute="userDetails">
            	
	            	<!-- MY PROFILE START -->
	                <div class="myProfile">
	                    <div class="header">
	                        <h2>My Profile</h2>
	                    </div>
	
						<div class="input-field-container hide">
	                        <b>User Id</b><br>
	                        <sp:input path="userId" type="text" placeholder="User Id" disabled="true" class="input-field"/>
	                    </div>
	
	                    <div class="input-field-container">
	                        <b>Username</b><br>
	                        <sp:input path="username" type="text" placeholder="username" disabled="true" class="input-field"/>
	                        <sp:errors path="username" class="text-red"/>
	                    </div>
	
	                    <div class="input-field-container">
	                        <b>Full Name</b><br>
	                        <sp:input path="fullName" type="text" placeholder="Full Name" disabled="true" class="input-field"/>
	                        <sp:errors path="fullName" class="text-red"/>
	                    </div>
	
	                    <div class="input-field-container">
	                        <b>Email Address</b><br>
	                        <sp:input path="email" type="text" placeholder="Email Address" disabled="true" class="input-field"/>
	                        <sp:errors path="email" class="text-red"/>
	                    </div>
	
	                    <div class="input-field-container">
	                        <b>Phone Number</b><br>
	                        <sp:input path="mobileNumber" type="text" placeholder="Phone Number" disabled="true" class="input-field"/>
	                        <sp:errors path="mobileNumber" class="text-red"/>
	                    </div>
	                    
	                    <div class="input-field-container">
	                        <b>Gender</b><br>
	                        <sp:select path="gender" disabled="true" class="input-field">
	                            <sp:option value="Male">Male</sp:option>
	                            <sp:option value="Female">Female</sp:option>
	                        </sp:select>
	                    </div>
	                    
	                    <div class="input-field-container hide">
	                        <b>Password</b><br>
	                        <sp:input path="password" type="text" placeholder="Password" disabled="true" class="input-field"/>
	                        <sp:errors path="password" class="text-red"/>
	                    </div>
	
	                </div>
	                <!-- MY PROFILE END -->
                
               	</sp:form>
               	<!-- MY PROFILE FORM END -->

				<!-- ADDRESS DETAILS FORM START -->
				<sp:form action="${pageContext.request.contextPath}/address/updateAddress" method="post" modelAttribute="addressDetails">
				
					<!-- ADDRESS DETAILS START -->
	                <div class="addressDetails">
	                    <div class="header">
	                        <h2>Address Details</h2>
	                    </div>
	                    
	                    <div class="input-field-container hide">
	                        <b>Address Id</b><br>
	                        <sp:input path="addressId" type="text" placeholder="User Id" disabled="true" class="input-field"/>
	                    </div>
	
	                    <div class="input-field-container">
	                        <b>Address</b><br>
	                        <sp:textarea path="address" cols="30" rows="3" placeholder="Address" disabled="true" class="input-field"></sp:textarea>
	                    </div>
	
	                    <div class="input-field-container grid-input-field-container">
	                        <div>
	                            <b>City</b><br>
	                            <sp:input path="city" type="text" placeholder="City" disabled="true" class="input-field"/>
	                        </div>
	                        <div>
	                            <b>Pincode</b><br>
	                            <sp:input path="pincode" type="number" placeholder="Pincode" disabled="true" class="input-field"/>
	                        </div>
	                    </div>
	
	                    <div class="input-field-container grid-input-field-container">
	                        <div>
	                            <b>State</b><br>
	                            <sp:select path="state" disabled="true" class="input-field">
	                                <sp:option value="Maharashtra">Maharashtra</sp:option>
	                            </sp:select>
	                        </div>
	                        <div>
	                            <b>Country</b><br>
	                            <sp:select path="country" disabled="true" class="input-field">
	                                <sp:option value="India">India</sp:option>
	                            </sp:select>
	                        </div>
	                    </div>
	
	                    <div class="btn-group">
	                        <button class="btn btn-edit show" id="btn-edit">Edit</button>
	                        <button type="submit" class="btn btn-save" id="btn-save">Save</button>
	                        <button class="btn btn-cancel" id="btn-cancel">Cancel</button>
	                    </div> 
	
	                </div>
	            	<!-- ADDRESS DETAILS END -->
	            	            
	        	</sp:form>
	        	<!-- ADDRESS DETAILS FORM END -->
	        	
            </div>
    </div>

	<jsp:include page="footer.jsp"></jsp:include>

    <script>
	    const btnEdit = document.getElementById("btn-edit");
	    const btnSave = document.getElementById("btn-save");
	    const btnCancel = document.getElementById("btn-cancel");
	    const indexField = document.getElementsByClassName('input-field');
	
	    btnEdit.addEventListener('click', (e)=> {
	
	        e.preventDefault();
	
	        for(var i = 0; i < indexField.length; i++) {
	            indexField[i].disabled = false;
	        };
	
	        btnEdit.classList.remove('show');
	        btnSave.classList.add('show');
	        btnCancel.classList.add('show');
	    });
	
	    btnCancel.addEventListener('click', (e)=> {
	        
	        e.preventDefault();
	
	        for(var i = 0; i < indexField.length; i++) {
	            indexField[i].disabled = true;
	        };
	
	        btnSave.classList.remove('show');
	        btnCancel.classList.remove('show');
	        btnEdit.classList.add('show');
	    });
    </script>
	
</body>
</html>