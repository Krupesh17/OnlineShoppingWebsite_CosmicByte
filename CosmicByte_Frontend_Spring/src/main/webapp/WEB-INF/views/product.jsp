<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"/>
    <link rel="icon" href="https://cfassets.kartrocket.co/all-stores/image_cosmic/data/logo/transparent-logo.png?v=768c75194e238a7b61f0342b425ca295"/>
    <title>${product.prodName}</title>
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

        .container {
            min-height: 100vh;
            width: 100%;
        }

        .product-container {
            display: flex;
        }

        .product-container > .left-side,
        .product-container > .right-side {
            width: 50%;
            padding: 10px;
        }

        .product-container > .left-side {
            position: relative;
        }

        .sale-tag {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: #d20f0f;
            padding: 9px 5px;
            color: white;
            border-radius: 50px;
            font-size: 13px;
        }

        .product-container > .left-side > img {
            display: block;
            width: 70%;
            margin: 0 auto;
        }

        .product-container > .right-side {
            background-color: #f6f6f6;
            min-height: 100vh;
        }

        .product-container > .right-side > .product-info {
            color: #363636;
        }

        .right-side > .product-info > .info-1 {
            margin: 30px 0;
        }

        .product-info > .info-1 > #product-code {
            margin: 2px 0;
        }

        .product-info > .info-1 > #availability > #in-stock {
            color: #50da00;
        }
        
        .product-info > .info-1 > #availability > #out-stock {
        	color: red;
        }

        .right-side > .product-info > .info-2 {
            font-size: 14px;
            margin-bottom: 3px;
        }

        .product-info > .info-3 > #product-price {
            margin-bottom: 30px;
        }

        .product-info > .info-3 > #product-price > span {
            text-decoration: line-through;
            font-size: 16px;
            color: #8e8e8e;
        }

        .product-info > .info-3 > #product-price > b {
            font-size: 20px;
        }

        #btn-drop {
            background-color: #ececec;
            color: #363636;
            padding: 5px 10px;
            width: 100%;
            font-size: 16px;
            font-weight: 600;
            display: flex;
            justify-content: space-between;
        }

        #btn-drop:hover {
            background-color: #e4e4e4;
        }

        .drop-down {
            display: none;
            border: 1px solid #e4e4e4;
            padding: 5px 10px;
            background-color: white;
        }

        .show {
            display: block;
        }

        .btn-groups {
            margin-top: 30PX;
        }

        .btn-groups > .btn-group-1 > .inner-group-1,
        .btn-groups > .btn-group-2 > .inner-group-2 {
            display: flex;
            justify-content: space-between;
        }

        .btn-group-1 > .inner-group-1 > #btn-toCart,
        .btn-group-1 > .inner-group-1 > #btn-buy {
            width: 50%;
            margin: 0 2px;
            margin-bottom: 4px;
            text-align: center;
            padding: 5px 10px;
        }

        .inner-group-1 > #btn-toCart {
            color: white;
            background-color: #282828;
        }
        
        #btn-toCart:hover {
        	background-color: #000000; 
        }
        
        .inner-group-1> #btn-buy {
            color: white;
            background-color: #fba819;
        }
        
        #btn-buy:hover {
        	background-color: #e09616;
        }

        .btn-group-2 > .inner-group-2> #btn-edit, 
        .btn-group-2 > .inner-group-2> #btn-delete {
            width: 50%;
            margin: 0 2px;
            text-align: center;
            padding: 5px 10px;
        }

        .inner-group-2> #btn-edit {
            color: white;
            background-color: #2b5cc6; 
        }
        
        #btn-edit:hover {
        	background-color: #2650ab;
        }

        .inner-group-2> #btn-delete {
            color: white;
            background-color: #d80101;
        }

        #btn-delete:hover {
        	background-color: #bf0000;
        }
		
        @media all and (max-width: 880px) {
            .product-container {
                flex-direction: column;
            }

            
            .product-container > .left-side,
            .product-container > .right-side {
                width: 100%;
            }
        }

    </style>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	
    <section class="container">
        <div class="product-container">
            <div class="left-side">
                <img src="${product.prodImage}" alt="${product.prodName}">
                <c:if test="${product.prodOnSale == 'true'}">
                    <div class="sale-tag">
	                    SALE
	                </div>
                </c:if>
            </div>

            <div class="right-side">

                <div class="product-info">

                    <div class="product-name">
                        <h2>${product.prodName}</h2>
                    </div>

                    <div class="info-1">
                        <p id="brand"><b>Brand: </b><span>${product.prodBrand}</span></p>
                        <p id="product-code"><b>Product Code: </b><span>${product.prodCode}</span></p>
                        <c:if test="${product.prodAvailability == 'true'}">
                        	<p id="availability"><b>Availability: </b><b id="in-stock">In Stock</b></p>
                        </c:if>
                        <c:if test="${product.prodAvailability == 'false'}">
                        	<p id="availability"><b>Availability: </b><b id="out-stock">Out of Stock</b></p>
                        </c:if>
                    </div>

                    <div class="info-2">
                        <p>
                            Accepted payments: Cash on Delivery and Online Payment <br>
                            Delivery In: 2-8 Business Days <br>
                            Replacement Policy: 7 Days replacement Policy against Manufacturing Defects <br>
                        </p>
                    </div>

                    <div class="info-3">
                        <p id="product-price"><span>&#8377;${product.prodOldPrice}</span> <b>&#8377;${product.prodPrice}</b></p>
                    </div>

                    <div class="info-4">
                        <div class="description-dropdown">
                            <button id="btn-drop"><span>Description</span><span id="arrow"  class="material-symbols-outlined">expand_more</span></button>
                            <div class="drop-down" id="drop-down">
                                <p>
                                    ${product.prodDescription}
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="btn-groups">
                        <div class="btn-group-1">
                            <div class="inner-group-1">
                                <a href="${pageContext.request.contextPath}/cart/add_to_cart/${product.prodId}" id="btn-toCart">Add to  Cart</a>
                                <a href="" id="btn-buy">Buy Now</a>
                            </div>
                        </div>
                        
                        <sec:authorize access="hasAuthority('admin')">
                        <div class="btn-group-2">
                            <div class="inner-group-2">
                                <a href="${pageContext.request.contextPath}/product/edit/${product.prodId}" id="btn-edit">Edit</a>
                                <a href="${pageContext.request.contextPath}/product/delete/${product.prodId}" id="btn-delete">Delete</a>
                            </div>    
                        </div>
                        </sec:authorize>
                    </div>

                </div>

            </div>
        </div>
    </section>
    
    <jsp:include page="footer.jsp"></jsp:include>

    <script>
        let btnDrop = document.getElementById('btn-drop');
        let dropDown = document.getElementById('drop-down');
        let arrow = document.getElementById('arrow');
        btnDrop.addEventListener('click', ()=> {
            dropDown.classList.toggle('show');

            if(dropDown.classList.contains('show')) {
                arrow.innerText = 'expand_less';
            }
            else {
                arrow.innerText = 'expand_more';
            }
             
        });
    </script>
</body>
</html>