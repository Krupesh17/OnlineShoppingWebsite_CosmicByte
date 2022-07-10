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
	<title>My Cart</title>
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
		
		.container {
		    min-height: 100vh;
		    margin: 0 auto;
		    background-color: #f1f3f6;
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
		    background-color: #fba819;
		    padding: 5px 10px;
		}
		
		#btn-shop-now:hover {
			background-color: #e09616;
		}
		
		.cart-layout {
		    padding: 10px;
		    display: grid;
		    grid-template-columns: 70% auto;
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
		
		.d-address {
		    word-wrap: break-word;
		}
		
		.textMaxLine {
		    display: -webkit-box;
		    -webkit-box-orient: vertical;
		    -webkit-line-clamp: 2;
		    overflow: hidden;
		}
		
		#btn-chng-add {
		    background-color: #fba819;
		    color: white;
		    cursor: pointer;
		    padding: 5px 10px;
		}
		
		#btn-chng-add:hover {
		    background-color: #e09616;
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
		
		.item-model {
		    margin: 10px 0;
		}
		
		.item-model > span {
		    color: #717171;
		}
		
		.item-buttons {
		    position: absolute;
		    bottom: 0;
		    right: 0;
		    padding: 15px 10px;
		}
		
		.btn-remove {
		    background-color: #282828;
		    color: white;
		    padding: 5px 10px;
		    font-size: 2.5vh;
		}
		
		.btn-remove:hover {
		    background-color: #404040;
		}
		
		.card-footer {
		    background-color: white;
		    border-top: 2px solid orange;
		    padding: 15px 10px;
		    text-align: right;
		}
		
		#btn-place-order {
		    background-color: #fba819;
		    color: white;
		    cursor: pointer;
		    padding: 5px 10px;
		}
		
		#btn-place-order:hover {
		    background-color: #e09616;
		}
		
		.priceDetails-inner-box {
		    background-color: white;
		}
		
		.priceDetails-header {
		    padding: 10px;
		    border-bottom: 2px solid orange; 
		}
		
		.priceDetails-body {
		    background-color: white;
		    padding: 10px;
		}
		
		.priceDetails-price {
		    display: flex;
		    justify-content: space-between;
		    margin: 10px 0;
		}
		
		.priceDetails-discount {
		    display: flex;
		    justify-content: space-between;
		    margin-bottom: 10px;
		}
		
		.priceDetails-total {
		    display: flex;
		    justify-content: space-between;
		    border-top: 1px solid #e8e8e8;
		    padding: 5px 0 0 0;
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
		
		    .btn-remove {
		        font-size: 1.5vh;
		    }
		}

	</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	 <div class="container">
	 
	 	<!-- EMPTY CART START -->
        <c:if test="${empty cartItems}">
	        <div class="empty-cart-container">         
	            <div class="empty-cart-layout">
	                <div class="empty-cart-header">
	                    <h3>My Cart</h3>
	                </div>
	                <div class="empty-cart-body">
	                    <div class="inner-box">
	                        <img src="https://rukminim1.flixcart.com/www/800/800/promos/16/05/2019/d438a32e-765a-4d8b-b4a6-520b560971e8.png?q=90" alt="">
	
	                        <p>Your cart is empty!</p>
	                        <small>Add items to it now.</small>
	                        <div class="btn-box">
	                            <a href="${pageContext.request.contextPath}/product/computer_accessories" id="btn-shop-now">Shop Now</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div> 
		</c:if>
		<!-- EMPTY CART END -->
		
		<!-- NOT EMPTY CART START -->
		<c:if test="${not empty cartItems}">
		
			<!-- CART LAYOUT START -->
	        <div class="cart-layout">
	        
	        	<!-- MY CART START -->
	            <div class="myCart">
	
	                <!-- CART HEADER START -->
	                <div class="cart-header">
	                    <div class="d-address-box">
	                        <h4>Delivery Address</h4>
	                        <p class="textMaxLine">
	                        	${addressDetails.address}, ${addressDetails.city} - ${addressDetails.pincode}.
	                        </p>
	                    </div>
	                    <a href="${pageContext.request.contextPath}/user/my-account" id="btn-chng-add">Change</a>
	                </div>
	                <!-- CART HEADER END -->
	
	                <!-- CART BODY START -->
	                    <div class="cart-body">
							
							<c:forEach items="${cartItems}" var="cartItem">
		                        <!-- ITEM CARD START -->
		                        <div class="item">
		                            <div class="item-img">
		                                <img src="${cartItem.prodImageLink}" alt="${cartItem.prodName}">
		                            </div>
		
		                            <div class="item-info">
		                                <p class="item-name">
		                                    ${cartItem.prodName}
		                                </p>
		                                <p class="item-model"><b>Model: </b><span>${cartItem.prodModel}</span></p>
		                                <p class="item-price">
		                                    <b>Price: </b>
		                                    <span style="text-decoration: line-through; font-size: 14px; color: #8c8b8b;">&#8377;${cartItem.prodOldPrice} </span>
		                                    <span>&#8377;${cartItem.prodPrice}</span>
		                                </p>
		
		                                <div class="item-buttons">
		                                    <a href="${pageContext.request.contextPath}/cart/remove/${cartItem.id}" class="btn-remove">Remove</a>
		                                </div>
		                            </div>
		                        </div>
		                        <!-- ITEM CARD END -->
	                        </c:forEach>
	                        
	                    </div>
	                <!-- CART BODY END -->
	
	                <!-- CART FOOTER START -->
	                <div class="card-footer">
	                    <a href="${pageContext.request.contextPath}/order/place-order" id="btn-place-order">Place Order</a>
	                </div>
	                <!-- CART FOOTER END -->
	                
	            </div>
	            <!-- MY CART END -->
	            
	            <!-- PRICE DETAILS START -->
	            <div class="priceDetails">
	                <div class="priceDetails-inner-box">
	                    <div class="priceDetails-header">
	                        <h3>Price Details</h3>
	                    </div>
	
	                    <div class="priceDetails-body">
	                        <div class="priceDetails-price">
	                            <p>Price (${priceDetails.itemCount} item)</p> 
	                            <p>&#8377;${priceDetails.totalOfOldPrice}</p>
	                        </div>
	
	                        <div class="priceDetails-discount">
	                            <p>Discount</p>
	                            <p style="color: #39bd1e;">- &#8377;${priceDetails.discount}</p>
	                        </div>
	
	                        <div class="priceDetails-total">
	                            <p><b>Total</b></p>
	                            <p>&#8377;${priceDetails.totalOfPrice}</p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <!-- PRICE DETAILS END -->
	            
	        </div>
	        <!-- CART LAYOUT END -->
	        
		</c:if>
		<!-- NOT EMPTY CART END -->
		
    </div>
	 
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>