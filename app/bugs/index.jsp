<%@page import="org.w3c.dom.*, javax.xml.parsers.*, java.io.*" %>
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
					<th>Title</th>
					<th>Priority</th>
					<th>Project</th>
					<th>Owner</th>
					<th>Description</th>
				</tr>
			</thead>
			<%
			  DocumentBuilderFactory docFactory = 
			  DocumentBuilderFactory.newInstance();
			  DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
			  File file = new File("bugs.xml");
			  if(file.exists()){
				Document doc = docBuilder.parse(file);

			%>
			<%!
			  public boolean isTextNode(Node n){
			  return n.getNodeName().equals("#text");
			  }
			%>
			<%
			Element  element = doc.getDocumentElement(); 
			NodeList personNodes = element.getChildNodes(); 
			for (int i=0; i<personNodes.getLength(); i++){
			Node emp = personNodes.item(i);
			if (isTextNode(emp))
			continue;
			NodeList NameDOBCity = emp.getChildNodes();
			%>

			<tbody>
				<tr>
					<%
					for (int j=0; j<NameDOBCity.getLength(); j++ ){
					Node node = NameDOBCity.item(j);
					if ( isTextNode(node)) 
					continue;
					%>
					<td><%= node.getFirstChild().getNodeValue() %></td>
					<%
					} 
					%>
				</tr>
			</tbody>
			<%
			}}
			%>
		</table>
		<p class="text-right">
		<a href="/COMP6006BugTracker/app/bugs/new.jsp" class="btn btn-primary btn-large">Add New Bug</a>
		</p>
	</body>
</html>
<jsp:include page="../partials/footer.jsp" /> 