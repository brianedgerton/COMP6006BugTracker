<%-- This file should save bug information to an xml file. It will receive POST requests from forms on /bugs/new.jsp and /bugs/edit.jsp
Check for an ID in the POST request and load the existing bug to edit if present or create a new bug if not present.
This file will not render any HTML, it will only redirect to existing pages.
--%> 
<%@page import="BugTracker.*, java.io.*,org.w3c.dom.*,javax.xml.parsers.*,javax.xml.transform.*, javax.xml.transform.dom.*,javax.xml.transform.stream.*,java.util.*,java.Text.*, java.sql.Timestamp"%>
<%
	if ( request.getMethod() == "POST" ) {
		String xmlDir = getServletContext().getRealPath( "app/xml" );
		BugModel bugModel = new BugModel( xmlDir );
		Bug bug = new Bug();

		String createdon = request.getParameter("createdon");
		System.out.println(createdon);
		if ( createdon.equals("")) {
			java.text.SimpleDateFormat formatter;  
	        formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	        Date today = new Date();  
			createdon = formatter.format(today);
		}
		bug.createdon = createdon;
		bug.title = request.getParameter( "title" );
		bug.priority = request.getParameter( "priority" );
		bug.project = request.getParameter( "project" );
		bug.owner = request.getParameter( "owner" );
		bug.description = request.getParameter( "description" );

		bug.bugid = request.getParameter( "bugid" );
		if ( bug.bugid.equals("") ) {
			long timestamp = System.currentTimeMillis()/1000;
			bug.bugid = "BID-"+timestamp;
		}

		bugModel.save( bug );
	}

	response.sendRedirect( "/COMP6006BugTracker/app/bugs/");

%>