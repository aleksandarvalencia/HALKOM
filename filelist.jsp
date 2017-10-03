<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>
        <script type="text/javascript" src="/resources/jquery-2.1.4.js"></script>
        <script type="text/javascript" src="/resources/jquery-ui-1.11.4/jquery.ui.min.js"></script>
        <link  type="text/css" href="/resources/jquery-ui-1.11.4/jquery-ui.css" rel="stylesheet">
        <title>FILES LIST ::</title>
          <style>
            #body {
                background: url(/HALKOM/include/img/slika1.jpg) no-repeat center center fixed; /* For IE 6 and 7 */
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
            }
        </style>
        <script type="text/javascript">
            
             function LogOut()
                   {
                      var form = document.createElement("form");
                      var method ="post"; 
                      var aa="/HALKOM/logOut";
                      form.setAttribute("method", method);
                      form.setAttribute("action", aa);
                      document.body.appendChild(form);
                      form.submit();
                       
                   }
                    window.onbeforeunload = function(event) 
                        {
                           if (event.keyCode!==116)
                            {
                                    var form = document.createElement("form");
                                    var method ="post"; 
                                    var aa="/HALKOM/closeEvent";
                                    form.setAttribute("method", method);
                                    form.setAttribute("action", aa);
                                    document.body.appendChild(form);
                                    form.submit();
                              }
                         } ;
            
        </script>
 </head>
 
<body id="body" style="background-color:azure">

	<!--<div class="container">-->

                            <table id="body" >
                                 <tr style="width:1400px;border-bottom:2px solid whitesmoke ">
                                    <td style="text-align:right;">
                                        <a href="#"><img border='0' src="/HALKOM/include/img/header_logo_SG_1.gif" alt="Close" style="margin-left:auto;margin-right:auto;"/></a>
                                        SOCIETE GENERALE BANKA SRBIJA
                                    </td>
                                    <td style="text-align:center;color:whitesmoke;font-size:20px;font-family:Arial">
                                        HALKOM APPLICATION ::
                                    </td>
                                     <td>
                                        <a  href="#"><img border='0' src="/HALKOM/include/img/Close.png" alt="Close" style="margin-left:auto;margin-right:auto;" onclick="LogOut();"/></a>
                                   </td>
                                </tr>
                                <tr> 
                                    <td style="background-color:#006699;border-right:1px solid silver;border-top:1px solid silver;vertical-align:top; ">
                                        <jsp:include page="/WEB-INF/jsp/newtree.jsp" />
                                    </td>
                                    <td id="body" style="background-color:azure;vertical-align:top;">
                                        <h1 style="color:whitesmoke;font-size:26px;">Files List ::</h1>
                                        
                                        <button class="btn-primary" style="width:950px;text-align:left;height:5px" ></button>
                                        <br></br>
                                        <table style="width:950px;vertical-align:top;">
                                                    <thead>
                                                            <tr>
                                                                <th style="background-color:#003399;width:50px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid currentColor;border-left:2px solid #002a80;border-top:2px solid #002a80;">#ID</th>
                                                                <th style="background-color:#003399;width:150px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid currentColor;border-top:2px solid #002a80;">ID Prijema</th>
                                                                <th style="background-color:#003399;width:130px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid currentColor;border-top:2px solid #002a80;">Datum Valute</th>
                                                                <th style="background-color:#003399;width:130px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid currentColor;border-top:2px solid #002a80;">Racun </th>
                                                                <th style="background-color:#003399;width:300px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid currentColor;border-top:2px solid #002a80;">Client</th>    
                                                                <th style="background-color:#003399;width:110px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid currentColor;border-top:2px solid #002a80;">Iznos</th>                                                                    
                                                                <th style="background-color:#003399;width:60px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid #002a80;border-top:2px solid #002a80;">Action</th>
                                                            </tr>
                                                    </thead>

                                                    <c:forEach var="fil" items="${filesForm}">
                                                            <tr>
                                                                    <td style="background-color:white;width:50px;font-size:  10px;text-align:center;border-bottom:1px solid #002a80;border-right:1px solid #002a80;border-left:1px solid #002a80;">${fil.idna}</td>
                                                                    <td style="background-color:white;width:150px;font-size: 10px;text-align:center;border-bottom:1px solid #002a80;border-right:1px solid #002a80;">${fil.prejem}</td>
                                                                    <td style="background-color:white;width:130px;font-size: 10px;text-align:left;border-bottom:1px solid #002a80;border-right:1px solid #002a80;">${fil.datumvalute}</td>
                                                                    <td style="background-color:white;width:130px;font-size: 10px;text-align:center;border-bottom:1px solid #002a80;border-right:1px solid #002a80;">${fil.racund}</td>  
                                                                    <td style="background-color:white;width:300px;font-size: 10px;text-align:left;border-bottom:1px solid #002a80;border-right:1px solid #002a80;">${fil.imed}</td>                                                                        
                                                                    <td style="background-color:white;width:110px;font-size: 10px;text-align:center;border-bottom:1px solid #002a80;border-right:1px solid #002a80;">${fil.iznos}</td>                                                                    
                                                                    <td style="background-color:white;width:60px;font-size: 10px;text-align:center;border-bottom:1px solid #002a80;border-right:1px solid #002a80;">
                                                                            <spring:url value="/filedetails/${fil.idna}/details" var="userUrl" />
                                                                            <button class="btn-primary" style="height:25px" onclick="window.onbeforeunload = null;location.href='${userUrl}'">Details</button>
                                                                    </td>
                                                            </tr>
                                                    </c:forEach>
                                                          
                                            </table>
                                         
                                  </td>
                                  <td></td>
                               </tr>  
                            </table>
                                      
	<!--</div>-->


<jsp:include page="/WEB-INF/jsp/fragments/footer.jsp" />
</body>
</html>