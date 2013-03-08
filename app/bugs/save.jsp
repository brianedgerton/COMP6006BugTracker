<%-- This file should save bug information to an xml file. It will receive POST requests from forms on /bugs/new.jsp and /bugs/edit.jsp
Check for an ID in the POST request and load the existing bug to edit if present or create a new bug if not present.
This file will not render any HTML, it will only redirect to existing pages.
--%> 

<%@page import="java.io.*,org.w3c.dom.*,javax.xml.parsers.*,javax.xml.transform.*, javax.xml.transform.dom.*,javax.xml.transform.stream.*"%>
<%!
	public void createXmlTree(Document doc,String title,String priority,String project,String owner,String description) throws Exception {
		System.out.println(title);
		System.out.println(priority);
		System.out.println(project);
		System.out.println(owner);
		System.out.println(description);
		
		Element root = doc.createElement("bug");
		doc.appendChild(root);
		
		Element child1 = doc.createElement("title");
		root.appendChild(child1);

		Text text1 = doc.createTextNode(title);
		child1.appendChild(text1);

		Element child2 = doc.createElement("priority");
		root.appendChild(child2);

		Text text2 = doc.createTextNode(priority);
		child2.appendChild(text2);

		Element child3 = doc.createElement("project");
		root.appendChild(child3);

		Text text3 = doc.createTextNode(project);
		child3.appendChild(text3);

		Element child4 = doc.createElement("owner");
		root.appendChild(child4);

		Text text4 = doc.createTextNode(owner);
		child4.appendChild(text4);
		
		Element child5 = doc.createElement("description");
		root.appendChild(child5);

		Text text5 = doc.createTextNode(description);
		child5.appendChild(text5);

		TransformerFactory factory = TransformerFactory.newInstance();
		Transformer transformer = factory.newTransformer();

		transformer.setOutputProperty(OutputKeys.INDENT, "yes");
		
		StringWriter sw = new StringWriter();
		StreamResult result = new StreamResult(sw);
		DOMSource source = new DOMSource(doc);
		transformer.transform(source, result);
		String xmlString = sw.toString();
		
		System.out.println(xmlString);

		//FileWriter file = new FileWriter(application.getRealPath("bugs.xml"), true);
		//BufferedWriter bw = new BufferedWriter(file); 
		//File file = new File("localhost:8080/COMP6006BugTracker/app/xml/bugs.xml");
		//BufferedWriter bw = new BufferedWriter(new FileWriter(file));
		//bw.write(xmlString);
		//bw.flush();
		//bw.close();
	}
%>
	
<%
	String title=request.getParameter("title");
	String priority=request.getParameter("priority");
	String project=request.getParameter("project");
	String assignto=request.getParameter("owner");
	String description=request.getParameter("description");
	
	DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
	DocumentBuilder docBuilder = builderFactory.newDocumentBuilder();
	Document doc = docBuilder.newDocument();
	createXmlTree(doc,title,priority,project,assignto,description);
%>

<jsp:include page="../partials/header.jsp">
    <jsp:param name="page_title" value="Bug Submitted" />
</jsp:include>
    <h2>Bug Submitted</h2>
	<html>
		<head>
			<title>Bug Submitted</title>
		</head>
		<body>
			<p><br>You have submitted</p>
			<table>
				<tbody>
					<tr>
						<td>Title</td>
						<td>:</td>
						<td><%=title %></td>
					</tr>
					<tr>
						<td>Priority</td>
						<td>:</td>
						<td><%=priority %></td>
					</tr>
					<tr>
						<td>Project</td>
						<td>:</td>
						<td><%=project %></td>
					</tr>
					<tr>
						<td>project</td>
						<td>:</td>
						<td><%=project %></td>
					</tr>
					<tr>
						<td>project</td>
						<td>:</td>
						<td><%=project%></td>
					</tr>
					<tr>
						<td>Description</td>
						<td>:</td>
						<td><%=description %></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</body>
	</html>
<jsp:include page="../partials/footer.jsp" /> 

