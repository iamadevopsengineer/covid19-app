# Use the httpd image as a parent image
FROM httpd:2.4

# Install necessary tools
RUN apt-get update && apt-get install -y wget unzip

# Set the working directory to the Apache document root
WORKDIR /usr/local/apache2/htdocs/

# Download the zip file
RUN wget https://linux-devops-course.s3.amazonaws.com/WEB+SIDE+HTML/covid19.zip

# Unzip the file
RUN unzip covid19.zip

# Move the contents of the unzipped directory to the document root
RUN mv covid19/* .

# Clean up by removing the zip file and the unzipped directory
RUN rm -rf covid19.zip covid19

# Expose port 80
EXPOSE 80

# Start the Apache server
CMD ["httpd-foreground"]

