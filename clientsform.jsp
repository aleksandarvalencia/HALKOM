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
        <title>CLIENT FORM ::</title>
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
            function GetInternationalList()
            {
                
                     $.getJSON('<spring:url value="/intercombo.json"/>',
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
                            $('#inter').html(html1);
                        }
                            );

                
            }
               function GetAccountList()
              {
                     $.getJSON('<spring:url value="/accounts.json"/>', {client: $('#root').val()},
                    /*{
                      ajax : 'true'
                    },*/function(data)
                    {
                        var html1='<option value=""> --- Please select one -----</option>';
                        var html2='';
                        var len=data.length;
                        for(var i=0; i< len; i++)
                        {
                            html1 += '<option value="' + data[i].nbsAccount + '">' + data[i].opis + '</option>';
                            html2=data[i].name ;
                            
                        }
                        html1+='</option>';
                        $('#accounts').html(html1);
                        $('#clientName').val(html2);
                        
                    }
                        );
              }
              function SetOpis()
              {
                 var opis = $('#accounts option:selected').text(); 
                 var duz=opis.length;
                 var poz=opis.indexOf('-');
                 var opis1=opis.substring(poz+1,duz);
                 var duz1=opis1.length;
                 var poz1=opis1.indexOf('-');
                 var opis2=opis1.substring(poz1+1,duz1);
                 var poz2=opis2.indexOf('-');
                 var opis3=opis2.substring(0,poz2);
                 document.getElementById('opis').value=opis3;
                  
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
    <table id="body" style="background-color:azure;vertical-align:top;">
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

            <td id="body"  style="background-color:azure;vertical-align:top;">
                <c:choose>
                        <c:when test="${empty clientsForm.idClient or clientsForm.idClient==0}"> 
                                 <h1 style="color: whitesmoke;font-size:26px;">Add Client ::</h1>
                                <spring:url value="/clients/insert" var="userActionUrl" />

                        </c:when>
                        <c:otherwise>
                                <h1 style="color: whitesmoke;font-size:26px;">Update Client ::</h1>
                                 <spring:url value="/clients/${clientsForm.idClient}/update" var="userActionUrl" />
                        </c:otherwise>
                </c:choose>
                <button class="btn-primary" style="width:950px;text-align:left;height:5px"></button>                 

                <form:form class="form-horizontal" method="post" modelAttribute="clientsForm" action="${userActionUrl}" style="height:1300px">

                         <br/>
                        <spring:bind path="idClient">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                        <form:hidden path="idClient" />
                                </div>
                        </spring:bind>
                        
                         <spring:url value="/clients/accounts/${clientsForm.root}" var="accountUrl" />
                         <spring:bind path="root">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <label style="color: #a8e4ff;"><b>Client Root:</b></label>
                                        <div>
                                            <form:input path="root" class="form-control" id="root" placeholder="Client Root" onchange="javascript:GetAccountList();GetInternationalList();" />
                                                <form:errors path="root" class="control-label" />
                                        </div>
                                </div>
                        </spring:bind>
                        <br/>
                        <spring:bind path="clientName">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <label style="color: #a8e4ff;"><b>Client Name:</b></label>
                                        <div style="width:300px;">
                                                <form:input path="clientName" class="form-control" id="clientName" placeholder="Client Name" style="width:300px;" />
                                                <form:errors path="clientName" class="control-label" />
                                        </div>
                                </div>
                        </spring:bind>
                         <br/>
                        <spring:bind path="nbsAccount">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <label style="color: #a8e4ff;"><b>NBS Account:</b></label>
                                                <div style="width:600px;">
                                                    
                                                    <form:select  class="form-control" id="accounts" path="nbsAccount" style="width:600px;" onchange="javascript:SetOpis();">
                                                     <form:options items="${accounts}" itemValue="nbsAccount" itemLabel="opis"></form:options>
                                                    </form:select>
                                                </div>
                                </div>
                        </spring:bind>    
                                  
                          <br/>
                         <spring:bind path="opis">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <label style="color: #a8e4ff;"><b>Description:</b></label>
                                        <div style="width:500px;">
                                                <form:input path="opis" class="form-control" id="opis" placeholder="Opis" style="width:300px;"/>
                                                <form:errors path="opis" class="control-label" />
                                                
                                                
                                        </div>
                                </div>
                        </spring:bind>
                         <br/>
                         <spring:bind path="international">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <label style="color: #a8e4ff;"><b>International:</b></label>
                                                <div style="width:100px;">
                                                    
                                                    <form:select  class="form-control" id="inter" path="international" style="width:100px;" onchange="javascript:SetOpis();">
                                                     <form:options items="${internationals}" itemValue="value" itemLabel="label"></form:options>
                                                    </form:select>
                                                </div>
                                </div>
                        </spring:bind>  
                         <br/>
                                <table class="form-group">
<!--                                    <tr>
                                        <td>
                                            <label style="font-size:15px;">Action</label>
                                         </td>
                                    </tr>-->
                                    <tr>
                                        <td>
                                                 <c:choose>
                                                        <c:when test="${empty clientsForm.idClient or clientsForm.idClient==0}">
                                                                <button type="submit" class="btn-lg btn-primary pull-left" style="width:200px">Add Client</button>
                                                        </c:when>
                                                        <c:otherwise>
                                                                <button type="submit" class="btn-lg btn-primary pull-left" style="width:200px">Update Client</button>
                                                        </c:otherwise>
                                                  </c:choose>
                                                 <br/>
                                                 <br/>

                                        </td>
                                         
                                    </tr>
                               
                                </table>
                            <button class="btn-primary" style="width:950px;text-align:left;height:5px"></button> 
                            <p><b> &copy; HALKOM APPLICATION</b></p>   
                </form:form>
                         
            </td>
            <td></td>
        </tr>
    </table>
</body>

<jsp:include page="/WEB-INF/jsp/fragments/footer.jsp" />
</html>