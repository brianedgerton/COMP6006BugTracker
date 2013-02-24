# COMP6006 Bug Tracker

## Getting Started

Install [Apache Tomcat](http://tomcat.apache.org/) for your platform. Using Homebrew works well for OS X.

To find the catalina $HOME directory:

```bash
$ catalina -h
```

On OS X, the output might include:

```bash
Using CATALINA_HOME:   /usr/local/Cellar/tomcat/7.0.37/libexec
```

Clone this repository to the `webapps` directory of CATALINA_HOME.

Start the Tomcat server:

```bash
$ catalina run
```

Assuming the default Tomcat settings and folder name of this repository, you should be able to access the application at

```
http://localhost:8080/COMP6006BugTracker/app/
```