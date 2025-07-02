# Use official Tomcat with JDK 17 as base image
FROM tomcat:10.1-jdk17

# Set environment variables
ENV WAR_FILE=calculator.war
ENV APP_DIR=/usr/local/tomcat/webapps/

# Clean default apps (optional)
RUN rm -rf ${APP_DIR}ROOT ${APP_DIR}docs ${APP_DIR}examples

# Copy the WAR file into the webapps directory
COPY target/${WAR_FILE} ${APP_DIR}

# Expose default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
