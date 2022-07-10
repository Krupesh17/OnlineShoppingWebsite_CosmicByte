<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- CDN Link For Google Icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<!-- Browser Tab Icon -->
<link rel="icon" href="https://cfassets.kartrocket.co/all-stores/image_cosmic/data/logo/transparent-logo.png?v=768c75194e238a7b61f0342b425ca295"/>
<title>Cosmic Byte - Official Brand Store for Cosmic Byte</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: 'Poppins', sans-serif;
}

header {
	position: sticky;
    top: 0;
    background-color: #000000;
    color: white;
    z-index: 1;
}

.nav-bar {
    padding: 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 14px;
    font-family: Verdana, Geneva, Tahoma, sans-serif;
}

.nav-list {
    list-style-type: none;
}

.nav-list .list-item {
    display: inline-block;
    padding: 10px 10px;
}

.list-item a {
    text-decoration: none; 
    color: white;
}

.list-item a:hover {
    color: #e9a825;
}

#btn-lg-rg {
	background-color: inherit;
	color: white;
	font-size: 14px;
	border: 0;
}

#btn-lg-rg:hover {
	color: #e9a825;
}

.menu {
    display: none;
}

#btn-menu {
    vertical-align: middle;
}

#btn-close {
    display: none;
}

#logo-small {
    display: none;
}

.nav-item-container {
    margin-right: 20px;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #161616;
  min-width: 125px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
  text-align: center;
}

.dropdown-content a {
  color: white;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  cursor: pointer;
}

.dropdown-content a:hover {
	background-color: #262626;
}

.dropdown:hover .dropdown-content {
	display: block;
}

#btn-setting {
	background-color: inherit;
    color: white;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 8px;
    border-radius: 50px;
}

#btn-setting:hover {
	background-color: #fba819;
	color: #262626;
}

.dropdown-setting {
	float: right;
	position: relative;
	display: inline-block;
}

.dropdown-content-setting {
  display: none;
  position: absolute;
  background-color: #161616;
  min-width: 180px;
  overflow: auto;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  right: 0;
  z-index: 1;
}

.dropdown-content-setting a {
  color: white;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  cursor: pointer;
}

.dropdown-content-setting a:hover {
	background-color: #262626;
	color: #e9a825;
}

.dropdown-setting:hover .dropdown-content-setting {
	display: block;
}

/* width */
::-webkit-scrollbar {
   width: 10px;
}

/* Track */
::-webkit-scrollbar-track {
   background: #f1f1f1; 
}
 
/* Handle */
::-webkit-scrollbar-thumb {
   background: #fba819; 
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
    background: #262626; 
}

::-webkit-scrollbar:horizontal{
    height: 10px;
}

::-webkit-scrollbar-thumb:horizontal {
    background: #fba819;        
}

::-webkit-scrollbar-thumb:horizontal:hover {
	background: #262626; 
}

@media all and (max-width: 680px) {         /* So onse the screen size is smaller then 480px then this CSS rule will come in action. */
    .nav-bar {
        flex-direction: column;
        position: relative;
    }

    .nav-bar .logo-container {
        width: 100%;
    }
    
    .menu {
        display: block;
        position: absolute;
        right: 15px;
        top: 15px;
    }

    .nav-list {
        list-style-type: none;
        width: 100%;
        text-align: center;
        padding-top: 10px;
        display: none;
    }

    .nav-list .list-item {
        display: block;
    }

    .active {
        display: block;
    }

    #logo-small {
        display: inline;
    }

    #logo-small img {
        width: 50px;
    }

    #logo-big {
        display: none;
    }

    .nav-item-container {
        display: block;
        position: absolute;
        right: 60px;
        top: 15px;
        margin-right: 0;
    }
}
</style>
</head>
<body>
	<header>
        <nav class="nav-bar">
            <div class="logo-container">
                <a href="${pageContext.request.contextPath}/home" id="logo-big">
                    <img src="https://ik.imagekit.io/bfrs/tr:w-160,h-50,pr-true,cm-pad_resize/image_cosmic/data/logo/rsz_2020-01-15.png" alt="Cosmic Byte Logo">
                </a>
                <a href="${pageContext.request.contextPath}/home" id="logo-small" >
                    <img src="https://cdn-yotpo-images-production.yotpo.com/App/221852/68746412/thumb.jpg?1584690182" alt="Cosmic Byte Logo">
                </a>
            </div>
            <ul class="nav-list" id="nav-list">
                <li class="list-item">
                	<a id="link-home" href="${pageContext.request.contextPath}/home">HOME</a>
                </li>
                <li class="list-item">
                	<a id="link-c-accessory" href="${pageContext.request.contextPath}/product/computer_accessories">COMPUTER ACCESSORIES</a>
                </li>
                <li class="list-item">
                	<a id="link-g-accessory" href="${pageContext.request.contextPath}/product/gaming_accessories">GAMING ACCESSORIES</a>
                </li>
                <li class="list-item">
                	<a id="link-h-accessory" href="${pageContext.request.contextPath}/product/headphones_accessories">HEADPHONES</a>
                </li>
                
                <sec:authorize access="hasAuthority('admin') and isAuthenticated()">
                	<li class="list-item">
                		<a id="link-addProduct" href="${pageContext.request.contextPath}/product/add">ADD PRODUCT</a>
                	</li>
                </sec:authorize>
                
                <sec:authorize access="!isAuthenticated()">
                <li class="list-item">
                	<div class="dropdown">
                		<button id="btn-lg-rg">LOGIN / REGISTER</button>
                		<div class="dropdown-content">
						    <a href="${pageContext.request.contextPath}/user/login">LOGIN</a>
						    <a href="${pageContext.request.contextPath}/user/register">REGISTER</a>
						</div>
                	</div>
                </li>
                </sec:authorize>
                
                <sec:authorize access="isAuthenticated()">
                	<li class="list-item">
                		<a href="${pageContext.request.contextPath}/logout">LOGOUT</a>
                	</li>
                </sec:authorize>
                
            </ul>

            <div class="nav-item-container">
            	<div class="dropdown-setting">
	                <button id="btn-setting">
	                    <span class="material-symbols-outlined">
	                        settings
	                    </span>
	                </button>
	                <div class="dropdown-content-setting">
					    <a href="${pageContext.request.contextPath}/user/my-account">
					    	<span class="material-symbols-outlined" style="vertical-align: middle;">account_circle</span>
					    	MY PROFILE
					    </a>
					    <a href="${pageContext.request.contextPath}/cart/open_cart">
					    	<span class="material-symbols-outlined" style="vertical-align: middle;">shopping_cart</span> 
					    	MY CART
					    </a>
					    <a href="${pageContext.request.contextPath}/order/my-orders">
					    	<span class="material-symbols-outlined" style="vertical-align: middle;">reorder</span> 
					    	MY ORDERS
					    </a>
					</div>
                </div>
            </div>

            <div class="menu" id="toggleButton">
                <span class="material-symbols-outlined" id="btn-menu">
                    menu
                </span>
                <span class="material-symbols-outlined" id="btn-close">
                    close
                </span>
            </div>
        </nav>
    </header>

    <script>
        // JavaScript Code For Navigation Bar.
        const toggleButton = document.getElementById('toggleButton');
        const navList = document.getElementById('nav-list');

        toggleButton.addEventListener('click', ()=> {
            navList.classList.toggle('active');

            if(navList.classList.contains('active')) {
                document.getElementById('btn-menu').style.display = 'none';
                document.getElementById('btn-close').style.display = 'block';
            }

            if(!navList.classList.contains('active')) {
                document.getElementById('btn-menu').style.display = 'block';
                document.getElementById('btn-close').style.display = 'none';
            }
        });
    </script>
</body>
</html>