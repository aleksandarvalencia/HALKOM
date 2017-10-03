<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/util" %>

<!DOCTYPE html>
<html lang="en">

<head>
        <script type="text/javascript" src="/resources/jquery-2.1.4.js"></script>
        <script type="text/javascript" src="/resources/jquery-ui-1.11.4/jquery.ui.min.js"></script>
        <link  type="text/css" href="/resources/jquery-ui-1.11.4/jquery-ui.css" rel="stylesheet">
        <title>FILES LIST ::</title>
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
          
                 function FileTableLogOut()
                   {
                      var form = document.createElement("form");
                      var method ="post"; 
                      var aa="/HALKOM/logOut";
                      form.setAttribute("method", method);
                      form.setAttribute("action", aa);
                      document.body.appendChild(form);
                      form.submit();
                       
                   }
                   
//                   document.onkeydown = KeyCheck;
//                    window.returnMessage="You are now logged out.";
//                    function KeyCheck(e) {
//                        var key = (window.event) ? event.keyCode : e.keyCode;
//                        alert(key);
//                        if(key===116) {window.returnMessage=null;}
//                        }
//                        $(function(){


//                         document.getElementById('sub').onsubmit = function(e) 
//                        {
//                         window.onbeforeunload = null;
//                         return true;
//                        }

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
//                        });
//                    window.onbeforeunload =function(e) 
//                    {
//                      var form = document.createElement("form");
//                      var method ="post"; 
//                      var aa="/HALKOM/closeEvent";
//                      form.setAttribute("method", method);
//                      form.setAttribute("action", aa);
//                      document.body.appendChild(form);
//                      form.submit();
//
//                    };
                    function sendFileDate() {
                    var method ="post"; 
                    var form = document.createElement("form");
                    var datum=document.getElementById("fileDate").value;
                    var aa="/HALKOM/files/" + datum;
                    form.setAttribute("method", method);
                    form.setAttribute("action", aa);
                    document.body.appendChild(form);
                    form.submit();
                    }   

         </script>       
 </head>
 
<body id="body">

	
       
                            <table id="body"  >
                                 <tr style="width:1400px;border-bottom:2px solid whitesmoke ">
                                    <td style="text-align:right;">
                                        <a href="#"><img border='0' src="/HALKOM/include/img/header_logo_SG_1.gif" alt="Close" style="margin-left:auto;margin-right:auto;"/></a>
                                        SOCIETE GENERALE BANKA SRBIJA
                                    </td>
                                    <td style="text-align:center;color:whitesmoke;font-size:20px;font-family:Arial">
                                        HALKOM APPLICATION ::
                                    </td>
                                     <td>
                                        <a  href="#"><img border='0' src="/HALKOM/include/img/Close.png" alt="Close" style="margin-left:auto;margin-right:auto;" onclick="FileTableLogOut();"/></a>
                                   </td>
                                </tr>
                                <tr> 
                                    <td style="background-color: #006699;border-right:1px solid silver;border-top:1px solid silver;vertical-align:top; ">
                                        <jsp:include page="/WEB-INF/jsp/newtree.jsp" />
                                    </td>
                                    <td id="body" style="background-color:azure;vertical-align:top;">
                                        <h1 style="color:whitesmoke;font-size:26px;">Files List ::</h1>
                                        
                                        <button class="btn-primary" style="width:800px;text-align:left;height:5px" ></button>
                                        <br></br>
                                   
                                    <table id="body">
                                        <tr>
                                            <td style="width:180px;color:whitesmoke;"><label>Imported Files Date ::</label> </td>
                                            <td>
                                              
                                                    <div id="importedfilesdate" class="form-group">

                                                            <div class="input-append date">
                                                                <input type="text" id="fileDate"  name="fileDate"/>
                                                            <span class="add-on">
                                                                      <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
                                                             </span>
                                                            </div>
                                                     </div>
                                               
                                            </td>
                                            <td style="width:30px;"></td>
                                            <td> 
                                                 <button type="submit" class="btn-primary" onclick="window.onbeforeunload = null;sendFileDate();">Send Date</button>
                                            </td>
                                        </tr>
                                    </table>
                                        <table style="width:800px;vertical-align:top;">
                                            
 
                                                    <thead>
                                                            <tr>
                                                                <th style="background-color:#003399;width:50px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid currentColor;border-left:2px solid #002a80;border-top:2px solid #002a80;">FILE ID</th>
                                                                <th style="background-color:#003399;width:100px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid currentColor;border-top:2px solid #002a80;">File Reference</th>
                                                                <th style="background-color:#003399;width:100px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid currentColor;border-top:2px solid #002a80;">File Type</th>
                                                                <th style="background-color:#003399;width:200px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid currentColor;border-top:2px solid #002a80;">File Name </th>      
                                                                <th style="background-color:#003399;width:130px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid currentColor;border-top:2px solid #002a80;">File Date </th>  
                                                                <th style="background-color:#003399;width:60px;height:15px;font-size:12px;font-family:serif;color:whitesmoke;text-align:center;border-bottom:2px solid #002a80;border-right:2px solid #002a80;border-top:2px solid #002a80;">Action</th>
                                                            </tr>
                                                    </thead>

                                                    <c:forEach var="fil" items="${filesForm}">
                                                            <tr>
                                                                    <td style="background-color:white;width:50px;font-size:  10px;text-align:center;border-bottom:1px solid #002a80;border-right:1px solid #002a80;border-left:1px solid #002a80;">${fil.idFile}</td>
                                                                    <td style="background-color:white;width:100px;font-size: 10px;text-align:center;border-bottom:1px solid #002a80;border-right:1px solid #002a80;">${fil.fileReference}</td>
                                                                    <td style="background-color:white;width:100px;font-size: 10px;text-align:center;border-bottom:1px solid #002a80;border-right:1px solid #002a80;">${fil.fileType}</td>
                                                                    <td style="background-color:white;width:200px;font-size: 10px;text-align:center;border-bottom:1px solid #002a80;border-right:1px solid #002a80;">${fil.fileName}</td>                                                                     
                                                                    <td style="background-color:white;width:130px;font-size: 10px;text-align:center;border-bottom:1px solid #002a80;border-right:1px solid #002a80;">${fil.fileDate}</td>                                                                
                                                                    <td style="background-color:white;width:60px;font-size: 10px;text-align:center;border-bottom:1px solid #002a80;border-right:1px solid #002a80;">
                                                                            <spring:url value="/filetable/${fil.idFile}" var="userUrl" />
                                                                            <button class="btn-primary" style="height:25px" onclick=" window.onbeforeunload = null;location.href='${userUrl}'">Details</button>
                                                                    </td>
                                                            </tr>
                                                    </c:forEach>
                                                          
                                            </table>
                                         
                                  </td>
                                  <td></td>
                               </tr>  
                            </table>
          
          <script type="text/javascript">
                                $('#importedfilesdate').datetimepicker({
                                  format: 'yyyy-MM-dd',
                                  language: 'en-US'
                                });
         </script>       
	<!--</div>-->


<jsp:include page="/WEB-INF/jsp/fragments/footer.jsp" />
</body>
</html>