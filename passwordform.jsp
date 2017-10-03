<%@page session="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/util" %>


<!DOCTYPE html>
<html lang="en">


 <head>
        <title>PASSWORD FORM ::</title>
         <style>
            #body {
                background: url(include/img/slika1.jpg) no-repeat center center fixed; /* For IE 6 and 7 */
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
            }
        </style>

 </head>
 <body id="body" style="background-color:azure;">
    <table style="vertical-align:top;">
        <tr>
            <td style="border-right:1px solid silver;vertical-align:top;background-color:#006699;">
                          <jsp:include page="/WEB-INF/jsp/newtree.jsp" />
            </td>

           
            <td>
                     <h1 style="color:#a8e4ff;font-size:26px;">CHANGE PASSWORD ::</h1>
                <button class="btn-primary" style="width:950px;text-align:left;height:3px"></button>    
                <br />
                <br />
                <spring:url value="/passwordChange" var="userActionUrl" />
                <form:form class="form-horizontal" method="post" modelAttribute="passwordForm" action="${userActionUrl}" style="height:1300px">
                
                        <form:hidden path="idUser" />

                        <spring:bind path="password">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <label style="color:#a8e4ff"><b>Password::</b></label>
                                        <div>
                                                <form:password path="password" class="form-control" id="password" placeholder="password" />
                                                <form:errors path="password" class="control-label" />
                                        </div>
                                </div>
                        </spring:bind>
                        <br/>
                         <spring:bind path="confirmPassword">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                        <label style="color:#a8e4ff"><b>Confirm Password::</b></label>
                                        <div>
                                                <form:password path="confirmPassword" class="form-control" id="confirmPassword" placeholder="confirm password" />
                                                <form:errors path="confirmPassword" class="control-label" />
                                                
                                        </div>
                                </div>
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <div>
                                        <br/>
                                           <form:button type="submit" class="btn-lg btn-primary pull-left" >Change Password</form:button>
                                    </div>
                            </div>
                        </spring:bind>

                </form:form>
            </td>
             
        </tr>
    </table>
</body>

<jsp:include page="/WEB-INF/jsp/fragments/footer.jsp" />
</html>