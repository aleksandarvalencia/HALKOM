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
        <title>USERS LIST ::</title>
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
                    function post(path) {
                    var method ="post"; 

                    var form = document.createElement("form");
                    form.setAttribute("method", method);
                    form.setAttribute("action", path);
                    document.body.appendChild(form);
                   /* var hiddenField = document.createElement("input");
                    hiddenField.setAttribute("type", "hidden");
                    hiddenField.setAttribute("name", "${_csrf.parameterName}");
                    hiddenField.setAttribute("value", "${_csrf.token}");
                    form.appendChild(hiddenField);*/
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
 
<body id="body" style="background-color:azure;">

	<!--<div class="container">-->

                            <table id="body">
                                <tr style="width:1400px;border-bottom:2px solid whitesmoke ">
                                    <td style="text-align:right;">
                                        <a href="#"><img border='0' src="include/img/header_logo_SG_1.gif" alt="Close" style="margin-left:auto;margin-right:auto;"/></a>
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
                                    <td style="background-color:#006699;border-right:1px solid silver;vertical-align:top;">
                                        <jsp:include page="/WEB-INF/jsp/newtree.jsp" />
                                    </td>
                                    <td id="body" style="vertical-align:top;">
                                        <h1 style="color:whitesmoke;font-size:26px;">All Users ::</h1>
                                        <spring:url value="/newUser" var="insertUrl" />
                                        <button class="btn-primary" style="width:950px;text-align:left;height:5px" onclick="location.href='${insertUrl}'"></button>
                                        <br></br>
                                        <table style="width:950px;vertical-align:top;">
                                                    <thead>
                                                            <tr>
                                                                <th style="background-color:#003399;width:50px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid currentColor;border-left:2px solid #002a80;border-top:2px solid #002a80;">#ID</th>
                                                                    <th style="background-color:#003399;width:250px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid currentColor;border-top:2px solid #002a80;">User Name</th>
                                                                    <th style="background-color:#003399;width:80px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid currentColor;border-top:2px solid #002a80;">First Name</th>
                                                                    <th style="background-color:#003399;width:240px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid currentColor;border-top:2px solid #002a80;">Second Name</th>
                                                                    <th style="background-color:#003399;width:130px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid currentColor;border-top:2px solid #002a80;">User Level</th>
                                                                    <th style="background-color:#003399;width:300px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid #002a80;border-top:2px solid #002a80;">Action</th>
                                                            </tr>
                                                    </thead>

                                                    <c:forEach var="user" items="${users}">
                                                            <tr>
                                                                    <td style="background-color:white;width:50px;font-size:  10px;text-align:center;border-bottom:1px solid #002a80;border-right:1px solid currentColor;border-left:1px solid #002a80;">${user.idUser}</td>
                                                                    <td style="background-color:white;width:50px;font-size:  10px;text-align:center;border-bottom:1px solid #002a80;border-right:1px solid currentColor;border-left:1px solid #002a80;">${user.username}</td>
                                                                    <td style="background-color:white;width:250px;font-size: 10px;text-align:center;border-bottom:1px solid #002a80;border-right:1px solid currentColor;">${user.firstname}</td>
                                                                    <td style="background-color:white;width:80px;font-size: 10px;text-align:center;border-bottom:1px solid #002a80;border-right:1px solid currentColor;">${user.secondname}</td>
                                                                    <td style="background-color:white;width:240px;font-size: 10px;text-align:center;border-bottom:1px solid #002a80;border-right:1px solid currentColor;">${user.idAuth}</td>
                                                                    <td style="background-color:white;width:300px;font-size: 10px;text-align:center;border-bottom:1px solid #002a80;border-right:1px solid currentColor;">
                                                                            <spring:url value="/users/${user.idUser}" var="userUrl" />
                                                                            <spring:url value="/users/${user.idUser}/delete" var="deleteUrl" /> 
                                                                            <spring:url value="/users/${user.idUser}/update" var="updateUrl" />

                                                                            <button class="btn-primary" onclick="location.href='${userUrl}'">View</button>
                                                                            <button class="btn-primary" onclick="location.href='${updateUrl}'">Update</button>
                                                                            <button class="btn-primary" onclick="this.disabled=true;post('${deleteUrl}');">Delete</button>
                                                                    </td>
                                                            </tr>
                                                    </c:forEach>
                                            </table>
                                            <br/>
                                          <button class="btn-primary" style="width:950px;text-align:left;height:5px"></button> 
                                         <p><b> &copy; HALKOM APPLICATION</b></p>   
                                  </td>
                                  <td></td>
                               </tr>  
                            </table>

	<!--</div>-->


<jsp:include page="/WEB-INF/jsp/fragments/footer.jsp" />
</body>
</html>