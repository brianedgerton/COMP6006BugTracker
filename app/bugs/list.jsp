<%@page import="BugTracker.*, org.w3c.dom.*, javax.xml.parsers.*, java.io.*, java.util.*" %>

<%
	String xmlDir = getServletContext().getRealPath( "app/xml" );
	String bugid = request.getParameter("bugid");
	Boolean bugFound = false;
	System.out.println(bugid);
	BugModel bugModel = new BugModel( xmlDir );
	Bug[] bugs = bugModel.getList();
	

%>
<jsp:include page="../partials/header.jsp">
    <jsp:param name="page_title" value="Bugs" />
</jsp:include>

    <h2>Bug List</h2>
    
<html>
	<head><title>Bug List</title></head>
	<body>  
		<p> 
		(Click on Bug ID to edit)
		</p>
		<table class="table table-striped table-hover table-bordered">
			<thead>
				<tr>
					<th>Bug ID</th>
					<th>Created</th>
					<th>Modified</th>
					<th>Title</th>
					<th>Priority</th>
					<th>Project</th>
					<th>Owner</th>
					<th>Description</th>
				</tr>
			</thead>
			<tbody>
			<%
			
			for (int i=0; i < bugs.length; i++) {
				Bug bug = bugs[i];
				
				System.out.println(bugid != "");
				
				if (bugid == null || bugid.equals(bug.bugid)){
					bugFound = true;
			%>
				<tr>
					<td><a href="/COMP6006BugTracker/app/bugs/edit.jsp?id=<%= bug.bugid %>"><%= bug.bugid %></a></td>
					<td><%= bug.createdon %></td>
					<td><%= bug.modifiedon %></td>
					<td><%= bug.title %></td>
					<td><%= bug.priority %></td>
					<td><%= bug.project %></td>
					<td><%= bug.owner %></td>
					<td><%= bug.description %></td>
				</tr>
			<%
				}
			}
			%>
			</tbody>
		</table>
		
		<%
		if (!bugFound && bugs.length != 0){
			%>
			</br>
			<p class="text-center" style="color:red"><strong>Sorry, bug not found! Please check the BugID and try again!</strong></p>
			</br>
			<%
		}
		else if (bugs.length == 0){
			%>
			</br>
			<p class="text-center""><strong>There are currently no reported bugs!</strong></p>
			</br>
			<%
		}
		
		%>
		<p class="text-right">
		<a href="/COMP6006BugTracker/app/bugs/search.jsp" class="btn btn-primary btn-large">Search</a>
		<a href="/COMP6006BugTracker/app/bugs/new.jsp" class="btn btn-primary btn-large">Add New Bug</a>
		</p>
	</body>
</html>
<jsp:include page="../partials/footer.jsp" /> 