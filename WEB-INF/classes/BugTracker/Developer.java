package BugTracker;
import org.w3c.dom.*;
import javax.xml.parsers.*;
import java.io.*;

public class Developer extends XMLEntity {
    public String developerid;
    public String developername;

    public Developer() {
        
    }

    public Developer fromXML( Node xml ) {
        Element el = (Element)xml;
        this.developerid = el.getElementsByTagName( "developerid" ).item( 0 ).getTextContent();
        this.developername = el.getElementsByTagName( "developername" ).item( 0 ).getTextContent();
        return this;
    }

    public Document createXML( Document doc, Element root ) {
        return doc;
    }

}