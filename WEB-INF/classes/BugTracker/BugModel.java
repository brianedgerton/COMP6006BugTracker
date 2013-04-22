package BugTracker;
import org.w3c.dom.*;
import javax.xml.parsers.*;
import java.io.*;
import java.util.ArrayList;

public class BugModel extends XMLModel {

    public BugModel( String xmlDir ) {
        super(xmlDir + "/bugs.xml");
    }

    public Bug[] getList() {
        try {
            Document doc = readFile();
            NodeList bugs = doc.getElementsByTagName( "bug" );
            Bug[] bugArray = new Bug[ bugs.getLength() ];
            for (int i=0; i < bugs.getLength(); i++) {
                Node bug = bugs.item(i);

                if (isTextNode(bug)) {
                    continue;
                }
                
                bugArray[i] = new Bug( bug );
            }
            return bugArray;
        } catch ( Exception e ) {
            System.out.println( "Problem reading file" );
            System.out.println( e );
        }
        return new Bug[0];
    }

    public Bug getById( String id ) {
        try {
            Document doc = readFile();
            NodeList bugs = doc.getElementsByTagName( "bug" );

            for (int i=0; i < bugs.getLength(); i++) {
                Node bug = bugs.item(i);

                if (isTextNode(bug)) {
                    continue;
                }
                Bug bugObj = new Bug( bug );
                if ( bugObj.bugid.equals( id ) ) {
                    return bugObj;
                }
            }

        } catch ( Exception e ) {
            System.out.println( "Problem reading file" );
            System.out.println( e );
        }
        return null;
    }

}

