<%-- 
    Document   : verify
    Created on : Jul 4, 2024, 12:10:12 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        body{
            background: url(images/bannerLogin2.jpg);
            background-repeat: no-repeat;
            background-size: 100% 100vh;
        }
        form{
            background-color: white;
            padding: 30px;
            border-radius: 16px;
            padding-right: 0;
        }
        form p {
            font-size: 40px;
            font-weight: bold;
            text-align: center;
            padding-right: 30px;
        }
        input[type=text] {
            --w: 1ch;
            --g: .15em;
            --b: 2px;
            --n: 6;
            --c: #888;
            font-size: 70px;
            line-height: 1.5;
            letter-spacing: var(--w);
            font-family: monospace;
            width: calc(var(--n)*(1ch + var(--w)));
            padding-left: calc((var(--w) - var(--g))/2);
            clip-path: inset(0 calc(var(--w)/2) 0 0);
            background:
                repeating-linear-gradient(90deg,
                var(--c) 0 var(--b), #0000 0,
                calc(1ch + var(--w) - var(--g) - var(--b)), var(--c) 0 calc(1ch + var(--w) - var(--g)), #0000 0 2ch),
                conic-gradient(at calc(100% - var(--g) - 1px) var(--b), #0000 75%, var(--c) 0) 0 0/calc(1ch + var(--w)) calc(100% - var(--b));
            border: none;
            outline: 0;
        }
        input[type=text]:focus-visible {
            --c: #000;
        }
        body {
            margin: 0;
            min-height: 100vh;
            display: grid;
            place-content: center;
        }
        input[type=submit] {
            display: block;
            width: 100px;
            height: 50px;
            border-radius: 16px;
            font-size: 20px;
            text-align: center;
            margin-top: 30px;
            margin-left:  37%;
        }
    </style>
</head>
<body>
    <form action="VerifyCode" method="post">
        <p>OTP Verification</p>
        <input type="text" name="authcode" maxlength="6">
        <p style="font-size: 20px; color: red;"><c:out value="${requestScope.verifyFail}"/></p>
        <input type="submit" value="Verify" >
    </form>
</body>
</html>
