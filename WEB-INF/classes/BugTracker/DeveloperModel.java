package BugTracker;
import org.w3c.dom.*;
import javax.xml.parsers.*;
import java.io.*;
import java.util.ArrayList;

public class DeveloperModel extends XMLModel {

    public DeveloperModel( String xmlDir ) {
        super(xmlDir + "/developers.xml");
    }

    public Developer[] getList() {
        try {
            Document doc = readFile();
            NodeList developers = doc.getElementsByTagName( "developer" );
            Developer[] developerArray = new Developer[ developers.getLength() ];
            for (int i=0; i < developers.getLength(); i++) {
                Node developer = developers.item(i);

                if (isTextNode(developer)) {
                    continue;
                }
                
                developerArray[i] = new Developer().fromXML( developer );
            }
            return developerArray;
        } catch ( Exception e ) {
            System.out.println( "Problem reading file" );
            System.out.println( e );
        }
        return new Developer[0];
    }

    public Developer getById( String id ) {
        try {
            Document doc = readFile();
            NodeList developers = doc.getElementsByTagName( "developer" );

            for (int i=0; i < developers.getLength(); i++) {
                Node developer = developers.item(i);

                if (isTextNode(developer)) {
                    continue;
                }
                Developer developerObj = new Developer().fromXML( developer );
                if ( developerObj.developerid.equals( id ) ) {
                    return developerObj;
                }
            }

        } catch ( Exception e ) {
            System.out.println( "Problem reading file" );
            System.out.println( e );
        }
        return null;
    }

}

