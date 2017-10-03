<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>HALKOM APPLICATION</title>

        <style>
            #body {
                background: url(include/img/slika1.jpg) no-repeat center center fixed; /* For IE 6 and 7 */
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
            }
        </style>
        <script type="text/javascript">
           
                    window.onbeforeunload =function(e) 
                    {
                      var form = document.createElement("form");
                      var method ="post"; 
                      var aa="/HALKOM/closeEvent";
                      form.setAttribute("method", method);
                      form.setAttribute("action", aa);
                      document.body.appendChild(form);
                      form.submit();

                    };
        </script>

    </head>


    <body id="body" >
         <table  style="background-color:azure;vertical-align:top;">
        <tr id="body"  style="width:1400px;border-bottom:2px solid whitesmoke ">
                                    <td style="text-align:right;">
                                        <a href="#"><img border='0' src="include/img/header_logo_SG_1.gif" alt="Close" style="margin-left:auto;margin-right:auto;"/></a>
                                        SOCIETE GENERALE BANKA SRBIJA
                                    </td>
                                    <td style="text-align:center;color:whitesmoke;font-size:20px;font-family:Arial">
                                        HALKOM APPLICATION ::
                                    </td>
        </tr>
        <tr>
            <td style="background-color:#006699;border-right:1px solid silver; border-top:1px solid silver;vertical-align:top;">
                 <jsp:include page="/WEB-INF/jsp/newtree.jsp" />
            </td>
            <td id="body" style="background-color:azure;vertical-align:central;color:#a8e4ff; font-family:serif;font-size:25px;font-weight:bold">
                <table style="width:1000px">
                    <tr>
                        <td style="width:200px">
                              
                        </td>
                        <td style="width:800px">
                                <h1>WELCOME TO HALKOM APPLICATION !!!</h1>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
         </table>
    </body>
</html>
