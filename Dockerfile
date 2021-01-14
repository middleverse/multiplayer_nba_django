# Dockerfile

# Pull base image
FROM python:3.7

# Set environment variables
ENV PYTHONUNBUFFERED 1
ENV DJANGO_ENV dev
ENV DOCKER_CONTAINER 1

# Set work directory
WORKDIR /code

# Install dependencies
# RUN pip install pipenv
COPY ./requirements.txt /code/requirements.txt
RUN pip install -r /code/requirements.txt

# Copy project
COPY . /code

#FROM postgres
#ENV POSTGRES_PASSWORD password
#ENV POSTGRES_DB postgres
#copy pg_data/dump.sql /docker-entrypoint-initdb.d/

EXPOSE 8000
