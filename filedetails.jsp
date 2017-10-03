<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <script type="text/javascript" src="/resources/jquery-2.1.4.js"></script>
        <script type="text/javascript" src="/resources/jquery-ui-1.11.4/jquery.ui.min.js"></script>
        <link  type="text/css" href="/resources/jquery-ui-1.11.4/jquery-ui.css" rel="stylesheet">
        <title>FILE DETAILS</title>
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
            
             function FileDetailsLogOut()
                   {
                      var form = document.createElement("form");
                      var method ="post"; 
                      var bb="/HALKOM/logOut";
                      form.setAttribute("method", method);
                      form.setAttribute("action", bb);
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
<body id="body" style="background-color:azure;">
    <table id="body" style="background-color:azure;">
         <tr style="width:1400px;border-bottom:2px solid whitesmoke ">
                                    <td style="text-align:right;">
                                        <a href="#"><img border='0' src="/HALKOM/include/img/header_logo_SG_1.gif" alt="Close" style="margin-left:auto;margin-right:auto;"/></a>
                                        SOCIETE GENERALE BANKA SRBIJA
                                    </td>
                                    <td style="text-align:center;color:whitesmoke;font-size:20px;font-family:Arial">
                                        HALKOM APPLICATION ::
                                    </td>
                                    <td>
                                    <a  href="#"><img border='0' src="/HALKOM/include/img/Close.png" alt="Close" style="margin-left:auto;margin-right:auto;" onclick="FileDetailsLogOut();"/></a>
                                    </td>
        </tr>
        <tr>
            <td style="background-color:#006699;border-right:1px solid silver; border-top:1px solid silver;vertical-align:top;">
                 <jsp:include page="/WEB-INF/jsp/newtree.jsp" />
            </td> 
            <td id="body" style="background-color:azure;vertical-align:top;">          
                 <h1 style="color: #a8e4ff;font-size:26px;">FILE DETAILS : </h1>
                 
                 <button class="btn-primary" style="width:950px;text-align:left;height:3px" ></button>
                 <table id="body"  style="height:400px;background-color:azure;">
                        
                   <c:forEach var="fil" items="${fileDetails}">  
                     <tr style="height:10px">
                            <td style="width:110px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:10px;color: #a8e4ff"><b>ID DOK ::</b></label>
                            </td>
                            <td style="width:400px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:10px;color: #a8e4ff"><b>${fil.dok}</b></label>
                            </td>
                             <td style="width:110px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:10px;color: #a8e4ff"><b>ID PRIJEMA ::</b></label>
                            </td>
                            <td style="width:400px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:10px;color: #a8e4ff"><b>${fil.prejem}</b></label>
                            </td>
                        </tr>
                        <tr style="height:10px">
                            <td style="width:110px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:10px;color: #a8e4ff"><b>Datum Valute::</b></label>
                            </td>
                             <td style="width:400px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:10px;color: #a8e4ff"><b>${fil.datumvalute}</b></label>
                            </td>
                             <td style="width:110px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:10px;color: #a8e4ff"><b>Racun Platioca::</b></label>
                            </td>
                             <td style="width:400px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:10px;color: #a8e4ff"><b>${fil.racund}</b></label>
                            </td>
                        </tr>
                        <tr style="height:10px">
                            <td style="width:110px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:10px;color: #a8e4ff"><b>Iznos::</b></label>
                            </td>
                             <td style="width:400px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:10px;color: #a8e4ff"><b>${fil.iznos}</b></label>
                            </td>
                             <td style="width:110px;text-align:left;border-bottom:1px solid black">
                                <label class="btn-primary" style="font-size:10px;color: #a8e4ff"><b>Ime Platioca::</b></label>
                            </td>
                             <td style="width:400px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:10px;color: #a8e4ff"><b>${fil.imeb}</b></label>
                            </td>
                        </tr>
                         <tr style="height:10px">
                             <td style="width:110px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:10px;color: #a8e4ff"><b>Adresa Platioca ::</b></label>
                             </td>
                              <td style="width:400px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:10px;color: #a8e4ff"><b>${fil.adresab}</b></label>
                            </td>
                             <td style="width:110px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:10px;color: #a8e4ff"><b>Ime Primaoca ::</b></label>
                             </td>
                              <td style="width:400px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:10px;color: #a8e4ff"><b>${fil.imed}</b></label>
                            </td>
                        </tr>
                        <tr style="height:10px">
                            <td style="width:110px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:10px;color: #a8e4ff"><b>Adresa Primaoca ::</b></label>
                            </td>
                            <td style="width:400px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:10px;color: #a8e4ff"><b>${fil.adresad}</b></label>
                            </td>
                             <td style="width:110px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:10px;color: #a8e4ff"><b>Svrha Placanja::</b></label>
                            </td>
                            <td style="width:400px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:10px;color: #a8e4ff"><b>${fil.namen}</b></label>
                            </td>
                        </tr>
                        <tr style="height:10px">
                            <td style="width:110px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:10px;color: #a8e4ff"><b>Datum Prometa::</b></label>
                            </td>
                             <td style="width:400px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:10px;color: #a8e4ff"><b>${fil.datumprometa}</b></label>
                            </td>
                             <td style="width:110px;text-align:left;border-bottom:1px solid black;">
                               
                            </td>
                             <td style="width:400px;text-align:left;border-bottom:1px solid black;">
                               
                            </td>
                        </tr>
                    </c:forEach>

                 </table>
            </td>
            <td></td>
       </tr>
     </table>
<jsp:include page="/WEB-INF/jsp/fragments/footer.jsp" />
</body>
</html>