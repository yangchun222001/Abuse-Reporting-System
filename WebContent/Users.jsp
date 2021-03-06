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
                <li ><a href="ChangePassword.jsp">Change Password</a></li>
                <li><a href="index.jsp">Log Out</a></li>
              </ul>
            </li>
          </ul>
          <ul class="nav navbar-nav">
            <li class="dropdown">
            	<a href="#" class="dropdown-toggle" data-toggle="dropdown">Report Abuse &nbsp;<span class="badge"><%=session.getAttribute("submittedreport") %></span><b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li ><a href="CreateAbuseReportViewPage.jsp">Create Abuse Report</a></li>
                <li ><a href="<%= response.encodeUrl(request.getContextPath() + "/Controller?action=approveabusereport") %>">Approve Abuse Reports &nbsp;<span class="badge"><%=session.getAttribute("submittedreport") %></span></a></li>
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
    <%List<User> listOfUsers = (List<User>)request.getAttribute("listOfUsers");%>
    <div class="container" style="padding-top:80px">
<div class="container">
    <div class="row">
        <div class="col-xs-6" style="padding:0px">
            <h3 class="text-left">
                Users
            </h3> 
        </div>
        <div class="col-xs-6" style="padding:0px">
            <h3 class="text-right">
                <a id="btn-create" type="button" class="btn btn-primary" href="<%= response.encodeUrl(request.getContextPath() + "/Controller?action=newuser") %>"><i class="glyphicon glyphicon-plus"></i>&nbsp;New User</a>
            </h3> 
        </div>
      </div>
      <div class="row">
      	  <div class="col-md-8" style="padding:3px">
        </div>
        <div class="col-md-4" style="padding:3px">
 			 <input id="filter" type="text" class="form-control" placeholder="Search..." >
		</div>
        <div id="no-more-tables" style="padding:3px"> 		               
            <table class="col-md-12 table-bordered table-striped table-condensed cf " style="padding:0px; width: 100%;">
        		<thead class="cf">
        			<tr>
        				<th>User ID</th>
        				<th>User Type</th>
        				<th>User Account</th>
        				<th>First Name</th>
        				<th>Last Name</th>
        				<th>Sex</th>
        				<th>Telephone</th>
        				<th>Date of Birth</th>
        				<th>Marital Status</th>
        				<th>Address</th>
        			</tr>
        		</thead>
        		<tbody class="searchable">
        			<%for(User user : listOfUsers) {%><tr >
        				<td data-title="User ID"><a href="CreateAbuseReportViewSingle.jsp" style="font-weight:bold"><%=user.getId() %></a></td>
        				<td data-title="User Type"><%if(user.getUserType()==2){ %>Supervisor<%}else if(user.getUserType()==3){ %>Staff<%}else if(user.getUserType()==4) {%>Human Rights Committee<%} %></td>
        				<td data-title="User Account"><%=user.getEmail() %></td>
        				<td data-title="First Name"><%=user.getUserName() %></td>
        				<td data-title="Last Name"><%=user.getUserLastName() %></td>
        				<td data-title="Sex"><%=user.getSex() %></td>
        				<td data-title="Telephone"><%=user.getTelephone() %></td>
        				<td data-title="Date of Birth"><%=user.getBirthday() %></td>
        				<td data-title="Marital Status"><%=user.getMaritalStatus() %></td>
        				<td data-title="Address"><%=user.getUserAddress() %></td>
        			</tr><%} %>
        			        			
        		</tbody>
        	</table>
        </div>
    </div>
</div>  
    </div> 
    <script src="js/jquery-1.11.0.js"></script>
    <script src="js/bootstrap.js"></script>
        <script type='text/javascript'>   
		$(document).ready(function () {
		
		    (function ($) {
		
		        $('#filter').keyup(function () {
		
		            var rex = new RegExp($(this).val(), 'i');
		            $('.searchable tr').hide();
		            $('.searchable tr').filter(function () {
		                return rex.test($(this).text());
		            }).show();
		
		        })
		
		    }(jQuery));
		
		});

		$('.table-hover tr').click(function() {
		    var rowId = $(this).data("rowKey");
		    alert(rowId);
		});
</script>
    
  </body>
</html>