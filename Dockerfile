# Using official python runtime base image
FROM image-registry.openshift-image-registry.svc:5000/openshift/python:latest

# Install our requirements.txt
ADD requirements.txt /opt/app-root/src/requirements.txt
RUN pip install -r /opt/app-root/src/requirements.txt

# Copy our code from the current folder to /app inside the container
ADD . /opt/app-root/src

# Make port 80 available for links and/or publish
EXPOSE 8080

# Define our command to be run when launching the container
#CMD ["gunicorn", "app:app", "-b", "0.0.0.0:8080", "--log-file", "-", "--access-logfile", "-", "--workers", "4", "--keep-alive", "0"]
CMD ["python", "./app.py"]
