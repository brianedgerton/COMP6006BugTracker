package BugTracker;
import org.w3c.dom.*;
import javax.xml.parsers.*;
import java.io.*;
import java.util.ArrayList;

public class ProjectModel extends XMLModel {

    public ProjectModel( String xmlDir ) {
        super(xmlDir + "/projects.xml");
    }

    public Project[] getList() {
        try {
            Document doc = readFile();
            NodeList projects = doc.getElementsByTagName( "project" );
            Project[] projectArray = new Project[ projects.getLength() ];
            for (int i=0; i < projects.getLength(); i++) {
                Node project = projects.item(i);

                if (isTextNode(project)) {
                    continue;
                }
                
                projectArray[i] = new Project().fromXML( project );
            }
            return projectArray;
        } catch ( Exception e ) {
            System.out.println( "Problem reading file" );
            System.out.println( e );
        }
        return new Project[0];
    }

    public Project getById( String id ) {
        try {
            Document doc = readFile();
            NodeList projects = doc.getElementsByTagName( "project" );

            for (int i=0; i < projects.getLength(); i++) {
                Node project = projects.item(i);

                if (isTextNode(project)) {
                    continue;
                }
                Project projectObj = new Project().fromXML( project );
                if ( projectObj.projectid.equals( id ) ) {
                    return projectObj;
                }
            }

        } catch ( Exception e ) {
            System.out.println( "Problem reading file" );
            System.out.println( e );
        }
        return null;
    }

}

