FROM apfm/terraform-action-base
WORKDIR /app
COPY *.tf /app/
ADD modules /app/modules/
