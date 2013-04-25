<%@page import="BugTracker.*, org.w3c.dom.*, javax.xml.parsers.*, java.io.*, java.util.*" %>

<%
	String xmlDir = getServletContext().getRealPath( "app/xml" );
	BugModel bugModel = new BugModel( xmlDir );
	Bug[] bugs = bugModel.getList();

	DeveloperModel devModel = new DeveloperModel( xmlDir );
	ProjectModel projModel = new ProjectModel( xmlDir );

%>
<jsp:include page="../partials/header.jsp">
    <jsp:param name="page_title" value="Bugs" />
</jsp:include>

    <h2>Bug List</h2>
    
<html>
	<head><title>Bug List</title></head>
	<body>  
		<table class="table table-striped table-hover table-bordered">
			<thead>
				<tr>
					<th>Bug ID</th>
					<th>Created</th>
					<th>Title</th>
					<th>Priority</th>
					<th>Project</th>
					<th>Owner</th>
				</tr>
			</thead>
			<tbody>
			<%
			
			for (int i=0; i < bugs.length; i++) {
				Bug bug = bugs[i];
				String owner = null;
				String project = null;
				Developer dev = null;
				Project proj = null;

				if ( bug.owner != null ) {
					dev = devModel.getById( bug.owner );
					if ( dev != null ) {
						owner = dev.developername;
					} else {
						owner = bug.owner;
					}
				}

				if ( bug.project != null ) {
					proj = projModel.getById( bug.project );
					if ( proj != null ) {
						project = proj.projectname;
					} else {
						project = bug.project;
					}
				}
			%>
				<tr>
					<td><a href="/COMP6006BugTracker/app/bugs/edit.jsp?id=<%= bug.bugid %>"><%= bug.bugid %></a></td>
					<td><%= bug.createdon %></td>
					<td><%= bug.title %></td>
					<td><%= bug.priority %></td>
					<td><%= project %></td>
					<td><%= owner %></td>
				</tr>
			<%
			}
			%>
			</tbody>
		</table>
		<p class="text-right">
		<a href="/COMP6006BugTracker/app/bugs/new.jsp" class="btn btn-primary btn-large">Add New Bug</a>
		</p>
	</body>
</html>
<jsp:include page="../partials/footer.jsp" /> 