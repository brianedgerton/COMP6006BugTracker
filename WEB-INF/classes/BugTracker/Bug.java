package BugTracker;
import org.w3c.dom.*;
import javax.xml.parsers.*;
import java.io.*;

public class Bug extends XMLEntity {
    public String bugid;
    public String createdon;
    public String title;
    public String priority;
    public String project;
    public String owner;
    public String description;

    public Bug( Node xml ) {
        Element el = (Element)xml;
        this.bugid = el.getElementsByTagName( "bugid" ).item( 0 ).getTextContent();
        this.createdon = el.getElementsByTagName( "createdon" ).item( 0 ).getTextContent();
        this.title = el.getElementsByTagName( "title" ).item( 0 ).getTextContent();
        this.priority = el.getElementsByTagName( "priority" ).item( 0 ).getTextContent();
        this.project = el.getElementsByTagName( "project" ).item( 0 ).getTextContent();
        this.owner = el.getElementsByTagName( "owner" ).item( 0 ).getTextContent();
        this.description = el.getElementsByTagName( "description" ).item( 0 ).getTextContent();
    }

}