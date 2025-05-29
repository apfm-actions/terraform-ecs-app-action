FROM ghcr.io/apfm-actions/terraform-action-base:latest
WORKDIR /app
COPY *.tf /app/
