<%@page session="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/util" %>



<!DOCTYPE html>
<html lang="en">


 <head>
        <script type="text/javascript" src="/resources/jquery-2.1.4.js"></script>
        <script type="text/javascript" src="/resources/jquery-ui-1.11.4/jquery.ui.min.js"></script>
        <link  type="text/css" href="/resources/jquery-ui-1.11.4/jquery-ui.css" rel="stylesheet">
        <title>PRODUCT FORM ::</title>
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
//             $('document').ready(function(){GetProductList();});
//               window.onload = function(e)
//               { 
//                   if ($('#p_name').val()==="")
//                   {    
//                        GetProductList();
//                    }
//                  
//                  
//               };
               window.onbeforeunload =function(e) 
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
               function productSearch() {
                    var method ="post"; 
                    var form = document.createElement("form");
//                    var root=document.getElementById("p_root").value;
//                    var name=document.getElementById("p_name").value;
//                    var root="";
//                    var name="";
//                    if (name==="")
//                    {
//                        name="xx";
//                    }
//                    if (root==="")
//                    {
//                        root="xx";
//                    }
//                    var aa="/HALKOM/searchProduct/" + root + "/"  + name;
                    var aa="/HALKOM/products";
                    form.setAttribute("method", method);
                    form.setAttribute("action", aa);
                    document.body.appendChild(form);
                    form.submit();
                    };   
                    
                     function GetProductList()
                    {
                        $.getJSON('<spring:url value="/productcodes.json"/>',{product: $('#idProduct').val()},
//                       {
//                         ajax : 'true'
//                       },
                       function(data)
                       {
                           var html1='<option value=""> --- Please select one -----</option>';
                           var html2='';
                           var len=data.length;
                           for(var i=0; i< len; i++)
                           {
                               html1 += '<option value="' + data[i].productcode + '">' + data[i].productname + '</option>';
//                               html2=data[i].name ;

                           }
                           html1+='</option>';
                           $('#productcodes').html(html1);
                           
//                           alert($('#p_name').val());
                           
//                           $('#clientName').val(html2);

                       }
                           );
                    };
                   function SetOpis()
                    {
                       var opis = $('#productcodes option:selected').text(); 
                       var duz=opis.length;
                       var poz=opis.indexOf('-');
                       var opis1=opis.substring(poz+1,duz);
                       document.getElementById('productName').value=opis1;

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
                        <c:when test="${empty productsForm.idProduct or productsForm.idProduct==0}"> 
                                 <h1 style="color: whitesmoke;font-size:26px;">Add Product ::</h1>
                                <spring:url value="/products/insert" var="userActionUrl" />

                        </c:when>
                        <c:otherwise>
                                <h1 style="color: whitesmoke;font-size:26px;">Update Product ::</h1>
                                 <spring:url value="/products/${productsForm.idProduct}/update" var="userActionUrl" />
                        </c:otherwise>
                </c:choose>
                <button class="btn-primary" style="width:950px;text-align:left;height:5px"></button>                 
                <input type="hidden" name="p_root" id="p_root" value="${productsForm.productCode}">
                <input type="hidden" name="p_name" id="p_name" value="${productsForm.productName}">
                <form:form class="form-horizontal" method="post" modelAttribute="productsForm" action="${userActionUrl}" style="height:1300px">

                         <br/>
                        <spring:bind path="idProduct">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                        <form:hidden path="idProduct" />
                                </div>
                        </spring:bind>
                        
                         <spring:url value="/products/${productsForm.productCode}" var="accountUrl" />
                         
                           <spring:bind path="productCode">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <label style="color: #a8e4ff;"><b>Product Code:</b></label>
                                                <div style="width:600px;">
                                                    
                                                    <form:select  class="form-control" id="productcodes" path="productCode" style="width:600px;"  onchange="javascript:SetOpis();">
                                                     <form:options items="${productcodes}" itemValue="productcode"  itemLabel="productname"></form:options>
                                                    </form:select>
                                                </div>
                                </div>
                        </spring:bind>    
                         
                        <br/>
                        <spring:bind path="productName">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <label style="color: #a8e4ff;"><b>Product Name:</b></label>
                                        <div style="width:300px;">
                                                <form:input path="productName" class="form-control" id="productName" placeholder="Product Name" style="width:300px;" />
                                                <form:errors path="productName" class="control-label" />
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
                                                        <c:when test="${empty productsForm.idProduct or productsForm.idProduct==0}">
                                                                <button type="submit" class="btn-lg btn-primary pull-left" style="width:200px">Add Product</button>
                                                        </c:when>
                                                        <c:otherwise>
                                                                <button type="submit" class="btn-lg btn-primary pull-left" style="width:200px">Update Product</button>
                                                        </c:otherwise>
                                                  </c:choose>
                                                 <br/>
                                                 <br/>

                                        </td>
                                         
                                    </tr>
                               
                                </table>
                         
                           <button type="submit" class="btn-lg btn-primary pull-left" onclick="window.onbeforeunload = null;productSearch();" style="width:200px">Back to list</button>
                           <br/>
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