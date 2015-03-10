<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="CS509 Group1">
    <meta name="keywords" content="Abuse,Report,DDS">
    <title>Abuse Report System</title>
    <link rel="shortcut icon" href="img/icon.ico">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="css/bootstrap.css">
  </head>
  <body>
  <!------------------------------------------- Navigation Bar -------------------------------------------------------------->
	<div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
      	<div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="CreateAbuseReportViewPage.jsp">Abuse Report System</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
        	<li class="dropdown">
          	  <a href="#" class="dropdown-toggle" data-toggle="dropdown" ><span class="glyphicon glyphicon-user"></span>Hi, <%= session.getAttribute("userName") %><b class="caret"></b></a>
          	  <ul class="dropdown-menu">
                <li ><a href="<%= response.encodeUrl(request.getContextPath() + "/Controller?action=changepassword") %>">Change Password</a></li>
                <li><a href="index.jsp">Log Out</a></li>
              </ul>
            </li>
          </ul>
          <ul class="nav navbar-nav">
            <li class="dropdown">
            	<a href="#" class="dropdown-toggle" data-toggle="dropdown">Report Abuse &nbsp;<span class="badge"><%=session.getAttribute("submittedreport") %></span><b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li ><a href="CreateAbuseReportViewPage.jsp">Create Abuse Report</a></li>
                <li ><a href="ChangePassword.jsp">Approve Abuse Reports &nbsp;<span class="badge"><%=session.getAttribute("submittedreport") %></span></a></li>
              </ul>
            <li><a href="TrackReports.jsp">Track Reports</a></li>
            <li><a href="Documents.jsp">Documents</a></li>
            <li><a href="Help.jsp">Help</a></li>
            <li class="dropdown active">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Admin Panel<b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li ><a href="<%= response.encodeUrl(request.getContextPath() + "/Controller?action=user") %>">Users</a></li>
                <li ><a href="<%= response.encodeUrl(request.getContextPath() + "/Controller?action=patient") %>">Patients</a></li>
                <li ><a href="<%= response.encodeUrl(request.getContextPath() + "/Controller?action=homegroup") %>">Home Groups</a></li>
                <li ><a href="<%= response.encodeUrl(request.getContextPath() + "/Controller?action=disability") %>">Disabilities</a></li>
                <li ><a href="<%= response.encodeUrl(request.getContextPath() + "/Controller?action=drug") %>">Drugs</a></li>
              </ul>
            </li>
          </ul>

        </div><!--/.nav-collapse -->
      </div>
    </div>  
  <!------------------------------------------- Nevigation Bar End-------------------------------------------------------------->
     <%@page import="java.util.List,bean.*" %>
    <div class="container" style="padding-top:80px">
<div class="container">
    <div class="row">
        <div class="col-xs-6" style="padding:0px">
            <h3 class="text-left">
                Change Password
            </h3> 
        </div>
        
      </div>
      <div class="row">
      	  <form  name="frmForm" class="form-horizontal" method="post" action="<%= response.encodeUrl(request.getContextPath() + "/Controller?action=dochangepassword") %>">
			<fieldset>
			<legend>   <font color="red"> <c:out value="${message}" /></font></legend> 
      					<div class="form-group">
				  <label class="col-md-4 control-label" for="addrepoter">User Name</label>
				  <div class="col-md-4">
				<p><%=session.getAttribute("account") %></p>
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="oldpassword">Old Password</label>  
				  <div class="col-md-4">
				  <input id="username" name="oldpassword" type="password" placeholder="oldpassword" class="form-control input-md" required>
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="newpassword">New Password</label>  
				  <div class="col-md-4">
				  <input id="username" name="newpassword" type="password" placeholder="newpassword" class="form-control input-md" required>
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="oldpassword">Repeat Password</label>  
				  <div class="col-md-4">
				  <input id="username" name="newpassword2" type="password" placeholder="repeat newpassword" class="form-control input-md" required>
				  </div>
				</div>
				
				<!-- Button (Double) -->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="save"></label>
				  <div class="col-md-8">
				<a href="ChangePassword.jsp" id="cancel" name="cancel" class="btn btn-default">Cancel</a>
				<input type="submit" value="Create" class="btn btn-success"></input>
				</div>
				</div>
				</fieldset>
				</form>
    </div>
    </div> 
    </div>
    <script src="js/jquery-1.11.0.js"></script>
    <script src="js/bootstrap.js"></script>
  </body>
</html>