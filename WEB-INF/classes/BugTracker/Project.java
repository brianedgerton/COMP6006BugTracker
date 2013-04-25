package BugTracker;
import org.w3c.dom.*;
import javax.xml.parsers.*;
import java.io.*;

public class Project extends XMLEntity {
    public String projectid;
    public String projectname;

    public Project() {
        
    }

    public Project fromXML( Node xml ) {
        Element el = (Element)xml;
        this.projectid = el.getElementsByTagName( "projectid" ).item( 0 ).getTextContent();
        this.projectname = el.getElementsByTagName( "projectname" ).item( 0 ).getTextContent();
        return this;
    }

    public Document createXML( Document doc, Element root ) {
        return doc;
    }

}