<%-- This file should load an existing bug for editing. --%>

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
                        <input type="text" name="title" />
                    </div>
                    <div class="span4">
                        <label>Priority</label>
                        <select name="priority">
                            <option>Low</option>
                            <option>Medium</option>
                            <option>High</option>
                            <option>Critical</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="span4">
                        <label>Project</label>
                        <input type="text" name="project" />
                    </div>
                    <div class="span4">
                        <label>Assign To</label>
                        <select name="assignto">
                            <option>Sam Beam</option>
                            <option>John Smith</option>
                            <option>Jimmy Paige</option>
                            <option>Dave Thomas</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="span8">
                        <label>Description</label>
                        <textarea name="description" rows="10" style="width:100%"></textarea>
                    </div>
                </div>
            </div>
            <button type="submit" class="btn">Submit</button>
        </fieldset>
        <input type="hidden" name="id" />
    </form>

<jsp:include page="../partials/footer.jsp" />