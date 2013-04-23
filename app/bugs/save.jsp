<%-- This file should save bug information to an xml file. It will receive POST requests from forms on /bugs/new.jsp and /bugs/edit.jsp
Check for an ID in the POST request and load the existing bug to edit if present or create a new bug if not present.
This file will not render any HTML, it will only redirect to existing pages.
--%> 

<%@page import="java.io.*,org.w3c.dom.*,javax.xml.parsers.*,javax.xml.transform.*, javax.xml.transform.dom.*,javax.xml.transform.stream.*,java.util.*,java.Text.*"%>
<%!

	public void createXmlTree(String bugid,String createdon,String title,String priority,String project,String owner,String description) throws Exception {

		Element root; 
		DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance(); 
		DocumentBuilder docBuilder = builderFactory.newDocumentBuilder(); 
		Document doc = docBuilder.newDocument(); 
		File file = new File(getServletContext().getRealPath("app/xml/bugs.xml")); 

		if (file.exists()) 
		{ 
			doc = docBuilder.parse(file); 
			root = doc.getDocumentElement(); 
			String sr = root.getNodeName();  
		} 
		else 
		{ 
			root = doc.createElement("bugs"); 
			doc.appendChild(root); 
		} 
		
		Element bugChild = doc.createElement("bug");
		root.appendChild(bugChild);
		
		Element childBugID = doc.createElement("bugid");
		bugChild.appendChild(childBugID);
		
		Text textBugID = doc.createTextNode(bugid);
		childBugID.appendChild(textBugID);
		
		Element child0 = doc.createElement("createdon");
		bugChild.appendChild(child0);
		
		Text text0 = doc.createTextNode(createdon);
		child0.appendChild(text0);
		
		Element child1 = doc.createElement("title");
		bugChild.appendChild(child1);

		Text text1 = doc.createTextNode(title);
		child1.appendChild(text1);

		Element child2 = doc.createElement("priority");
		bugChild.appendChild(child2);

		Text text2 = doc.createTextNode(priority);
		child2.appendChild(text2);

		Element child3 = doc.createElement("project");
		bugChild.appendChild(child3);

		Text text3 = doc.createTextNode(project);
		child3.appendChild(text3);

		Element child4 = doc.createElement("owner");
		bugChild.appendChild(child4);

		Text text4 = doc.createTextNode(owner);
		child4.appendChild(text4);
		
		Element child5 = doc.createElement("description");
		bugChild.appendChild(child5);

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

		FileWriter fw = new FileWriter(file,false);
		BufferedWriter bw = new BufferedWriter(fw);
		bw.write(xmlString);
		bw.flush();
		bw.close();
		
	}
%>
	
<%
	String title=request.getParameter("title");
	String priority=request.getParameter("priority");
	String project=request.getParameter("project");
	String assignto=request.getParameter("owner");
	String description=request.getParameter("description");
	
	Date today;  
	String createdon, bugid;  
	java.text.SimpleDateFormat formatter;  
	formatter = new java.text.SimpleDateFormat("MM/dd/yyyy HH:mm:ss");  
	today = new Date();  
	createdon = formatter.format(today);
	
	formatter =  new java.text.SimpleDateFormat("yyMMddHHmmss");
	Date date = new Date();
	bugid = formatter.format(date);

	createXmlTree(bugid,createdon,title,priority,project,assignto,description);
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
						<td>Bug ID</td>
						<td>:</td>
						<td><%=bugid %></td>
					</tr>
					<tr>
						<td>Created On</td>
						<td>:</td>
						<td><%=createdon %></td>
					</tr>
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
						<td>Owner</td>
						<td>:</td>
						<td><%=assignto %></td>
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
