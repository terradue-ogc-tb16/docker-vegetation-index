FROM terradue/c7-repo2cli:latest

RUN repo2cli -r https://github.com/terradue-ogc-tb16/vegetation-index.git

ENV PREFIX /opt/anaconda/envs/env_vegetation_index

ENV PATH /opt/anaconda/envs/env_vegetation_index/bin:$PATH
