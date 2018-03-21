# Create project and create Jenkins server
oc new-project cicd --display-name="CI/CD"
oc new-app jenkins-ephemeral
