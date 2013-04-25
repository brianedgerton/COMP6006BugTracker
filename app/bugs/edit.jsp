<%-- This file should load an existing bug for editing. --%>
<%@page import="BugTracker.*, org.w3c.dom.*, javax.xml.parsers.*, java.io.*, java.util.*" %>

<%
    String xmlDir = getServletContext().getRealPath( "app/xml" );
    BugModel bugModel = new BugModel( xmlDir );
    Bug bug = bugModel.getById( request.getParameter( "id" ) );

    Map priorityOptions = new LinkedHashMap();
    priorityOptions.put( "", "-- Select Priority --" );
    priorityOptions.put( "Low", "Low" );
    priorityOptions.put( "Medium", "Medium" );
    priorityOptions.put( "High", "High" );
    priorityOptions.put( "Critical", "Critical" );

    String prioritySelect = FormHelper.selectBox( "priority", priorityOptions, bug.priority );


    DeveloperModel devModel = new DeveloperModel( xmlDir );
    Developer[] developers = devModel.getList();    

    Map assignToOptions = new LinkedHashMap();
    assignToOptions.put( "", "-- Select Owner --" );
    for (int i=0; i < developers.length; i++) {
        Developer developer = developers[i];
        assignToOptions.put( developer.developerid, developer.developername );
    };
    
    String assignToSelect = FormHelper.selectBox( "owner", assignToOptions, bug.owner );


    ProjectModel projModel = new ProjectModel( xmlDir );
    Project[] projects = projModel.getList();    

    Map projectOptions = new LinkedHashMap();

    projectOptions.put( "", "-- Select Project --" );
    for (int i=0; i < projects.length; i++) {
        Project project = projects[i];
        projectOptions.put( project.projectid, project.projectname );
    };
    
    String projectSelect = FormHelper.selectBox( "project", projectOptions, bug.project );

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
                        <%= projectSelect %>
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
            <button type="submit" class="btn">Submit Changes</button>
            <button style="color:red" type="submit" class="btn">Close Bug</button>
        </fieldset>
        <input type="hidden" name="bugid" value="<%= bug.bugid %>" />
        <input type="hidden" name="createdon" value="<%= bug.createdon %>" />
    </form>

<jsp:include page="../partials/footer.jsp" />