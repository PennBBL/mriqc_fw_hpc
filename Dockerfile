#pennbbl/mriqc_fw_hpc

############################
# Get the MRIQC algorithm from DockerHub
FROM poldracklab/mriqc:0.15.1
MAINTAINER Ellyn Butler <ellyn.butler@pennmedicine.upenn.edu>
ENV MRIQC_VERSION 0.15.1

############################
# Install jq to parse the JSON config file
RUN apt-get update && apt-get -y install jq zip

# Install patched version of xvfbwrapper
RUN pip install -q https://github.com/ehlertjd/xvfbwrapper/releases/download/0.2.9.post1/xvfbwrapper-0.2.9.post1-py2.py3-none-any.whl

# Install the Flywheel save_intermediate_work
RUN pip install 'flywheel-sdk==6.0.6'
RUN pip install heudiconv

############################
# Make directory for flywheel spec (v0)
ENV FLYWHEEL /flywheel/v0
RUN mkdir -p ${FLYWHEEL}
COPY run ${FLYWHEEL}/run
COPY manifest.json ${FLYWHEEL}/manifest.json

# ENV preservation for Flywheel Engine
RUN env -u HOSTNAME -u PWD | \
  awk -F = '{ print "export " $1 "=\"" $2 "\"" }' > ${FLYWHEEL}/docker-env.sh

RUN echo "export XVFB_WRAPPER_SOFT_FILE_LOCK=1" >> ${FLYWHEEL}/docker-env.sh

# Set the entrypoint
ENTRYPOINT ["/flywheel/v0/run"]

# Add the fmriprep dockerfile to the container
ADD https://raw.githubusercontent.com/poldracklab/mriqc/${MRIQC_VERSION}/Dockerfile ${FLYWHEEL}/mriqc_${MRIQC_VERSION}_Dockerfile

############################
# Copy over python scripts that generate the BIDS hierarchy
COPY create_archive_fw_heudiconv.py /flywheel/v0/create_archive_fw_heudiconv.py
COPY move_to_project.py /flywheel/v0/move_to_project.py
RUN chmod +x ${FLYWHEEL}/*

RUN pip install fw-heudiconv -U


############################
# ENV preservation for Flywheel Engine
RUN env -u HOSTNAME -u PWD | \
  awk -F = '{ print "export " $1 "=\"" $2 "\"" }' > ${FLYWHEEL}/docker-env.sh

WORKDIR /flywheel/v0
