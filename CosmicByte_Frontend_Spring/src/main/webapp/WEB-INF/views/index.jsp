<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Browser Tab Icon -->
<link rel="icon" href="https://cfassets.kartrocket.co/all-stores/image_cosmic/data/logo/transparent-logo.png?v=768c75194e238a7b61f0342b425ca295"/>
<title>Cosmic Byte - Official Brand Store for Cosmic Byte</title>
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

	.index-main-container {
		min-height: 100vh;
        width: 100%;
	}
	
	.index-main-container h3 {
		text-align: center;
		margin: 10px 0 5px 0;
		color: #363636;
	}
	
	.product-slider {
		padding: 10px;
		margin: 0 0 20px 0;
		border: 1px solid #d8d8d8;
		overflow-x: auto; 
	}
	
	.product-container {
        display: flex;
    }

    .product {
        width: 272px;
        border: 1px solid #e0e0e0;
        background-color: #fafafa;
        padding: 10px;
        margin: 0 3px;
    }
    
    .image-container {
    	position: relative;
        width: 250px;
        border: 1px dashed #e0e0e0;
        display: flex;
        justify-content: center;
        align-items: center;
    }
	
	.sale-tag {
        position: absolute;
        top: 8px;
        right: 8px;
        background-color: #d20f0f;
        padding: 9px 5px;
        color: white;
        border-radius: 50px;
        font-size: 13px;
	 }
	
    .image-container > img {
        width: 100%;
    }

    .info-container > .product-name {
        display: inline-block;
        word-wrap: break-word;
        margin: 10px 0;
        color: #262626;
    }

    .product-name .textMaxLine {
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
        overflow: hidden;
    }

    .info-container > .product-price .oldPrice {
        font-size: 16px;
        text-decoration: line-through;
        color: #757575;
    }

    .info-container > .product-price .price {
        font-size: 20px;
        color: #262626;
    }

   .info-container > .btn-group > .btn-cart {
       display: block;
       width: 100%;
       background-color: #282828;
       padding: 5px 10px;
       margin: 10px 0;
       color: white;
       text-align: center;
   }

   .info-container > .btn-group > .btn-buy {
       display: block;
       width: 100%;
       background-color: #fba819;
       padding: 5px 10px;
       color: white;
       text-align: center;
   }
   
   .btn-group > .btn-cart:hover {
   	  background-color: #000000;
   }
   
   .btn-group > .btn-buy:hover {
   	  background-color: #e09616;
   }

    @media all and (max-width: 680px) {
        .product {
            width: 202px;
        }

        .image-container {
            width: 180px;
        }
    }
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<img alt="" src="https://ik.imagekit.io/bfrs/tr:w-1339,h-520,pr-true,cm-pad_resize/image_cosmic/data/banners/Phobos.png" width="100%">
	
	<div class="index-main-container">
		<h3>MOST VIEWED</h3>
		<div class="product-slider">
		
			<div class="product-container">
			
				<c:forEach items="${mostViewedProducts}" var="product">
					<!-- Product Card Start -->
	                <div class="product" onclick="window.location='${pageContext.request.contextPath}/product/productId/${product.prodId}'">
	                    <div class="image-container">
	                        <img src="${product.prodImage}" alt="${product.prodName}">
	                        
	                        <c:if test="${product.prodOnSale == 'true'}">
			                    <div class="sale-tag">
				                    SALE
				                </div>
			                </c:if>
	                    </div>
	                    <div class="info-container">
	                        <div class="product-name">
	                            <p class="textMaxLine">
	                                ${product.prodName}
	                            </p>
	                        </div>
	                        <div class="product-price">
	                            <c:if test="${product.prodOldPrice > 0}">
			                        <p>
			                            <span class="oldPrice">&#8377;${product.prodOldPrice}</span> <b class="price">&#8377;${product.prodPrice}</b>
			                        </p>
			                    </c:if>
			                    <c:if test="${product.prodOldPrice <= 0}">
			                        <p>
			                            <b class="price">&#8377;${product.prodPrice}</b>
			                        </p>
			                    </c:if>
	                        </div>
	                        <div class="btn-group">
	                            <a href="#" class="btn-cart">Add to Cart</a>
	                            <a href="#" class="btn-buy">Buy</a>
	                        </div>
	                    </div>
	                </div>
	                <!-- Product Card End -->
	            </c:forEach>
	            
			</div>
		
		</div>
		
		<h3>BEST SELLER</h3>
		<div class="product-slider">
		
			<div class="product-container">
			
				<c:forEach items="${bestSellerProducts}" var="product">
					<!-- Product Card Start -->
	                <div class="product" onclick="window.location='${pageContext.request.contextPath}/product/productId/${product.prodId}'">
	                    <div class="image-container">
	                        <img src="${product.prodImage}" alt="${product.prodName}">
	                        
	                        <c:if test="${product.prodOnSale == 'true'}">
			                    <div class="sale-tag">
				                    SALE
				                </div>
			                </c:if>
	                    </div>
	                    <div class="info-container">
	                        <div class="product-name">
	                            <p class="textMaxLine">
	                                ${product.prodName}
	                            </p>
	                        </div>
	                        <div class="product-price">
	                            <c:if test="${product.prodOldPrice > 0}">
			                        <p>
			                            <span class="oldPrice">&#8377;${product.prodOldPrice}</span> <b class="price">&#8377;${product.prodPrice}</b>
			                        </p>
			                    </c:if>
			                    <c:if test="${product.prodOldPrice <= 0}">
			                        <p>
			                            <b class="price">&#8377;${product.prodPrice}</b>
			                        </p>
			                    </c:if>
	                        </div>
	                        <div class="btn-group">
	                            <a href="#" class="btn-cart">Add to Cart</a>
	                            <a href="#" class="btn-buy">Buy</a>
	                        </div>
	                    </div>
	                </div>
	            	<!-- Product Card End -->    
	            </c:forEach>
	            
			</div>
			
		</div>
		
		<h3>SPECIAL</h3>
		<div class="product-slider">
		
			<div class="product-container">
			
				<c:forEach items="${specialProducts}" var="product">
					<!-- Product Card Start -->
	                <div class="product" onclick="window.location='${pageContext.request.contextPath}/product/productId/${product.prodId}'">
	                    <div class="image-container">
	                        <img src="${product.prodImage}" alt="${product.prodName}">
	                        
	                        <c:if test="${product.prodOnSale == 'true'}">
			                    <div class="sale-tag">
				                    SALE
				                </div>
			                </c:if>
	                    </div>
	                    <div class="info-container">
	                        <div class="product-name">
	                            <p class="textMaxLine">
	                                ${product.prodName}
	                            </p>
	                        </div>
	                        <div class="product-price">
	                            <c:if test="${product.prodOldPrice > 0}">
			                        <p>
			                            <span class="oldPrice">&#8377;${product.prodOldPrice}</span> <b class="price">&#8377;${product.prodPrice}</b>
			                        </p>
			                    </c:if>
			                    <c:if test="${product.prodOldPrice <= 0}">
			                        <p>
			                            <b class="price">&#8377;${product.prodPrice}</b>
			                        </p>
			                    </c:if>
	                        </div>
	                        <div class="btn-group">
	                            <a href="#" class="btn-cart">Add to Cart</a>
	                            <a href="#" class="btn-buy">Buy</a>
	                        </div>
	                    </div>
	                </div>
	            	<!-- Product Card End -->    
	            </c:forEach>
	            
			</div>
			
		</div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	<!-- JavaScript -->
	<script type="text/javascript">
		let linkHome = document.getElementById('link-home');
		linkHome.style.color = "#e9a825";
	</script>
</body>
</html>
