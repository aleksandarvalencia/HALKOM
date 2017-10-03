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
        <title>CLIENT LIST ::</title>
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
                    function post(path) {
                    var method ="post"; 

                    var form = document.createElement("form");
                    form.setAttribute("method", method);
                    form.setAttribute("action", path);
                    document.body.appendChild(form);
                    /*var hiddenField = document.createElement("input");
                    hiddenField.setAttribute("type", "hidden");
                    hiddenField.setAttribute("name", "${_csrf.parameterName}");
                    hiddenField.setAttribute("value", "${_csrf.token}");
                    form.appendChild(hiddenField);*/
                    form.submit();
                    }  
                    
                    function searchClient() {
                    var method ="post"; 
                    var form = document.createElement("form");
                    var root=document.getElementById("p_root").value;
                    var name=document.getElementById("p_name").value;
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
                    
                    function img() 
                    {
//                        var src = "images/main" + num + ".jpg";
                        document.getElementById("body").style.display='block';
//                        $("#body").css("display", "block");
                    }
                    
                    function CheckClient()
                    {
                        $('#p_root').keydown(function(event)
                        {
                           if (event.keyCode===13)
                           {

                               searchClient();
                           }
                        });
                    };

                        
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

                    
                    function CheckName()
                    {
                        $('#p_name').keydown(function(event)
                        {
                           if (event.keyCode===13)
                           {

                               searchClient();
                           }
                        });

                    };
                   
            </script>
 
 </head>
 
 <body id="body" onload="img();" >


    <table id="body" onload="img();">
                                 <tr style="width:1400px;border-bottom:2px solid whitesmoke ">
                                    <td style="text-align:right;">
                                        <a  href="#"><img border='0' src="/HALKOM/include/img/header_logo_SG_1.gif" alt="Close" style="margin-left:auto;margin-right:auto;"/></a>
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
                                        <h1 style="color:whitesmoke;font-size:26px;">Clients List ::</h1>
                                        <spring:url value="/searchClient" var="searchUrl" />
                                        <button class="btn-primary" style="width:1000px;text-align:left;height:3px"></button>
                                        <br></br>


                                        <table id="body"  style="width:1000px;height:15px;font-size:10px;font-family:serif;text-align:left;border-bottom:1px solid whitesmoke;border-right:1px solid whitesmoke;border-left:1px solid whitesmoke;border-top:1px solid whitesmoke;">
                                            <tr style="height: 20px;width:410px">
                                                <td>
                                                   
                                                </td>
                                                <td>
                                                   
                                                </td>
                                                 <td>
                                                    
                                                </td>
                                            </tr>
                                            <tr style="width:410px">
                                                <td style="width:10px">
                                                </td>
                                                <td style="width:50px">
                                                    <label style="color:whitesmoke;">Client Root::</label>
                                                </td>
                                                 <td style="font-size:12px">
                                                     <input type="text" id="p_root" name="p_root" onkeydown="CheckClient();"  style="width:150px">
                                                </td>
                                            </tr>

                                             <tr style="width:410px">
                                                <td style="width:10px;font-size: 10px">
                                                </td>
                                                <td style="width:50px">
                                                    <label style="color:whitesmoke;">Client Name::</label>
                                                </td>
                                                 <td style="font-size:12px;width:400px">
                                                     <input type="text" id="p_name" name="p_name" onkeydown="CheckName();" style="width:300px">
                                                </td>
                                            </tr>
                                            <tr style="width:450px">
                                                <td style="width:10px">

                                                </td>
                                                <td style="width:50px">
                                                    <label style="color:whitesmoke;">Action:: </label>
                                                </td>
                                                <td style="font-size:12px;width:400px"> 
                                                      <button type="submit" class="btn-primary" onclick="window.onbeforeunload = null;searchClient();" style="width:120px">Find Client</button>
                                                </td>
                                            </tr>
                                            <tr style="height: 20px;width:410px">
                                                <td>
                                                   
                                                </td>
                                                <td>
                                                   
                                                </td>
                                                 <td>
                                                    
                                                </td>
                                            </tr>
                                        </table>


                                        
                                        <!--<button class="btn-primary" style="width:120px;text-align:left;height:30px" onclick="location.href='${searchUrl}'">Search Client</button>-->
                                        <br></br>
                                        <table style="width:1000px;vertical-align:top;">
                                                    <thead>
                                                            <tr>
                                                                <th style="background-color:#003399;width:50px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid currentColor;border-left:2px solid #002a80;border-top:2px solid #002a80;">#ID</th>
                                                                <th style="background-color:#003399;width:250px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid currentColor;border-top:2px solid #002a80;">Client Name</th>
                                                                <th style="background-color:#003399;width:80px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid currentColor;border-top:2px solid #002a80;">Client</th>
                                                                <th style="background-color:#003399;width:240px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid currentColor;border-top:2px solid #002a80;">Description</th>
                                                                <th style="background-color:#003399;width:130px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid currentColor;border-top:2px solid #002a80;">NBS Account</th>  
                                                                <th style="background-color:#003399;width:80px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid currentColor;border-top:2px solid #002a80;">Active</th>  
                                                                <th style="background-color:#003399;width:200px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid #002a80;border-top:2px solid #002a80;">Action</th>
                                                            </tr>
                                                    </thead>

                                                    <c:forEach var="client" items="${clients}">
                                                            <tr>
                                                                    <td style="background-color:white;width:50px;font-size:  10px;text-align:center;border-bottom:1px solid #002a80;border-right:1px solid #002a80;border-left:1px solid #002a80;">${client.idClient}</td>
                                                                    <td style="background-color:white;width:250px;font-size: 10px;text-align:left;border-bottom:1px solid #002a80;border-right:1px solid #002a80;">${client.clientName}</td>
                                                                    <td style="background-color:white;width:80px;font-size: 10px;text-align:center;border-bottom:1px solid #002a80;border-right:1px solid #002a80;">${client.root}</td>
                                                                    <td style="background-color:white;width:240px;font-size: 10px;text-align:left;border-bottom:1px solid #002a80;border-right:1px solid #002a80;">${client.opis}</td>
                                                                    <td style="background-color:white;width:130px;font-size: 10px;text-align:center;border-bottom:1px solid #002a80;border-right:1px solid #002a80;">${client.nbsAccount}</td>    
                                                                    <td style="background-color:white;width:80px;font-size: 10px;text-align:center;border-bottom:1px solid #002a80;border-right:1px solid #002a80;">${client.statusDescription}</td>    
                                                                    <td style="background-color:white;width:200px;font-size: 10px;text-align:center;border-bottom:1px solid #002a80;border-right:1px solid #002a80;">
                                                                            <spring:url value="/clients/${client.idClient}" var="userUrl" />
                                                                            <spring:url value="/clients/${client.idClient}/delete/${client.root}" var="deleteUrl" /> 
                                                                            <spring:url value="/clients/${client.idClient}/update" var="updateUrl" />

                                                                            <button class="btn-primary" style="height:25px" onclick="window.onbeforeunload = null;location.href='${userUrl}'">View</button>
                                                                            <button class="btn-primary" style="height:25px" onclick="window.onbeforeunload = null;location.href='${updateUrl}'">Update</button>
                                                                            <button class="btn-primary" style="height:25px" onclick="window.onbeforeunload = null;this.disabled=true;post('${deleteUrl}');">Delete</button>
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