package BugTracker;
import org.w3c.dom.*;
import javax.xml.parsers.*;
import java.io.*;
import java.util.*;
import java.lang.reflect.*;

abstract class XMLEntity {

    public XMLEntity save() {
        Field[] fields = this.getClass().getFields();

        // for( Field f : fields ) {
        //     String name = f.getName();
        //     Object val = f.get( this );
        //     //System.out.println( f.get(this) );
        // }

        return this;
    }

}