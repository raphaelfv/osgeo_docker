FROM python:2.7-onbuild
ENV PYTHONUNBUFFERED 1
RUN apt-get update &&\
    apt-get install -y binutils gdal-bin libgdal-dev locales libproj-dev
RUN mkdir /code
WORKDIR /code

# Ensure locales configured correctly
#RUN locale-gen en_US.UTF-8
#ENV LC_ALL='en_US.utf8'

# Set python aliases for python3
#RUN echo 'alias python=python3' >> ~/.bashrc
#RUN echo 'alias pip=pip3' >> ~/.bashrc

# Update C env vars so compiler can find gdal
#ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
#ENV C_INCLUDE_PATH=/usr/include/gdal

RUN wget http://download.osgeo.org/gdal/2.4.0/gdal-2.4.0.tar.gz
RUN tar -xzf gdal-2.4.0.tar.gz
RUN cd gdal-2.4.0; ./configure; make; make install


#COPY requirements.txt /code/
#RUN pip install -r requirements.txt
RUN pip install GDAL==2.1.0
COPY . /code/
