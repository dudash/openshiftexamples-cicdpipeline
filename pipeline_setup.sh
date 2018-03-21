# Create pipeline demo projects
oc new-project pipeline-app
oc new-project pipeline-app-staging
oc new-project pipeline-app-prod

# Switch to the dev project and create the pipeline build from a template
oc project pipeline-app
oc create -f https://raw.githubusercontent.com/dudash/openshiftexamples-cicdpipeline/master/pipeline_instant_template.yaml
# Give this project an edit role on other related projects,
# in case we didn't want to have an external jenkins server
oc policy add-role-to-user edit -z jenkins -n pipeline-app-staging
oc policy add-role-to-user edit -z jenkins -n pipeline-app-prod
# Give the other 2 projects the role to pull images from the dev project
oc policy add-role-to-group system:image-puller system:serviceaccounts:pipeline-app -n pipeline-app-staging
oc policy add-role-to-group system:image-puller system:serviceaccounts:pipeline-app -n pipeline-app-prod