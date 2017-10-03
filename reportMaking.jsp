<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<html>
    <head>
        <script type="text/javascript" src="/resources/jquery-2.1.4.js"></script>
        <script type="text/javascript" src="/resources/jquery-ui-1.11.4/jquery.ui.min.js"></script>
        <link  type="text/css" href="/resources/jquery-ui-1.11.4/jquery-ui.css" rel="stylesheet">
         <title>REPORT MAKING ::</title>
    </head>
    
    <body style="background-color:azure;">

        <table style="vertical-align:top;">
            <tr>
                <td style="border-right:1px solid silver;vertical-align:top; font-size:10px ">
                              <jsp:include page="/WEB-INF/jsp/newtree.jsp" />
                </td>
                
                <td>
                    
                    <form:form class="form-horizontal" >
                        
                        
                        
                    </form:form>
                    
                </td>
                
            </tr>
            
        </table>

    </body>
    <jsp:include page="/WEB-INF/jsp/fragments/footer.jsp" />
</html>
