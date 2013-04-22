<%-- This file should load an existing bug for editing. --%>
<%@page import="BugTracker.*, org.w3c.dom.*, javax.xml.parsers.*, java.io.*, java.util.*" %>

<%
    String xmlDir = getServletContext().getRealPath( "app/xml" );
    BugModel bugModel = new BugModel( xmlDir );
    Bug bug = bugModel.getById( request.getParameter( "id" ) );
    System.out.println(bug);

    Map priorityOptions = new LinkedHashMap();
    priorityOptions.put( "Low", "Low" );
    priorityOptions.put( "Medium", "Medium" );
    priorityOptions.put( "High", "High" );
    priorityOptions.put( "Critical", "Critical" );

    String prioritySelect = FormHelper.selectBox( "priority", priorityOptions, bug.priority );

    Map assignToOptions = new LinkedHashMap();
    assignToOptions.put( "Sam Beam", "Sam Beam" );
    assignToOptions.put( "John Smith", "John Smith" );
    assignToOptions.put( "Jimmy Paige", "Jimmy Paige" );
    assignToOptions.put( "Dave Thomas", "Dave Thomas" );

    String assignToSelect = FormHelper.selectBox( "owner", assignToOptions, bug.owner );

    bug.save();

%>
<jsp:include page="../partials/header.jsp">
    <jsp:param name="page_title" value="Bugs::Edit" />
</jsp:include>

    <h2>Edit Bug</h2>
    
    <form action="/COMP6006BugTracker/app/bugs/save.jsp" method="post">
        <fieldset>
            <legend>Bug</legend>
            <div class="container">
                <div class="row">
                    <div class="span4">
                        <label>Title</label>
                        <input type="text" name="title" value="<%= bug.title %>"/>
                    </div>
                    <div class="span4">
                        <label>Priority</label>
                        <%= prioritySelect %>
                    </div>
                </div>
                <div class="row">
                    <div class="span4">
                        <label>Project</label>
                        <input type="text" name="project" value="<%= bug.project %>" />
                    </div>
                    <div class="span4">
                        <label>Assign To</label>
                        <%= assignToSelect %>
                    </div>
                </div>
                <div class="row">
                    <div class="span8">
                        <label>Description</label>
                        <textarea name="description" rows="10" style="width:100%"><%= bug.description %></textarea>
                    </div>
                </div>
            </div>
            <button type="submit" class="btn">Submit</button>
        </fieldset>
        <input type="hidden" name="id" value="<%= bug.bugid %>" />
    </form>

<jsp:include page="../partials/footer.jsp" />