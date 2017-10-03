<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>USER DETAILS</title>
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
              window.onbeforeunload =function() 
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
                    };
            
        </script>
    </head>
<body id="body">
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
            <td style="border-right:1px solid silver;vertical-align:top;background-color:#006699;">
                 <jsp:include page="/WEB-INF/jsp/newtree.jsp" />
            </td> 
            <td id="body" style="vertical-align:top;">      
                 <h1 style="color:whitesmoke;font-size:26px;">USER DETAILS ::</h1>
                  <button class="btn-primary" style="width:950px;text-align:left;height:3px"></button>    
                 <table id="body" style="height:1300px">
                        <tr>
                            <td style="width:200px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="color: #a8e4ff"><b>ID ::</b></label>
                                <label class="btn-primary" style="width:200px;color: #a8e4ff">${users.idUser}</label>
                            </td>
                        </tr>
                         <tr>
                             <td style="width:200px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="color: #a8e4ff"><b>User Name ::</b></label>
                                <label class="btn-primary" style="width:200px;color: #a8e4ff">${users.username}</label>
                             </td>
                        </tr>
                        <tr>
                            <td style="width:200px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="color: #a8e4ff"><b>First Name ::</b></label>
                                <label class="btn-primary" style="width:200px;color: #a8e4ff">${users.firstname}</label>
                            </td>
                        </tr>
                         <tr>
                             <td style="width:200px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="color: #a8e4ff"><b>Second Name ::</b></label>
                                <label class="btn-primary" style="width:200px;color: #a8e4ff">${users.secondname}</label>
                             </td>
                        </tr>
                         <tr>
                             <td style="width:200px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="color: #a8e4ff"><b>User Level ::</b></label>
                                <label class="btn-primary" style="width:200px;color: #a8e4ff">${users.idAuth}</label>
                             </td>
                        </tr>
                        <tr>
                            <td style="width:200px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="color: #a8e4ff"><b>Status ::</b></label>
                                <label class="btn-primary" style="width:200px;color: #a8e4ff">${users.status}</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                          <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                         <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                         <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                         <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                 </table>
            </td>
            <td></td>
       </tr>
     </table>
<jsp:include page="/WEB-INF/jsp/fragments/footer.jsp" />
</body>
</html>