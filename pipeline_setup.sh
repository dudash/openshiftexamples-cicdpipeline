# Create pipeline demo projects
oc new-project pipeline-app-dev
oc new-project pipeline-app-test
oc new-project pipeline-app-prod

# Give Jenkins access to the pipeline demo projects
oc policy add-role-to-user edit system:serviceaccount:cicd:jenkins -n pipeline-app-dev
oc policy add-role-to-user edit system:serviceaccount:cicd:jenkins -n pipeline-app-test
oc policy add-role-to-user edit system:serviceaccount:cicd:jenkins -n pipeline-app-prod

# Switch to the dev project and create the app from a template
oc project pipeline-app-dev
oc new-app -f https://raw.githubusercontent.com/dudash/openshiftexamples-cicdpipeline/master/pipeline_instant_template.yaml
