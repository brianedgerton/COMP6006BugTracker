package BugTracker;
import org.w3c.dom.*;
import javax.xml.parsers.*;
import java.io.*;
import java.util.ArrayList;
import javax.xml.transform.*;
import javax.xml.transform.dom.*;
import javax.xml.transform.stream.*;
import java.util.*;

abstract class XMLModel {

    public String PATH = "";
    public Document DOC = null;

    public XMLModel( String path ) {
        PATH = path;
    }

    public boolean isTextNode( Node n ) {
        return n.getNodeName().equals("#text");
    }

    public Document readFile() throws Exception {
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

    public void save( XMLEntity entity ) throws Exception {
        Document doc = null;
        try {
            doc = this.readFile();
        } catch( Exception e ) {

        }
        
        Element root = doc.getDocumentElement();

        doc = entity.createXML( doc, root );

        TransformerFactory factory = TransformerFactory.newInstance();
        Transformer transformer = factory.newTransformer();

        transformer.setOutputProperty(OutputKeys.INDENT, "yes");
        
        StringWriter sw = new StringWriter();
        StreamResult result = new StreamResult(sw);
        DOMSource source = new DOMSource(doc);
        transformer.transform(source, result);
        String xmlString = sw.toString();

        File file = new File( PATH );

        FileWriter fw = new FileWriter(file,false);
        BufferedWriter bw = new BufferedWriter(fw);
        bw.write(xmlString);
        bw.flush();
        bw.close();

    }

    abstract XMLEntity[] getList();
    abstract XMLEntity getById( String id );
}