# OpenShift Examples - CI/CD Pipeline
OpenShift can be a useful aide in creating a Continuous Integration (CI) / Continuous Delivery (CD) pipeline.  CI/CD is all about creating a streamlined process to move from a developer's code change to delivered operations-ready software (i.e. ready to deploy to production).  And a key part of CI/CD is the automation to make the process predicatable, repeatable, and easy.

This git repo contains an intentionally simple example of a software pipeline.  It allows you ....

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
The most obvious benefits of CI/CD pipelines are:
* Deliver software more efficiently and rapidly
* Free up developer's time from manual build/release processes
* Standardize a process that requires testing before release
* Track the efficiency of releases and gain insight into (and control over) each step


## How does this work and how can I configure it?
The Jenkins integration can come in different flavors. See below for some disucssion on each.
* where does Jenkins live: in your project, in a global project, external to OpenShift
	* openshift can autoprovision Jenkins
	* you can pre-setup Jenkins to be shared by multiple projects
	* if you've already got CI/CD setup via Jenkins and you just want to hook this demo up into that, you can!
* how does the pipeline move images?
* will you use slave builders?
* where is the Jenkins file: in git, in the OpenShift template
* what OpenShift integration hooks will you use?
* does production have a separate cluster?
* do you want to roll your own Jenkins image?
	* the ones that come with OpenShift are tested to work, some things to be aware of if you roll your own are: X, Y, Z

## About the code / software architecture
The parts in action here are:
* A sample Node.js app
* Jenkins [server image](https://github.com/openshift/jenkins#installation)
	* [OpenShift client plugin](https://github.com/openshift/jenkins-client-plugin) (newer OpenShift installs)
	* [OpenShift Jenkins plugin](https://github.com/openshift/jenkins-plugin) (older OpenShift installs)
* Jenkins [slave images](https://access.redhat.com/containers/#/search/jenkins%2520slave)
* Instant app template YAML file (to create/configure everything easily)
* Key platform components that enable this example
	* Projects and Role Based Access Control (RBAC)
	* Integration with Jenkins
	* Source code building via s2i
	* Container building via BuildConfigs


## References and other links to check out
* https://docs.openshift.com/container-platform/3.7/using_images/other_images/jenkins.html
* https://docs.openshift.com/container-platform/3.7/dev_guide/dev_tutorials/openshift_pipeline.html
* https://docs.openshift.com/container-platform/3.7/install_config/configuring_pipeline_execution.html
* https://blog.openshift.com/using-openshift-pipeline-plugin-external-jenkins/
* https://blog.openshift.com/cross-cluster-image-promotion-techniques/
* https://blog.openshift.com/openshift-pipelines-jenkins-blue-ocean/
* https://github.com/OpenShiftDemos/openshift-cd-demo


## License
Under the terms of the MIT.

[1]: https://developers.redhat.com/products/cdk/overview/
