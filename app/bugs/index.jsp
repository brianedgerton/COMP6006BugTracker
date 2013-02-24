<%-- This file should list bugs. --%>
<jsp:include page="../partials/header.jsp">
    <jsp:param name="page_title" value="Bugs" />
</jsp:include>

    <h2>Bug List</h2>
    
    <p>We'll display a list of submitted bugs here.</p>

    <table class="table table-striped table-hover table-bordered">
        <thead>
            <tr>
                <th>#</th>
                <th>Title</th>
                <th>Priority</th>
                <th>Assigned To</th>
                <th>Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td><a href="/COMP6006BugTracker/app/bugs/view.jsp?id=1">Something's not working</a></td>
                <td><span class="label label-warning">Medium</span></td>
                <td>John Smith</td>
                <td>Oct 3, 2012</td>
                <td class="text-success">In queue</td>
            </tr>
            <tr>
                <td>2</td>
                <td><a href="/COMP6006BugTracker/app/bugs/view.jsp?id=1">Button Broken</a></td>
                <td><span class="label label-important">Critical</span></td>
                <td>Sam Beam</td>
                <td>Oct 7, 2012</td>
                <td class="text-success">Awaiting Feedback</td>
            </tr>
            <tr>
                <td>3</td>
                <td><a href="/COMP6006BugTracker/app/bugs/view.jsp?id=1">No emails are being sent</a></td>
                <td><span class="label label-warning">Medium</span></td>
                <td>John Smit</td>
                <td>Oct 4, 2012</td>
                <td class="text-success">In queue</td>
            </tr>
            <tr>
                <td>4</td>
                <td><a href="/COMP6006BugTracker/app/bugs/view.jsp?id=1">Getting error message</a></td>
                <td><span class="label">Low</span></td>
                <td>Jimmy Paige</td>
                <td>Sept 9, 2012</td>
                <td class="text-success">In process</td>
            </tr>
            <tr>
                <td>5</td>
                <td><a href="/COMP6006BugTracker/app/bugs/view.jsp?id=1">System error</a></td>
                <td><span class="label label-important">Critical</span></td>
                <td>Dave Thomas</td>
                <td>Oct 14, 2012</td>
                <td class="text-success">In queue</td>
            </tr>
        </tbody>
    </table>
    <p class="text-right">
        <a href="/COMP6006BugTracker/app/bugs/new.jsp" class="btn btn-primary btn-large">Add New Bug</a>
    </p>

<jsp:include page="../partials/footer.jsp" />