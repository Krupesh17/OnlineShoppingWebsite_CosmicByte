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
<title>Add New Product</title>
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
        width: 100%;
    }

    .top-bar {
        padding: 5px;
        border-bottom: 1px solid #e9e9e9;
        margin-bottom: 10px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: white;
    }

    .top-bar .btn-group > #btn-add-product {
        background-color: #262626;
        color: white;
        padding: 5px 10px;
        font-size: 16px;
        cursor: pointer;
        margin-right: 5px;
    }

    .top-bar .btn-group > #btn-add-product:hover {
        background-color: #000000;
    }

    .top-bar .btn-group > #btn-reset {
        background-color: #e9e9e9;
        color: #161616;
        padding: 5px 10px;
        cursor: pointer;
        font-size: 16px;
    }

    .top-bar .btn-group > #btn-reset:hover {
        background-color: #dedede;
    }

    .box > .inner-box {
        margin: 0 10px;
        margin-bottom: 10px;
    }

    .box .inner-box > label {
        display: block;
        margin-bottom: 2px;
        font-size: 14px;
    }

    .box .inner-box > input[type="text"] {
        border: 1px solid #dbdbdb;
        width: 100%;
        font-size: 14px;
        padding: 5px;
    }

    .flex-box {
        display: flex;
        margin: 0 10px;
        margin-bottom: 10px;
    }

    .flex-box > .inner-box-left {
        width: 50%;
        margin-right: 3px;
    }

    .flex-box > .inner-box-right {
        width: 50%;
        margin-left: 3px;
    }

    .flex-box label {
        display: block;
        margin-bottom: 2px;
        font-size: 14px;
    }

    .flex-box input[type="text"] {
        border: 1px solid #dbdbdb;
        width: 100%;
        font-size: 14px;
        padding: 5px;
    }

    .text-area-box {
        margin: 0 10px;
        margin-bottom: 10px;
    }

    .text-area-box > label {
        display: block;
        margin-bottom: 2px;
        font-size: 14px; 
    }

    .text-area-box > textarea {
        border: 1px solid #dbdbdb;
        width: 100%;
        padding: 5px;
        font-size: 14px;
    }

    .selecter {
        width: 100%;
        border: 1px solid #dbdbdb;
        font-size: 16px;
        padding: 6px 5px;
        cursor: pointer;

        /* Replace default styling (arrow) */
        appearance: none;
        -webkit-appearance: none;
        -moz-appearance: none;
    }

    .btn-group-2 {
        display: none;
        margin: 0 10px;
        margin-bottom: 10px;
    }

    .btn-group-2 #btn-add-product-block {
        width: 100%;
        padding: 5px 10px;
        background-color: #262626;
        color: white;
        font-size: 16px;
        cursor: pointer;
    }

    .btn-group-2 #btn-add-product-block:hover {
        background-color: #000000;
    }

    .btn-group-2 #btn-reset-block {
        width: 100%;
        padding: 5px 10px;
        background-color: #e9e9e9;
        color: #161616;
        font-size: 16px;
        cursor: pointer;
    }

    .btn-group-2 #btn-reset-block:hover {
        background-color: #dedede;
    }
    
    .text-red {
    	color: red;
    	text-align: left;
    	font-size: 14px
    }

    @media all and (max-width: 480px) {
        .flex-box {
            flex-direction: column;
        }

        .flex-box > .inner-box-left {
            width: 100%;
            margin-right: 0;
            margin-bottom: 10px;
        }

        .flex-box > .inner-box-right {
            width: 100%;
            margin-left: 0;
            margin-bottom: 10px
        }

        .btn-group {
            display: none;
        }

        .btn-group-2 {
            display: block;
        }
    }
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="container">
  
        <sp:form action="${pageContext.request.contextPath}/product/add" method="post" modelAttribute="product" class="add-product-form">

		<div class="top-bar">
            <h3>Add New Product</h3>
            <div class="btn-group">
                <input type="submit" id="btn-add-product" value="Add Product">
                <input type="reset" id="btn-reset" value="Reset">
            </div>
        </div>

            <div class="box">
                <div class="inner-box">
                    <label for="productName">Product Name</label>
                    <sp:input path="prodName" type="text" name="productName" placeholder="Product Name"/>
                    <sp:errors path="prodName" class="text-red"/>
                </div>
            </div>

            <div class="flex-box">
                <div class="inner-box-left">
                    <label for="productImageLink">Product Image Link</label>
                    <sp:input path="prodImage" type="text" name="productImageLink" placeholder="Product Image Link"/>
                    <sp:errors path="prodImage" class="text-red"/>
                </div>
                <div class="inner-box-right">
                    <label for="productBrand">Product Brand Name</label>
                    <sp:input path="prodBrand" type="text" name="productBrand" placeholder="Product Brand Name"/>
                    <sp:errors path="prodBrand" class="text-red"/>
                </div>
            </div>

            <div class="flex-box">
                <div class="inner-box-left">
                    <label for="productCode">Product Code</label>
                    <sp:input path="prodCode" type="text" name="productCode" placeholder="Product Cade"/>
                    <sp:errors path="prodCode" class="text-red"/>
                </div>
                <div class="inner-box-right">
                    <label for="productType">Product Type</label>
                    <sp:input path="prodType" type="text" name="productType" placeholder="Product Type"/>
                    <sp:errors path="prodType" class="text-red"/>
                </div>
            </div>

            <div class="text-area-box">
                <label for="productDescription">Product Description</label>
                <sp:textarea path="prodDescription" name="productDescription" cols="30" rows="4"></sp:textarea>
                <sp:errors path="prodDescription" class="text-red"/>
            </div>

            <div class="flex-box">
                <div class="inner-box-left">
                    <label for="productOldPrice">Product Old price</label>
                    <sp:input path="prodOldPrice" type="text" name="productOldPrice" placeholder="Product Old Price"/>
                    <sp:errors path="prodOldPrice" class="text-red"/>
                </div>
                <div class="inner-box-right">
                    <label for="productPrice">Product Price</label>
                    <sp:input path="prodPrice" type="text" name="productPrice" placeholder="Product Price"/>
                    <sp:errors path="prodPrice" class="text-red"/>
                </div>
            </div>

            <div class="flex-box">
                <div class="inner-box-left">
                    <label for="productBehaviour">Product Behaviour</label>
                    <sp:input path="prodBehaviour" type="text" name="productBehaviour" placeholder="Product Behaviour"/>
                    <sp:errors path="prodBehaviour" class="text-red"/>
                </div>
                <div class="inner-box-right">
                    <label for="productCategory">Product Category</label>
                    <sp:input path="prodCategory" type="text" name="productCategory" placeholder="Product Category"/>
                    <sp:errors path="prodCategory" class="text-red"/>
                </div>
            </div>
            
            <div class="flex-box">
                <div class="inner-box-left">
                    <label for="productAvailability">Product Availability</label>
                    <sp:select path="prodAvailability" name="productAvailability" class="selecter">
                    	<option>true</option>
                    	<option>false</option>
                    </sp:select>
                    <sp:errors path="prodAvailability" class="text-red"/>
                </div>
                <div class="inner-box-right">
                    <label for="productOnSale">Product On Sale</label>
                    <sp:select path="prodOnSale" name="productAvailability" class="selecter">
                    	<option>true</option>
                    	<option>false</option>
                    </sp:select>
                    <sp:errors path="prodOnSale" class="text-red"/>
                </div>
            </div>

            <div class="btn-group-2">
                <input type="submit" value="Add Product" id="btn-add-product-block">
            </div>

            <div class="btn-group-2">
                <input type="reset" value="Reset" id="btn-reset-block">
            </div>
        </sp:form>
    </div>
	 
	 <jsp:include page="footer.jsp"></jsp:include>
	 
	<!-- JavaScript -->
	<script type="text/javascript">
		let linkAddProduct = document.getElementById('link-addProduct');
		linkAddProduct.style.color = "#e9a825";
	</script>
</body>
</html>