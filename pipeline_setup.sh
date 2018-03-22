# Create pipeline demo projects
oc new-project pipeline-app --display-name="Pipeline Example - Build"
oc new-project pipeline-app-staging --display-name="Pipeline Example - Staging"
oc new-project pipeline-app-prod --display-name="Pipeline Example - Production"

# Switch to the dev project and create the pipeline build from a template
oc project pipeline-app
oc create -f https://raw.githubusercontent.com/dudash/openshiftexamples-cicdpipeline/master/pipeline_instant_template_external.yaml

# Give this project an edit role on other related projects
oc policy add-role-to-user edit -z jenkins -n pipeline-app-staging
oc policy add-role-to-user edit -z jenkins -n pipeline-app-prod

# Give the other related projects the role to pull images from other projects
oc policy add-role-to-group system:image-puller system:serviceaccounts:pipeline-app -n pipeline-app-staging
oc policy add-role-to-group system:image-puller system:serviceaccounts:pipeline-app-staging -n pipeline-app-prod