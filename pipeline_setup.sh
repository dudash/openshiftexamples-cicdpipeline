# Create pipeline demo projects in thie cluster
oc new-project cicd --display-name="CI/CD"
oc new-project pipeline-app --display-name="Pipeline Example - Build"
oc new-project pipeline-app-staging --display-name="Pipeline Example - Staging"

# Switch to the cicd and create the pipeline build from a template
oc project cicd
oc create -f ./pipeline_instant_embeded.yaml
#oc create -f ./pipeline_instant_external.yaml # note: this will pull from github off the master branch

# Give this project an edit role on other related projects
oc policy add-role-to-user edit system:serviceaccount:cicd:jenkins -n pipeline-app
oc policy add-role-to-user edit system:serviceaccount:cicd:jenkins -n pipeline-app-staging

# Give the other related projects the role to pull images from pipeline-app
oc policy add-role-to-group system:image-puller system:serviceaccounts:pipeline-app-staging -n pipeline-app

# Wait for Jenkins to start
oc project cicd
echo "Waiting for Jenkins pod to start.  You can safely exit this with Ctrl+C or just wait."
until 
	oc get pods -l name=jenkins | grep -m 1 "Running"
do
	oc get pods -l name=jenkins
	sleep 2
done
echo "Yay, Jenkins is ready."
echo "But we need to do one more thing because of a current limitation."
echo "From the CI/CD project - open the Jenkins webconsole, Manage Jenkins->Configure System->OpenShift Jenkins Sync->Namespace and add 'pipeline-app pipeline-app-staging' to the list"
echo ""
echo "Then you can start your pipeline with:"
echo "> oc start-build -F openshiftexamples-cicdpipeline"