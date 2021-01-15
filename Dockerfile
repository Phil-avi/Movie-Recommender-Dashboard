FROM continuumio/miniconda3

# Grab requirements.txt.
# ADD ./requirements.txt /tmp/requirements.txt

# Install dependencies
# RUN pip install -qr /tmp/requirements.txt

# Add our code
ADD ./notebooks /opt/notebooks/
WORKDIR /opt/notebooks

RUN conda install pandas
RUN conda install -c anaconda numpy scikit-learn
RUN conda install -c plotly plotly
RUN conda install -c conda-forge voila matplotlib voila ipyvuetify scikit-surprise ipympl 

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

CMD voila --port=$PORT --no-browser --enable_nbextensions=True --MappingKernelManager.cull_interval=60 --MappingKernelManager.cull_idle_timeout=60 movie_app.ipynb

