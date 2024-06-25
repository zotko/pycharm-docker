FROM continuumio/anaconda3

# Copy the environment.yml file from the config directory into the container
COPY environment.yml .

# Update Conda and install Jupyter
RUN conda install jupyter -y --quiet && \
    conda env update -n base -f environment.yml

# Create a directory for the notebooks
RUN mkdir -p /opt/notebooks

# Set the working directory
WORKDIR /opt/notebooks

# Expose the port for Jupyter
EXPOSE 8888
