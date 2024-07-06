<%-- 
    Document   : verify
    Created on : Jul 4, 2024, 12:10:12 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        body{
            background: url(images/bannerLogin2.jpg) no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: 'Arial', sans-serif;
        }
        form{
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        form p {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        input[type=text] {
            --w: 1ch;
            --g: .15em;
            --b: 2px;
            --n: 6;
            --c: #888;
            font-size: 50px;
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
            --c: #0EA049;
            box-shadow: 0 0 8px rgba(123, 44, 191, 0.2);
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
            border-radius: 25px;
            font-size: 20px;
            color: white;
            text-align: center;
            margin-top: 30px;
            margin-left:  37%;
            border: none;
            cursor: pointer;
            background-color: #04AA6D;
            transition: background-color 0.3s ease;
        }
/*        input[type=submit] {
            display: block;
            width: 150px;
            height: 50px;
            border-radius: 25px;
            font-size: 18px;
            font-weight: bold;
            text-align: center;
            background-color: #04AA6D;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 20px;
        }*/
        input[type=submit]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <form action="VerifyCode" method="post">
        <p>OTP Verification</p>
        <p>Code has been sent to your email!!!</p>
        <input type="text" name="authcode" maxlength="6">
        <input type="submit" value="Verify" >
    </form>
</body>
</html>
