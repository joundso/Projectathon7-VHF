FROM rocker/r-ver:4.2.0
ARG DUP_STAGE

LABEL Maintainer="Alexander Strübing <alexander.struebing@imise.uni-leipzig.de>"

WORKDIR /project

COPY utils/      ./utils
COPY version.txt ./

WORKDIR /project/${DUP_STAGE}

COPY ${DUP_STAGE}/ ./
RUN /bin/bash -e install-dependencies.sh

ENV OUTPUT_DIR_BASE="/mnt"

CMD ["Rscript", "./main.R"]
