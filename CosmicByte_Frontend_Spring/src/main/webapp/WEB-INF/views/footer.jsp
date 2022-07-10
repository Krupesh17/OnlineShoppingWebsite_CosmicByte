<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="https://cfassets.kartrocket.co/all-stores/image_cosmic/data/logo/transparent-logo.png?v=768c75194e238a7b61f0342b425ca295"/>
    <title>Footer</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            border: none;
            outline: none;
            list-style: none;
            text-decoration: none;
            font-family: 'Poppins', sans-serif;
        }

        footer {
        	margin-top: 10px;
            background-color: black;
            color: white;
            padding: 10px;
        }

        .flex-container {
            display: flex;
        }

        footer > .flex-container > .left-side {
            margin-right: 5px;
            padding: 10px 5px;
            width: 60%;
        }

        footer > .flex-container > .right-side {
            margin-left: 5px;
            padding: 10px;
            width: 40%;
        }

        .contact-us-form > input {
            width: 100%;
            padding: 5px;
            margin-bottom: 10px;
        }   

        .contact-us-form > textarea {
            width: 100%;
            padding: 5px;
        }

        .contact-us-form > button {
            width: 100%;
            padding: 4px 5px;
            margin-top: 4px;
            font-size: 16px;
            background-color: #fba819;
            color: white;
            cursor: pointer;
        }

        .contact-us-form > button:hover {
            background-color: #e09616;
        }


        .inner-flex-container {
            display: flex;
        }

        .inner-flex-container a {
            font-size: 16px;
            color: #777777;
            cursor: pointer;
        }

        .inner-flex-container a:hover {
            color: #fba819;
        }

        .inner-flex-container .information-div,
        .inner-flex-container .get-help-div,
        .inner-flex-container .order-info-div {
            margin: 0 15px;
        }

        .inner-flex-container .information-div {
            margin-left: 5px;
        }

        .social-btn-group {
            display: flex;
        }

        .social-btn { 
            display: flex; 
            justify-content: center; 
            padding: 10px;
            margin: 0 10px;
            background-color: #fba819;
            border-radius: 1px;
            margin-bottom: 10px;
            border-radius: 50px;
        }

        .social-btn > img {
            width: 20px;
        }

        .social-btn:hover {
            background-color: #e09616;
        }
        
        #btn-fb:hover {
        	background-color: #38569e;
        }
        
        #btn-tw:hover {
        	background-color: #179cf0;
        }
        
        #btn-yt:hover {
        	background-color: #ff0000;
        }
        
        #btn-ig:hover {
        	background: linear-gradient(to bottom right, #4f5fd0 0%, #d92d7b 100%);
        }

        .bottom-div {
            padding: 10px;
            color: #777777;
            border-top: 1px solid #777777;
        }

        @media all and (max-width: 680px) {
            .flex-container {
                flex-direction: column;
            }

            footer > .flex-container > .left-side,
            footer > .flex-container > .right-side {
                width: 100%;
                margin: 5px 0;
            }

            .inner-flex-container {
                flex-direction: column;
            }

            .inner-flex-container .get-help-div,
            .inner-flex-container .order-info-div {
                margin: 0 5px;
                margin-top: 10px;
            }
        }
    </style>
</head>
<body>
    <footer>
        <div class="flex-container">
            <div class="left-side">
                <div class="inner-flex-container">

                    <div class="information-div">
                        <h2 style="margin: 0 0 10px 0;">INFORMATION</h2>
                        <ul>
                            <li><a href="">Disclaimer Policy</a></li>
                            <li><a href="">Privacy Policy</a></li>
                            <li><a href="">Shipping And Return Policy</a></li>
                            <li><a href="">Warranty Terms & Conditions</a></li>
                            <li><a href="">Terms And Conditions</a></li>
                            <li><a href="">Careers</a></li>
                        </ul>
                    </div>

                    <div class="get-help-div">
                        <h2 style="margin: 0 0 10px 0;">GET HELP</h2>
                        <ul>
                            <li><a href="">Contact Us</a></li>
                            <li><a href="">Download Drivers</a></li>
                            <li><a href="">Shipping And Return Policy</a></li>
                            <li><a href="">Product Registration</a></li>
                            <li><a href="">E-Waste Management</a></li>
                        </ul>
                    </div>

                    <div class="order-info-div">
                        <h2 style="margin: 0 0 10px 0;">ORDER INFO</h2>
                        <ul>
                            <li><a href="">Warranty And Customer Service</a></li>
                            <li><a href="">My Account</a></li>
                            <li><a href="">Vendor</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="right-side">
                <h2 style="margin: 0 0 10px 0;">CONTACT US</h2>
                <form action="" class="contact-us-form">
                    <input type="text" placeholder="Email Address">
                    <textarea name="message" id="" cols="30" rows="4" placeholder="Type your message here..."></textarea>
                    <button type="submit" id="btn-send">Send</button>
                </form>

                <h2 style="margin: 20px 0 10px 0;">CONNECT WITH US</h2>
                <div class="social-btn-group">
                    <a href="https://www.facebook.com/thecosmicbyte/" target="_blank" class="social-btn" id="btn-fb" style="margin-left: 0;">
                        <img src="https://cdn-icons-png.flaticon.com/512/59/59439.png" alt="Facebook-icon">
                    </a>

                    <a href="https://twitter.com/cosmicbyteindia" target="_blank" class="social-btn" id="btn-tw">
                        <img src="https://cdn-icons-png.flaticon.com/512/81/81609.png" alt="Twitter-icon">
                    </a>

                    <a href="https://www.youtube.com/channel/UCFeB8pjzEzulADZZIyLC4Dg" target="_blank" class="social-btn" id="btn-yt">
                        <img src="https://cdn-icons-png.flaticon.com/512/152/152810.png" alt="YouTube-icon"> 
                    </a>

                    <a href="https://www.instagram.com/thecosmicbyte/" target="_blank" class="social-btn" id="btn-ig">
                        <img src="https://cdn-icons-png.flaticon.com/512/87/87390.png?w=360" alt="Instagram-icon">
                    </a>
                </div>
            </div>
        </div>
        <div class="bottom-div">
            <span>Cosmic Byte © Copyright 2018</span>
        </div>
    </footer>
</body>
</html>