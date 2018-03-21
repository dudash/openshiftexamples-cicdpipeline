# Create project and create Jenkins server
oc new-project cicd --display-name="CI/CD"
oc new-app jenkins-ephemeral
oc adm policy add-cluster-role-to-user edit system:serviceaccount:cicd:jenkins
