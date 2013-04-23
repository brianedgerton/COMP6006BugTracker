package BugTracker;
import org.w3c.dom.*;
import javax.xml.parsers.*;
import java.io.*;
import java.util.*;
import java.lang.reflect.*;

abstract class XMLEntity {

    abstract Document createXML( Document doc, Element root );

}