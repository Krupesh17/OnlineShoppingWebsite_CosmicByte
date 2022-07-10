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
	<title>Check Out</title>
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
		}
		
		.cart-layout {
		    padding: 10px;
		    display: grid;
		    grid-template-columns: 70% auto;
		    gap: 10px;
		    color: #363636;
		}
		
		.login-details {
			display: flex;
		    justify-content: space-between;
		    align-items: center;
			background-color: white;
		    padding: 10px;
		    margin: 0 0 10px 0;
		}
		
		.cart-header {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    background-color: white;
		    padding: 10px;
		    margin: 10px 0;
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
		    padding-bottom: 10px;'
		}
		
		.cart-headline {
			background-color: #fba819;		
			padding: 10px;
		}
		
		.item {
		    display: grid;
		    grid-template-columns: 15% auto;
		    gap: 10px;
		    border: 1px solid #e8e8e8;
		    margin: 10px 10px 0 10px;
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
		
		.card-footer {
			display: flex;
			justify-content: space-between;
			align-items: center;
		    background-color: white;
		    padding: 15px 10px;
		    margin: 10px 0;
		}
		
		#btn-continue {
		    background-color: #fba819;
		    color: white;
		    cursor: pointer;
		    padding: 5px 10px;
		}
		
		#btn-continue:hover {
		    background-color: #e09616;
		}
		
		/*PAY OPTIONS CSS START*/
		.pay-op-container {
			display: none;
		    background-color: white;
		}
		
		.pay-op {
		    display: flex;
		    border-bottom: 1px solid #dadada;
		}
		
		.btn {
		    padding: 10px 20px;
		    background-color: #ffffff;
		    font-size: 16px;
		    border-right: 1px solid #dadada;
		}
		
		.btn:hover { 
		    background-color: orange;
		}
		
		.op-upi {
		    display: none;
		    padding: 10px;
		    background-color: white;
		}
		
		.flex-div {
		    display: flex;
		    justify-content: center;
		    align-items: center;
		}
		
		.upi-div {
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    background-color: #ffffff;
		    border: 2px dashed orange;
		    padding: 10px;
		}
		
		.op-cr-dr {
		    display: none;
		    padding: 10px;
		    background-color: white;
		}
		
		.cr-dr-div {
		    margin-top: 10px;
		}
		
		#field-card-number {
		    border: 1px solid #dadada;
		    font-size: 16px;
		    padding: 5px 10px;
		}
		
		.feild-group {
		    margin: 15px 0;
		}
		
		.valid-m-y {
		    display: inline;
		    border: 1px solid #dadada;
		    padding: 6px 10px;
		    font-size: 16px;
		}
		
		.valid-m-y > p {
		    display: inline;
		    color: #727272;
		}
		
		#mm,
		#yy {
		    font-size: 16px;
		}
		
		#cvv {
		    width: 5em;
		    font-size: 16px;
		    border: 1px solid #dadada;
		    padding: 5px 10px;
		}
		
		.cr-dr-pay-btn-box {
			margin: 15px 0;
		}
		
		#btn-pay {
			background-color: #fba819;
			color: white;
			font-size: 16px;
			padding: 5px 20px;
		}
		
		#btn-pay:hover {
			background-color: #e09616;
		}
		
		.op-cod {
		    display: none;
		    background-color: white;
		}
		
		.op-cod-inner-box {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    padding: 10px;
		}
		
		#btn-conf-order {
		    padding: 5px 10px;
		    background-color: #fba819;
		    color: white;
		}
		
		#btn-conf-order:hover {
		    background-color: #e09616;
		}
		
		.show { 
		    display: block;
		}
		
		.selected-btn {
		    background-color: #fba819;
		}
		/*PAY OPTIONS CSS END*/
		
		.priceDetails-inner-box {
		    background-color: white;
		}
		
		.priceDetails-header {
		    padding: 10px;
		    border-bottom: 2px solid #fba819; 
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
		
		
        <div class="cart-layout">
        
        	<!-- MY CART START -->
            <div class="myCart">
				
				<!-- LOGIN DETAILS START -->
				<c:if test="${not empty userDetails}">
					<div class="login-details">
						<div class="d-address-box">
	                        <h4>Login</h4>
	                        <p class="textMaxLine">
	                        	${userDetails.fullName} 
	                        </p>
	                    </div>
						
						<a href="" id="btn-chng-add">Change</a>
					</div>
				</c:if>
				<!-- LOGIN DETAILS END -->
				
				
	            <!-- CART HEADER START -->
				<c:if test="${not empty addressDetails}">
	                <div class="cart-header">
	                    <div class="d-address-box">
	                        <h4>Delivery Address</h4>
	                        <p class="textMaxLine">
	                        	${addressDetails.address}, ${addressDetails.city} - ${addressDetails.pincode}.
	                        </p>
	                    </div>
	                    
	                    <a href="${pageContext.request.contextPath}/user/my-account" id="btn-chng-add">Change</a>
	                </div>
				</c:if>
	            <!-- CART HEADER END -->
	
	
                <!-- CART BODY START -->
                    
                    <!-- CART BODY START-->                    
                    <div class="cart-body">
						<div class="cart-headline">
							<h4>Order Summary</h4>
						</div>
						
						<!-- PAY ORDER FOR LIST OF PRODUCTS START -->
						<c:if test="${not empty cartItems}">
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
		                                
		                            </div>
		                        </div>
		                        <!-- ITEM CARD END -->
	                        </c:forEach>
                        </c:if>
                        <!-- PAY ORDER FOR LIST OF PRODUCTS END -->
                        
                        <!-- PAY ORDER FOR SOLO PRODUCT START -->
                        <c:if test="${not empty cartItemDetails}">
                        	<!-- ITEM CARD START -->
	                        <div class="item">
	                            <div class="item-img">
	                                <img src="${cartItemDetails.prodImageLink}" alt="${cartItemDetails.prodName}">
	                            </div>
	
	                            <div class="item-info">
	                                <p class="item-name">
	                                    ${cartItemDetails.prodName}
	                                </p>
	                                <p class="item-model"><b>Model: </b><span>${cartItemDetails.prodModel}</span></p>
	                                <p class="item-price">
	                                    <b>Price: </b>
	                                    <span style="text-decoration: line-through; font-size: 14px; color: #8c8b8b;">&#8377;${cartItemDetails.prodOldPrice} </span>
	                                    <span>&#8377;${cartItemDetails.prodPrice}</span>
	                                </p>
	                                
	                            </div>
	                        </div>
	                        <!-- ITEM CARD END -->
                        </c:if>
                        <!-- PAY ORDER FOR LIST OF PRODUCTS END -->
                        
                    </div>
                <!-- CART BODY END -->

                <!-- CART FOOTER START -->
                <div class="card-footer">
                	<p>
                		Order confirmation email will be send to <b>${userDetails.email}</b>
                	</p>
                    <a href="" id="btn-continue">Continue</a>
                </div>
                <!-- CART FOOTER END -->
                
                <!-- PAY OPTIONS START -->
                <div class="pay-op-container" id="pay-op-container">
           
           			<!-- PAY OPTIONS BUTTONS START -->
		            <div class="pay-op">
		                <button class="btn" id="btn-upi" disabled>UPI</button>
		                <button class="btn selected-btn" id="btn-cr-dr">Credit / Debit / ATM Card</button>
		                <button class="btn" id="btn-cod">Cash On Delivery</button>
		            </div>
					<!-- PAY OPTIONS BUTTONS END -->
					
					<!-- UPI OPTION START -->
		            <div class="op-upi" id="op-upi">
		                <h3>UPI</h3>
		                <div class="flex-div">
		                    <div class="upi-div">
		                        <img src="https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=www.google.com">
		                    </div>
		                </div>
		                <div style="text-align: center; margin-top: 10px;">
		                    <p>Scan QR Code to Pay</p>
		                </div>
		            </div>
					<!-- UPI OPTION END -->
					
					<!-- OPTION CREDIT DEBIT ATM CARD START -->
		            <div class="op-cr-dr show" id="op-cr-dr">
		                <h3>Credit / Debit / ATM Card</h3>
		                
		                <!-- PAY ORDER FOR LIST OF PRODUCTS START -->
		                <c:if test="${not empty cartItems}">
			                <sp:form action="${pageContext.request.contextPath}/order/pay-mass" method="get" modelAttribute="cardDetails" class="cr-dr-div">
			                    
			                    <sp:input path="cardNumber" type="number" id="field-card-number" placeholder="Enter Card Number"/>
			
			                    <div class="feild-group">
			                        <div class="valid-m-y">
			                            <p>Valid thru</p>
			                            <sp:select path="validMonth" id="mm">
			                                <sp:option value="0">MM</sp:option>
			                                <sp:option value="1">1</sp:option>
			                                <sp:option value="2">2</sp:option>
			                                <sp:option value="3">3</sp:option>
			                                <sp:option value="4">4</sp:option>
			                                <sp:option value="5">5</sp:option>
			                                <sp:option value="6">6</sp:option>
			                                <sp:option value="7">7</sp:option>
			                                <sp:option value="8">8</sp:option>
			                                <sp:option value="9">9</sp:option>
			                                <sp:option value="10">10</sp:option>
			                                <sp:option value="11">11</sp:option>
			                                <sp:option value="12">12</sp:option>
			                            </sp:select>
			
			                            <sp:select path="validYear" id="yy">
			                                <sp:option value="0">yy</sp:option>
			                                <sp:option value="22">22</sp:option>
			                                <sp:option value="23">23</sp:option>
			                                <sp:option value="24">24</sp:option>
			                                <sp:option value="26">26</sp:option>
			                                <sp:option value="27">27</sp:option>
			                                <sp:option value="28">28</sp:option>
			                                <sp:option value="29">29</sp:option>
			                                <sp:option value="30">30</sp:option>
			                                <sp:option value="31">31</sp:option>
			                                <sp:option value="32">32</sp:option>
			                                <sp:option value="33">33</sp:option>
			                                <sp:option value="34">34</sp:option>
			                                <sp:option value="35">35</sp:option>
			                                <sp:option value="36">36</sp:option>
			                                <sp:option value="37">37</sp:option>
			                                <sp:option value="38">38</sp:option>
			                                <sp:option value="39">39</sp:option>
			                                <sp:option value="40">40</sp:option>
			                            </sp:select>
			                        </div>
			                    </div>
			
			                    <sp:input path="cvvNumber" type="number" id="cvv" placeholder="CVV"/>
			                    
			                    <div class="cr-dr-pay-btn-box">
			                    	<button type="submit" id="btn-pay">Pay</button>
			                    </div>
			                    
			                </sp:form>
		                </c:if>
		                <!-- PAY ORDER FOR LIST OF PRODUCTS END -->
		                
		                <!-- PAY ORDER FOR SOLO PRODUCT START -->
		                 <c:if test="${not empty cartItemDetails}">
			                <sp:form action="${pageContext.request.contextPath}/order/pay-solo/${cartItemDetails.prodModel}" method="get" modelAttribute="cardDetails" class="cr-dr-div">
			                    
			                    <sp:input path="cardNumber" type="number" id="field-card-number" placeholder="Enter Card Number"/>
			
			                    <div class="feild-group">
			                        <div class="valid-m-y">
			                            <p>Valid thru</p>
			                            <sp:select path="validMonth" id="mm">
			                                <sp:option value="0">MM</sp:option>
			                                <sp:option value="1">1</sp:option>
			                                <sp:option value="2">2</sp:option>
			                                <sp:option value="3">3</sp:option>
			                                <sp:option value="4">4</sp:option>
			                                <sp:option value="5">5</sp:option>
			                                <sp:option value="6">6</sp:option>
			                                <sp:option value="7">7</sp:option>
			                                <sp:option value="8">8</sp:option>
			                                <sp:option value="9">9</sp:option>
			                                <sp:option value="10">10</sp:option>
			                                <sp:option value="11">11</sp:option>
			                                <sp:option value="12">12</sp:option>
			                            </sp:select>
			
			                            <sp:select path="validYear" id="yy">
			                                <sp:option value="0">yy</sp:option>
			                                <sp:option value="22">22</sp:option>
			                                <sp:option value="23">23</sp:option>
			                                <sp:option value="24">24</sp:option>
			                                <sp:option value="26">26</sp:option>
			                                <sp:option value="27">27</sp:option>
			                                <sp:option value="28">28</sp:option>
			                                <sp:option value="29">29</sp:option>
			                                <sp:option value="30">30</sp:option>
			                                <sp:option value="31">31</sp:option>
			                                <sp:option value="32">32</sp:option>
			                                <sp:option value="33">33</sp:option>
			                                <sp:option value="34">34</sp:option>
			                                <sp:option value="35">35</sp:option>
			                                <sp:option value="36">36</sp:option>
			                                <sp:option value="37">37</sp:option>
			                                <sp:option value="38">38</sp:option>
			                                <sp:option value="39">39</sp:option>
			                                <sp:option value="40">40</sp:option>
			                            </sp:select>
			                        </div>
			                    </div>
			
			                    <sp:input path="cvvNumber" type="number" id="cvv" placeholder="CVV"/>
			                    
			                    <div class="cr-dr-pay-btn-box">
			                    	<button type="submit" id="btn-pay">Pay</button>
			                    </div>
			                    
			                </sp:form>
		                </c:if>
		                <!-- PAY ORDER FOR SOLO PRODUCT END -->
		            </div>
		            <!-- OPTION CREDIT DEBIT ATM CARD END -->
					
					<!-- OPTION COD START -->
					<c:if test="${not empty cartItems}">
		            <div class="op-cod" id="op-cod">
		                <div class="op-cod-inner-box">
		                    <h3>Cash On Delivery</h3>
		                    <a href="${pageContext.request.contextPath}/order/confirm-order-mass" id="btn-conf-order">Confirm Order</a>
		                </div>
		            </div>
		            </c:if>
		            
		            <c:if test="${not empty cartItemDetails}">
		            <div class="op-cod" id="op-cod">
		                <div class="op-cod-inner-box">
		                    <h3>Cash On Delivery</h3>
		                    <a href="${pageContext.request.contextPath}/order/confirm-order-solo/${cartItemDetails.prodModel}" id="btn-conf-order">Confirm Order</a>
		                </div>
		            </div>
		            </c:if>
		            <!-- OPTION COD END -->
		            
		        </div>
                <!-- PAY OPTIONS END -->
                
            </div>
            <!-- MY CART END -->
            
            <!-- PRODUCT DETAILS START -->
            <c:if test="${not empty priceDetails}">
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
            </c:if>
            <!-- PRODUCT DETAILS END -->
            
        </div>
		
    </div>
	 
	<jsp:include page="footer.jsp"></jsp:include>
	
	<script type="text/javascript">
	
	var btnContinue = document.getElementById("btn-continue"); 
	const payOptionContainer = document.getElementById("pay-op-container");
		
    const btnUpi = document.getElementById("btn-upi");
    const btnCrDr = document.getElementById("btn-cr-dr");
    const btnCod = document.getElementById("btn-cod");

    const opUpi = document.getElementById("op-upi");
    const opCrdr = document.getElementById("op-cr-dr");
    const opCod = document.getElementById("op-cod");

    btnContinue.addEventListener('click', (e)=> {
    	
    	e.preventDefault();
    	
    	payOptionContainer.classList.toggle("show");
    	
    	if(payOptionContainer.classList.contains("show")) {
    		btnContinue.innerText = "Cancel";
    	}
    	else {
    		btnContinue.innerText = "Continue";
    	}
    });
    
    btnUpi.addEventListener('click', (e)=> {

        e.preventDefault();

        opUpi.classList.add('show');
        btnUpi.classList.add('selected-btn');
        opCod.classList.remove('show');
        btnCod.classList.remove('selected-btn');
        opCrdr.classList.remove('show');
        btnCrDr.classList.remove('selected-btn');
    });

    btnCrDr.addEventListener('click', (e)=> {

        e.preventDefault();

        opCrdr.classList.add('show');
        btnCrDr.classList.add('selected-btn');
        opUpi.classList.remove('show');
        btnUpi.classList.remove('selected-btn');
        opCod.classList.remove('show');
        btnCod.classList.remove('selected-btn');
    });

    
    btnCod.addEventListener('click', (e)=> {

        e.preventDefault();

        opCod.classList.add('show');
        btnCod.classList.add('selected-btn');
        opUpi.classList.remove('show');
        btnUpi.classList.remove('selected-btn');
        opCrdr.classList.remove('show');
        btnCrDr.classList.remove('selected-btn');
    });
	
	</script>
</body>
</html>