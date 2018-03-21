# Create pipeline demo projects
oc new-project pipeline-app
oc new-project pipeline-app-staging
oc new-project pipeline-app-prod

# Give Jenkins access to the pipeline demo projects
oc policy add-role-to-user edit system:serviceaccount:cicd:jenkins -n pipeline-app
oc policy add-role-to-user edit system:serviceaccount:cicd:jenkins -n pipeline-app-staging
oc policy add-role-to-user edit system:serviceaccount:cicd:jenkins -n pipeline-app-prod

# Switch to the dev project and create the pipeline build from a template
oc project pipeline-app
oc create -f https://raw.githubusercontent.com/dudash/openshiftexamples-cicdpipeline/master/pipeline_instant_template.yaml
# Give this project an edit role too, in case we didn't want to have an external jenkins in cicd
oc policy add-role-to-user edit -z jenkins -n pipeline-app-staging
oc policy add-role-to-user edit -z jenkins -n pipeline-app-prod