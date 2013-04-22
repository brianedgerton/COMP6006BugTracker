package BugTracker;

import java.util.*;

public class FormHelper {

    public static String selectBox( String name, Map options, String defaultValue ) {
        String html = "<select name=\""+name+"\">\n";

        Iterator i = options.entrySet().iterator();

        while ( i.hasNext() ) {
            Map.Entry opt = (Map.Entry)i.next();
            String val = (String)opt.getKey();
            String text = (String)opt.getValue();

            html += "<option value=\""+val+"\" ";
            if ( val.equals( defaultValue ) ) {
                html += "selected=\"selected\" ";
            }
            html += ">"+text+"</option>\n";
        }

        html += "</select>\n";

        return html;
    }

}