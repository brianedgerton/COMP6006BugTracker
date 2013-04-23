<%-- This file presents a form for creating a new bug. --%>

<jsp:include page="../partials/header.jsp">
    <jsp:param name="page_title" value="Bugs::New" />
</jsp:include>
    <h2>Search for Bug</h2>
	<form action="/COMP6006BugTracker/app/bugs/list.jsp" method="post">
		<fieldset>
			<legend></legend>
            <div class="container">
				<div class="row">
					<div class="span4">
						<label>Bug ID</label>
                        <input type="text" name="bugid"/>
					</div>
				</div>
			</div>
            <button type="submit" value="Submit" class="btn">Search</button>
		</fieldset>
	</form>
<jsp:include page="../partials/footer.jsp" /> 