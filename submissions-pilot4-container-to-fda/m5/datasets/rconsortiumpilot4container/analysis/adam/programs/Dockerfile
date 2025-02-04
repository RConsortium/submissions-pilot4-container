ARG R_VERSION=4.2.0
ARG IMAGE_REGISTRY=docker.io
ARG IMAGE_ORG=rocker

FROM $IMAGE_REGISTRY/$IMAGE_ORG/r-ver:$R_VERSION

LABEL org.opencontainers.image.licenses="GPL-3.0-or-later" \
      org.opencontainers.image.source="https://github.com/RConsortium/submissions-pilot4-container" \
      org.opencontainers.image.vendors="RConsortium, Appsilon" \
      org.opencontainers.image.authors="Eric Nantz <theRcast@gmail.com>, André Veríssimo <andre.verissimo@appsilon.com>, Vedha Viyash <vedha@appsilon.com>"

RUN apt-get update --quiet \
   && apt-get install \
     curl \
     libssl-dev \
     libcurl4-openssl-dev \
     libxml2-dev -y --quiet \
     libfontconfig1-dev \
     libharfbuzz-dev libfribidi-dev \
     libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev \
   && apt-get autoremove -y --quiet \
   && apt-get clean --quiet \
   && rm -rf /var/lib/apt/lists/*

RUN useradd -m shiny

USER shiny

ARG LOCAL_APP_DIR=./submissions-pilot2
ARG LOCAL_DATA_DIR=./datasets
ARG APP_DIR=/home/shiny/submissions-pilot2
ARG DATA_DIR=/home/shiny/submissions-pilot2/datasets

COPY $LOCAL_APP_DIR $APP_DIR
COPY $LOCAL_DATA_DIR $DATA_DIR

WORKDIR $APP_DIR

# Prevents RENV from mistakenly download from teal.* remotes (as the dependencies are
#  already defined in renv.lock).
RUN Rscript \
  -e "options(\"renv.config.install.remotes\" = FALSE)" \
  -e "renv::restore()"

ARG R_SCRIPT=./entrypoint.R

COPY $R_SCRIPT $APP_DIR/entrypoint.R

CMD ["Rscript", "entrypoint.R"]
