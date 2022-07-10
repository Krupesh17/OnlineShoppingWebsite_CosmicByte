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
	<link rel="icon" href="https://cfassets.kartrocket.co/all-stores/image_cosmic/data/logo/transparent-logo.png?v=768c75194e238a7b61f0342b425ca295"/>
	<title>My Orders</title>
	<style type="text/css">
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
		    background-color: #f1f3f6;
		}
		
		.container {
		    min-height: 100vh;
		    margin: 0 auto;
		    color: #282828;
		}
		
		.empty-cart-container {
		    padding: 20px 10px;
		}
		
		.empty-cart-layout {
		    background-color: white;
		}
		
		.empty-cart-header {
		    padding: 10px;
		    border-bottom: 2px solid orange;
		}
		
		.empty-cart-body {
		    height: 86vh;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		}
		
		.inner-box {
		    width: 20%;
		    overflow: hidden;
		    text-align: center;
		}
		
		.inner-box > img {
		    width: 100%;
		}
		
		.btn-box {
		    margin: 20px 0;
		}
		
		#btn-shop-now {
		    color: white;
		    background-color: orange;
		    padding: 5px 10px;
		}
		
		.cart-layout {
		    padding: 10px;
		    display: grid;
		    grid-template-columns: 100%;
		    gap: 10px;
		    color: #363636;
		}
		
		.myCart {
		    background-color: white;
		}
		
		.cart-header {
		    background-color: white;
		    border-bottom: 2px solid orange;
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    padding: 10px;
		}
		
		.cart-body {
		    background-color: white;
		}
		
		.item {
		    display: grid;
		    grid-template-columns: 15% auto;
		    gap: 10px;
		    border: 1px solid #e8e8e8;
		    margin: 10px;
		    padding: 10px;
		    position: relative;
		}
		
		.item-img {
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    overflow: hidden;
		    border: 2px dashed #e8e8e8;
		}
		
		.item-img > img {
		    width: 100%;
		}
		
		.item-name {
		    display: -webkit-box;
		    -webkit-box-orient: vertical;
		    -webkit-line-clamp: 2;
		    overflow: hidden;
		}
		
		.info-flex {
		    display: flex;
		}
		
		.item-model {
		    margin: 10px 0;
		}
		
		.item-delivery-status {
		    margin: 10px 0;
		    margin-left: 10px;
		}
		
		.item-model > span {
		    color: #717171;
		}
		
		.item-delivery-status > span {
			color: #20d62f;
		}
		
		.item-buttons {
		    position: absolute;
		    bottom: 0;
		    right: 0;
		    padding: 15px 10px;
		}
		
		@media all and (max-width: 1200px) {
		    .item {
		        grid-template-columns: 30% auto;
		    }
		}
		
		@media all and (max-width: 780px) {
		    .cart-layout {
		        grid-template-columns: 100%;
		    }
		
		    .inner-box {
		        width: 50%;
		    }
		
		    .info-flex {
		        display: flex;
		        flex-direction: column;
		    }
		
		    .item-delivery-status {
		        margin: 0;
		        margin-bottom: 10px;
		    }
		}
		
		@media all and (max-width: 580px) {
		    .item {
		        grid-template-columns: 40% auto;
		    }
		}
		
		@media all and (max-width: 480px) {
		    .item {
		        grid-template-columns: 50% auto;
		    }
		}
	</style>	
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
	
        <!-- EMPTY ORDER DASH BOARD START -->
        <c:if test="${empty orderedItems}">
	        <div class="empty-cart-container">         
	            <div class="empty-cart-layout">
	                <div class="empty-cart-header">
	                    <h3>My Cart</h3>
	                </div>
	                <div class="empty-cart-body">
	                    <div class="inner-box">
	                        <img src="https://rukminim1.flixcart.com/www/800/800/promos/16/05/2019/d438a32e-765a-4d8b-b4a6-520b560971e8.png?q=90" alt="">
	                        <p>You haven't ordered anything</p>
	                        <div class="btn-box">
	                            <a href="" id="btn-shop-now">Order Now</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
        </c:if>
        <!-- EMPTY ORDER DASH BOARD END -->

        <!-- ORDER DASH BOARD START -->
        <c:if test="${not empty orderedItems}">
	        <div class="cart-layout">
	            <div class="myCart">
	
	                <!-- CART HEADER START -->
	                <div class="cart-header">
	                    <div class="d-address-box">
	                        <h4>My Orders</h4>
	                    </div>
	                </div>
	                <!-- CART HEADER END -->
	
	                <!-- CART BODY START -->
	                <div class="cart-body">
	
						<c:forEach items="${orderedItems}" var="orderedItem">
		                    <!-- ITEM CARD START -->
		                    <div class="item">
		                        <div class="item-img">
		                            <img src="${orderedItem.prodImageLink}" alt="${orderedItem.prodName}">
		                        </div>
		
		                        <div class="item-info">
		                            
		                            <p class="item-name">
		                                ${orderedItem.prodName}
		                            </p>
		
		                            <div class="info-flex">
		                                <p class="item-model">
		                                    <b>Model: </b><span>${orderedItem.prodModel}</span> 
		                                </p>
		                                <p class="item-delivery-status">
		                                    <b>Delivery by: </b><span>${orderedItem.prodDeliveryDate}</span>
		                                </p>
		                            </div>
		                            
		                            <p class="item-price">
		                                <b>Price: </b><span>&#8377;${orderedItem.prodPrice}</span>
		                            </p>
		
		                        </div>
		                    </div>
		                    <!-- ITEM CARD END -->
						</c:forEach>
	                </div>
	            <!-- CART BODY END -->
	            
	            </div>
	        </div>
        </c:if>
        <!-- ORDER DASH BOARD END -->
        
    </div>
    
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>