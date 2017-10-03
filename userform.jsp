<%@page session="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/util" %>
<%@page import="java.util.Calendar"%>


<!DOCTYPE html>
<html lang="en">


 <head>
        <script type="text/javascript" src="/resources/jquery-2.1.4.js"></script>
        <script type="text/javascript" src="/resources/jquery-ui-1.11.4/jquery.ui.min.js"></script>
        <link  type="text/css" href="/resources/jquery-ui-1.11.4/jquery-ui.css" rel="stylesheet">
        <title>USER FORM ::</title>
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
            function GetAuthList()
            {
                     $.getJSON('<spring:url value="/interauto.json"/>',
                        {
                          ajax : 'true'
                        },function(data)
                        {
                            var html1='<option value=""> --- Please select one -----</option>';

                            var len=data.length;
                            for(var i=0; i< len; i++)
                            {
                                html1 += '<option value="' + data[i].value + '">' + data[i].label + '</option>';
                            }
                            html1+='</option>';
                            $('#auth').html(html1);
                        }
                            );
            }

         </script>
        
 </head>
 <body id="body" style="background-color:azure;">
 
    <table style="vertical-align:top;">
         <tr id="body" style="width:1400px;border-bottom:2px solid whitesmoke ">
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

            <td >
                <c:choose>
                        <c:when test="${empty userForm.idUser}"> 
                                <h1 style="color:whitesmoke;font-size:26px;">Add User ::</h1>
                                <spring:url value="/users/insert" var="userActionUrl" />

                        </c:when>
                        <c:otherwise>
                                <h1 style="color:whitesmoke;font-size:26px;">Update User ::</h1>
                                 <spring:url value="/users/${userForm.idUser}/update" var="userActionUrl" />
                        </c:otherwise>
                </c:choose>
                                
                <button class="btn-primary" style="width:950px;text-align:left;height:5px"></button>                 
                <br />

             
                <form:form  class="form-horizontal" method="post" modelAttribute="userForm" action="${userActionUrl}" style="height:1300px">

                        <form:hidden path="idUser" />

                        <form:hidden path="id_Userold" />

                        <spring:bind path="username">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <label style="color: #a8e4ff"> <b>User Name:</b></label>
                                        <div>
                                                <form:input path="username" type="text" class="form-control " id="username" placeholder="User Name" onchange="javascript:GetAuthList();"/>
                                                <form:errors path="username" class="control-label" />
                                        </div>
                                </div>
                        </spring:bind>
                        <br />
                        <spring:bind path="firstname">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                        <label style="color: #a8e4ff"><b>First Name:</b></label>
                                        <div>
                                                <form:input path="firstname" class="form-control" id="firstname" placeholder="First Name" />
                                                <form:errors path="firstname" class="control-label" />
                                        </div>
                                </div>
                        </spring:bind>
                        <br />
                         <spring:bind path="secondname">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                        <label style="color: #a8e4ff"><b>Second Name:</b></label>
                                        <div>
                                                <form:input path="secondname" class="form-control" id="secondname" placeholder="Second Name" />
                                                <form:errors path="secondname" class="control-label" />
                                        </div>
                                </div>
                        </spring:bind>
<br />
                        <spring:bind path="password">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                        <label style="color: #a8e4ff"><b>Password:</b></label>
                                        <div>
                                                <form:password path="password" class="form-control" id="password" placeholder="password" />
                                                <form:errors path="password" class="control-label" />
                                        </div>
                                </div>
                        </spring:bind>
                        <br />
                         <spring:bind path="confirmPassword">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                        <label style="color: #a8e4ff"><b>Confirm Password:</b></label>
                                        <div>
                                                <form:password path="confirmPassword" class="form-control" id="confirmPassword" placeholder="confirm password" />
                                                <form:errors path="confirmPassword" class="control-label" />
                                        </div>
                                </div>
                        </spring:bind>
<br />
                        <spring:bind path="idAuth">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                                <label style="color: #a8e4ff"><b>Authorization level:</b></label>
                                                <div style="width:200px;">
                                                    
                                                    <form:select  class="form-control" id="auth" path="idAuth" style="width:200px;">
                                                     <form:options items="${authorization}" itemValue="value" itemLabel="label"></form:options>
                                                    </form:select>
                                                </div>
                                </div>
                        </spring:bind>    

                        <br/>
                        <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                        <c:choose>
                                                <c:when test="${empty userForm.idUser}">
                                                    <button type="submit" class="btn-lg btn-primary pull-left" style="width:150px" >Add User</button>
                                                </c:when>
                                                <c:otherwise>
                                                        <button type="submit" class="btn-lg btn-primary pull-left" style="width:150px">Update User</button>
                                                </c:otherwise>
                                        </c:choose>
                                </div>
                        </div>
                        <br></br>
                         <button class="btn-primary" style="width:950px;text-align:left;height:5px"></button> 
                         <p><b> &copy; HALKOM APPLICATION</b></p>  
                </form:form>
            </td>
        </tr>
    </table>
</body>

<jsp:include page="/WEB-INF/jsp/fragments/footer.jsp" />
</html>