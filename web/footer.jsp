<%-- 
    Document   : footer
    Created on : May 25, 2024, 4:41:33 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            :root {
                --green-color: rgb(139, 197, 63);
                --dark-green-color: rgb(19, 149, 79);
            }

            .footer {
                background-color: var(--dark-green-color);
                color: white;
                height: auto;
                font-size: 22px;
                line-height: 70px;
                font-weight: 500;
                margin-top: 50px;
            }

            .row{
                padding-top: 5%;
                margin: 0;
            }

            .second-footer a{
                text-decoration: none;
                color: white;
            }

            .second-footer p :hover{
                color: rgb(240, 241, 243);
            }

            .third-footer iframe {
                width: 300px;
                height: 300px;
            }
            @media only screen and (max-width: 500px){
                .row {
                    padding: 0;
                }
            }
        </style>
    </head>
    <body>
        <div class="footer">
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="first-footer col-lg-4">
                    <h3>Liên hệ</h3>
                    <p><i class="fas fa-phone-alt"></i> 0393377251</p>
                    <p><i class="fas fa-map-marker-alt"></i> Đại học FPT</p>
                    <p><i class="far fa-envelope"></i> anhtdhe172879@fpt.edu.vn</p>
                </div>
                <div class="second-footer col-lg-3">
                    <h3>Tìm chúng tôi trên</h3>
                    <p><a href="https://www.facebook.com/thegioisteak" target="_blank"><i class="fab fa-facebook-f"></i> Facebook</a></p>
                    <p><a href="https://www.youtube.com/channel/UC93KYphETAMcP2TiD5-1V_A" target="_blank"><i class="fab fa-youtube"></i> Youtube</a></p>
                    <p><a href="https://www.tiktok.com/@thegioisteak" target="_blank"><i class="fab fa-tiktok"></i> Tiktok</a></p>
                </div>
                <div class="third-footer col-lg-3">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.506218150548!2d105.52041828599603!3d21.012421638417873!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abc60e7d3f19%3A0x2be9d7d0b5abcbf4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgSMOgIE7hu5lp!5e0!3m2!1svi!2s!4v1716650233427!5m2!1svi!2s" 
                            width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
                    </iframe>
                </div>
            </div>
        </div>
    </body>
</html>