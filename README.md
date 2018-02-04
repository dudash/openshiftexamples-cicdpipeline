# OpenShift Examples - CI/CD Pipeline
OpenShift can ... This git repo contains an intentionally simple example of ...

Here's what it looks like:

![Screenshot](./.screens/ocppipeline.gif)

###### :information_source: This example is based on OpenShift Container Platform version 3.7.  It could work with older versions but has not been tested.


## How to run this?
First off, you need access to an OpenShift cluster.  Don't have an OpenShift cluster?  That's OK, download the CDK for free here: [https://developers.redhat.com/products/cdk/overview/][1]

There is a template for creating all the components of this example. Use the oc CLI tool:
 > `oc new-project pipelinedemo `

 > `oc new-app -f https://raw.githubusercontent.com/dudash/openshiftexamples-cicdpipeline/master/pipeline_instant_template.yaml`

*If you don't like the CLI, another option is to create and project and import the template via the web console:*
 > Create a new project, select `Import YAML/JSON` and then upload the raw file from this repo: `pipeline_instant_template.yaml`.

## Why pipelines?
TBD...

## How does this work and how can I configure it?
TBD.


## About the code / software architecture
The parts in action here are:
* X
* Y
* Z
* Instant app template YAML file (to create/configure everything easily)
* Key platform components that enable this example
	* TBD


## License
Under the terms of the MIT.

[1]: https://developers.redhat.com/products/cdk/overview/
