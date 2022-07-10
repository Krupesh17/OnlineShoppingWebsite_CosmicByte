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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"/>
    <link rel="icon" href="https://cfassets.kartrocket.co/all-stores/image_cosmic/data/logo/transparent-logo.png?v=768c75194e238a7b61f0342b425ca295"/>
    <title>Headphones</title>
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

      .no-products {
      	padding: 20px;
      	color: red;
          text-align: center;
      }

      .container {
          min-height: 100vh;
      }

      .products-container {
          display: grid;
          grid-template-columns: 19.7% 19.7% 19.7% 19.7% 19.7%;
          gap: 5px;
          margin-top: 5px;
      }

      .product {
          background-color: #fafafa;
          padding: 10px;
          border: 1px solid #e0e0e0;
      }

      .image-container {
      	  position: relative;
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
            font-size: 13px
       }

      .image-container img {
          width: 100%;
          cursor: pointer;
      }

      .info-container > .product-name {
          display: inline-block;
          word-wrap: break-word;
          margin: 10px 0;
          color: #262626;
          cursor: pointer;
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



  /* Top Navigation Bar CSS */
      	.product-nav-bar {
			border-bottom: 1px solid #ccc;
			padding: 10px;
			display:flex;
			justify-content: space-between;
			background-color: white;
		}
		
		.product-nav-sub-bar {
			padding: 10px;
			display:flex;
			justify-content: center;
			background-color: white;
			border-bottom: 1px solid #ccc;
		}
		
		.search-field {
			width: 80%;
			display: flex;
			justify-content: center;
		}
		
		#search-input {
			border-bottom: 1px solid #dbdbdb;
			width: 100%;
			margin-right: 5px
		}
		
		#btn-search {
			padding: 8px 8px;
			display: flex;
			justify-content: center;
			background-color: #fba819;
			border-radius: 50px;
		}
		
		#btn-search:hover {
			background-color: #e09616;
		}
      
      	.drop-down-categories {
		    position: relative;
		    display: inline-block;
		}
		
		.drop-down-sortBy {
		    float: right;
		    position: relative;
		}
		
		.drop-btn-categories,
		.drop-btn-sortBy {
		    padding: 5px 10px;
		    background-color: #efefef;
		    cursor: pointer;
		}   
		
		.drop-btn-categories span,
		.drop-btn-sortBy span {
		    vertical-align: middle;
		}
		
		.drop-btn-categories:hover,
		.drop-btn-sortBy:hover {
		    background-color: #e4e4e4;
		}
		
		.categories-drop-down-content,
		.sortBy-drop-down-content {
		    display: none;
		    position: absolute;
		    background-color: #f1f1f1;
		    min-width: 280px;
		    overflow: auto;
		    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		    z-index: 1;
		}
		
		.sortBy-drop-down-content {
		    right: 0;
		    min-width: 160px;
		}
		
		.categories-drop-down-content a,
		.sortBy-drop-down-content a {
		    color: black;
		    padding: 10px;
		    display: block;
		    font-size: 14px;
		    border-bottom: 1px solid #dddddd;
		}
		
		.categories-drop-down-content a:hover,
		.sortBy-drop-down-content a:hover {
		    background-color: #ddd;
		}
		
		#sortBy-label {
		    font-size: 15px;
		}
		
		.show {
		    display: block;
		}
		
		#l-all {
			display: flex;
			justify-content: space-between;
		}


      @media all and (max-width: 1200px) {
          .products-container {
              grid-template-columns: 24.7% 24.7% 24.7% 24.7%;
          }
      }

      @media all and (max-width: 880px) {
          .products-container {
              grid-template-columns: 33% 33% 33%;
          }
      }

      @media all and (max-width: 680px) {
          .products-container {
              grid-template-columns: 50% 50%;
          }
      }

      @media all and (max-width: 480px) {
          .products-container {
              grid-template-columns: 100%;
          }
      }
	</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section class="container">
    	
    	<!-- Navigation Bar Start -->
    	<div class="product-nav-bar">
    		<div class="drop-down-categories">
    			<button class="drop-btn-categories" id="dropdown-btn-categories">Categories <span id="dropdown-1-arrow" class="material-symbols-outlined">expand_more</span></button>
                <div class="categories-drop-down-content" id="categories-drop-down">
                    <a href="${pageContext.request.contextPath}/product/headphonesType/USB Gaming Headset">USB Gaming Headsets</a>
                    <a href="${pageContext.request.contextPath}/product/headphonesType/Gaming Headset">Gaming Headsets</a>
                    <a href="${pageContext.request.contextPath}/product/headphonesType/Music Headphone">Music Headphones</a>
                    <a href="${pageContext.request.contextPath}/product/headphonesType/Gaming Earphone">Gaming Earphones</a>
                    <a href="${pageContext.request.contextPath}/product/headphonesType/Headphone Stand">Headphone Stands</a>
                    <a href="${pageContext.request.contextPath}/product/headphones_accessories" id="l-all"><span>List All Products</span><span>&#10140;</span></a>
                  </div>
    		</div>
    		
    		<div class="drop-down-sortBy"> 
                <button class="drop-btn-sortBy" id="dropdown-btn-sortBy">Sort By <span id="dropdown-2-arrow" class="material-symbols-outlined">expand_more</span></button></button>
                <div class="sortBy-drop-down-content" id="sortBy-drop-down">
                    <a href="${pageContext.request.contextPath}/product/headphones_accessories">Default</a>
                    <a href="${pageContext.request.contextPath}/product/headphones/lowtohigh">Price (Low to High)</a>
                    <a href="${pageContext.request.contextPath}/product/headphones/hightolow">Price (High to Low)</a>
                </div>
    		</div>
    	</div>
    	
    	<div class="product-nav-sub-bar">
    		<form action="${pageContext.request.contextPath}/product/search/h-accessory" method="get" class="search-field">
    			<input type="search" placeholder="Search" name="search" id="search-input">
    			<button type="submit" id="btn-search"><span class="material-symbols-outlined">search</span></button>
    		</form>
    	</div>
    	<!-- Navigation Bar End -->
    	
    	<!-- Products Container Start -->
    	<c:if test="${empty products}">
    		<div class="no-products">
    			<h4>Sorry no products available...!</h4>
    		</div>
    	</c:if>
    	
   		<c:if test="${not empty products}">
    	
	    	<!-- Products Container Start -->
	    	<div class="products-container">
				
				<c:forEach items="${products}" var="product">
	            <!-- Product Card Start -->
	            <div class="product" onclick="window.location='${pageContext.request.contextPath}/product/productId/${product.prodId}'">
	                <div class="image-container">
	                    <img src="${product.prodImage}" alt="Product Image" title="${product.prodName}">
	                    
	                    <c:if test="${product.prodOnSale == 'true'}">
		                    <div class="sale-tag">
			                    SALE
			                </div>
		                </c:if>
	                </div>
	                <div class="info-container">
	                    <div class="product-name">
	                        <p class="textMaxLine" title="${product.prodName}">
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
	                        <a href="${pageContext.request.contextPath}/cart/add_to_cart/${product.prodId}" class="btn-cart">Add to Cart</a>
	                        <a href="${pageContext.request.contextPath}/buy/${product.prodId}" class="btn-buy">Buy</a>
	                    </div>
	                </div>
	            </div>
	            <!-- Product Card End -->
	            </c:forEach>
	
	        </div>
	        <!-- Product Container End -->
	        
    	</c:if>
        
    </section>
    
    <jsp:include page="footer.jsp"></jsp:include>
	
	<script type="text/javascript">
    	let linkHeadphonesAccessory = document.getElementById('link-h-accessory');
    	linkHeadphonesAccessory.style.color = "#e9a825";
    </script>
    
    <script type="text/javascript">
	    const categoriesDropdownBtn = document.getElementById('dropdown-btn-categories');
	    const categoriesDropdown = document.getElementById('categories-drop-down');
	    const dropdownArrow1 = document.getElementById('dropdown-1-arrow');
	
	    categoriesDropdownBtn.addEventListener('click', (e)=> {
	        
	        e.preventDefault();
	        categoriesDropdown.classList.toggle('show');
	        
	        if(categoriesDropdown.classList.contains('show')) {
	            dropdownArrow1.innerText = 'expand_less';
	            categoriesDropdownBtn.style.backgroundColor = '#e4e4e4';
	        }
	        else {
	            dropdownArrow1.innerText = 'expand_more';
	            categoriesDropdownBtn.style.backgroundColor = '#efefef';
	        }
	    });
	
	    const sortByDropdownBtn = document.getElementById('dropdown-btn-sortBy');
	    const sortByDropdown = document.getElementById('sortBy-drop-down');
	    const dropdownArrow2 = document.getElementById('dropdown-2-arrow');
	
	    sortByDropdownBtn.addEventListener('click', (e)=> {
	        
	        e.preventDefault();
	        sortByDropdown.classList.toggle('show');
	
	        if(sortByDropdown.classList.contains('show')) {
	            dropdownArrow2.innerText = 'expand_less';
	            sortByDropdownBtn.style.backgroundColor = '#e4e4e4';
	        }
	        else {
	            dropdownArrow2.innerText = 'expand_more';
	            sortByDropdownBtn.style.backgroundColor = '#efefef';
	        }
	    });
	
    </script>
</body>
</html>