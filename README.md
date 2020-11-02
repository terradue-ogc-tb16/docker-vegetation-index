# docker-vegetation-index

Dockerfile for the https://github.com/terradue-ogc-tb16/vegetation-index

## Using this container

### Getting the help context

```console
docker run --rm -it terradue/nb-vegetation-index:latest vegetation-index --help
```

Will return:

```
usage: vegetation-index [-h] [--kernel KERNEL] [--output NB_TARGET] [--docker DOCKER] [--cwl] [--params] [--input_reference INPUT_REFERENCE] [--aoi AOI]

Vegetation index Vegetation index processor

optional arguments:
  -h, --help            show this help message and exit
  --kernel KERNEL       kernel for notebook execution
  --output NB_TARGET    output notebook
  --docker DOCKER       Sets the docker image for the CWL DockerRequirement
  --cwl                 Prints the CWL script and exits
  --params              Prints the default parameters and exits
  --input_reference INPUT_REFERENCE
                        EO product for vegetation index
  --aoi AOI             Area of interest in WKT     
```
  
### Getting the Common Workflow Language (CWL) script

```console
docker run --rm -it terradue/nb-vegetation-index:latest vegetation-index --cwl --docker terradue/nb-vegetation-index:latest
```
### Getting the Common Workflow Language (CWL) default parameters 

```console
docker run --rm -it terradue/nb-vegetation-index:latest vegetation-index --params
```

### Executing the CWL script

Get the CWL script:

```console
docker run --rm -it terradue/nb-vegetation-index:latest vegetation-index --cwl --docker terradue/nb-vegetation-index:latest > vegetation-index.cwl
```

Get the parameters:

```console
docker run --rm -it terradue/nb-vegetation-index:latest vegetation-index --params > vegetation-index.yml
```

Stage the Sentinel-2 pre-event and post-event acquisitions:

```console
cwltool stage-in.cwl stage-in-pre.yml
```

In the  vegetation-index.yml file, update the `path` for the pre-event acquisition:

```yaml
pre_event:
  class: Directory
  path: /workspace/ogc-tb16/wdir/5qoilug5
```
Then for the post-event acquisition:

```console
cwltool stage-in.cwl stage-in-post.yml
```

Update the path for the post-event acquisition:

```yaml
post_event:
  class: Directory
  path: /workspace/ogc-tb16/wdir/gclw8a9w
```

Execute the CWL script with `cwltool`:

```console
cwltool vegetation-index.cwl#vegetation-index vegetation-index.yml
```
