<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head>
<!--        <script type="text/javascript" src="/resources/jquery-2.1.4.js"></script>
        <script type="text/javascript" src="/resources/jquery-ui-1.11.4/jquery.ui.min.js"></script>
        <link  type="text/css" href="/resources/jquery-ui-1.11.4/jquery-ui.css" rel="stylesheet">-->
        <title>CLIENT DETAILS</title>
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
               function searchClient() {
                    var method ="post"; 
                    var form = document.createElement("form");
                    var root=document.getElementById("p_root").value;
//                    var name=document.getElementById("p_name").value;
                    var name="";
                    if (name==="")
                    {
                        name="xx";
                    }
                    if (root==="")
                    {
                        root="xx";
                    }
                    var aa="/HALKOM/searchClient/" + root + "/"  + name;
                    form.setAttribute("method", method);
                    form.setAttribute("action", aa);
                    document.body.appendChild(form);
                    form.submit();
                    }  
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
                 <a  href="#"><img border='0' src="/HALKOM/include/img/Close.png" alt="Close" style="margin-left:auto;margin-right:auto;" onclick="LogOut();"/></a>
            </td>
        </tr>
        <tr>
            <td style="background-color:#006699;border-right:1px solid silver; border-top:1px solid silver;vertical-align:top;">
                 <jsp:include page="/WEB-INF/jsp/newtree.jsp" />
            </td> 
            <td id="body" style="background-color:azure;vertical-align:top;">          
                 <h1 style="color:whitesmoke;font-size:26px;">CLIENT DETAILS : </h1>
                 <button class="btn-primary" style="width:1000px;text-align:left;height:3px"></button>
                 <input type="hidden" name="p_root" id="p_root" value="${clients.root}">
                 <input type="hidden" name="p_name" id="p_name" value="${clients.clientName}">

                 <table id="body" style="height:1300px;background-color:azure;">
                        <tr>
                            <td style="width:50px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:15px;color:#a8e4ff;">CLIENT ID::</label>
                                <label class="btn-primary" style="font-size:12px;color:#a8e4ff;">${clients.idClient}</label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:50px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:15px;color:#a8e4ff;">Client Root::</label>
                                <label class="btn-primary" style="font-size:12px;color:#a8e4ff;">${clients.root}</label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:50px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:15px;color:#a8e4ff;">Client Name::</label>
                                <label class="btn-primary" style="font-size:12px;color:#a8e4ff;">${clients.clientName}</label>
                            </td>
                        </tr>
                         <tr>
                             <td style="width:250px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:15px;color:#a8e4ff;">NBS Account::</label>
                                <label class="btn-primary" style="font-size:12px;color:#a8e4ff;">${clients.nbsAccount}</label>
                             </td>
                        </tr>
                        <tr>
                            <td style="width:50px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:15px;color:#a8e4ff;">Description ::</label>
                                <label class="btn-primary" style="font-size:12px;color:#a8e4ff;">${clients.opis}</label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:50px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:15px;color:#a8e4ff;">International::</label>
                                <label class="btn-primary" style="font-size:12px;color:#a8e4ff;">${clients.internationalDescription}</label>
                            </td>
                        </tr>
                         <tr>
                            <td style="width:50px;text-align:left;border-bottom:1px solid black;">
                                <label class="btn-primary" style="font-size:15px;color:#a8e4ff;">Active::</label>
                                <label class="btn-primary" style="font-size:12px;color:#a8e4ff;">${clients.statusDescription}</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                               &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <button type="submit" class="btn-lg btn-primary pull-left" onclick="searchClient();" style="width:200px">Back to list</button>
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