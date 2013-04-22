package BugTracker;
import org.w3c.dom.*;
import javax.xml.parsers.*;
import java.io.*;
import java.util.ArrayList;

abstract class XMLModel {

    public String PATH = "";
    public Document DOC = null;

    public XMLModel( String path ) {
        PATH = path;
    }

    public boolean isTextNode( Node n ) {
        return n.getNodeName().equals("#text");
    }

    protected Document readFile() 
        throws RuntimeException, ParserConfigurationException, org.xml.sax.SAXException, java.io.IOException
    {
        if ( DOC == null ) {
            DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder = docFactory.newDocumentBuilder();

            File file = new File( PATH );

            if ( ! file.exists() ) {
                throw new RuntimeException("File not found");
            }

            Document doc = docBuilder.parse(file);
            DOC = doc;
        }
        
        return DOC;
    }

    // public void writeFile( String path, NodeList data ) {
    //     Element root; 
    //     DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance(); 
    //     DocumentBuilder docBuilder = builderFactory.newDocumentBuilder(); 
    //     Document doc = docBuilder.newDocument(); 
    //     File file = new File( PATH ); 
    //     if (file.exists()) 
    //     { 
    //         doc = docBuilder.parse(file); 
    //         root = doc.getDocumentElement(); 
    //         String sr = root.getNodeName(); 
    //     } 
    //     else 
    //     { 
    //         root = doc.createElement("users"); 
    //         doc.appendChild(root); 
    //     }


    //     TransformerFactory factory = TransformerFactory.newInstance();
    //     Transformer transformer = factory.newTransformer();

    //     transformer.setOutputProperty(OutputKeys.INDENT, "yes");
        
    //     StringWriter sw = new StringWriter();
    //     StreamResult result = new StreamResult(sw);
    //     DOMSource source = new DOMSource(doc);
    //     transformer.transform(source, result);
    //     String xmlString = sw.toString();
        
    //     System.out.println(xmlString);

    //     FileWriter fw = new FileWriter(file,false);
    //     BufferedWriter bw = new BufferedWriter(fw);
    //     bw.write(xmlString);
    //     bw.flush();
    //     bw.close();

    // }

    abstract XMLEntity[] getList();
    abstract XMLEntity getById( String id );
}