FROM node:14

WORKDIR discovery-fhir-data

# TODO: lock version of http-server via a local yarn.lock or package-lock.json:
RUN npm install http-server -g

COPY . ./

# CMD ["cd ${FHIR_DIRECTORY} && ./run"]
# or:
# WORKDIR discovery-fhir-data/DSTU2
# CMD ["http-server", "data", "--log-ip", "-p", "9002"]
