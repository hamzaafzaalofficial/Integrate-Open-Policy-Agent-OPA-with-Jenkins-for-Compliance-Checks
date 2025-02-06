# Integrate-Open-Policy-Agent-OPA-with-Jenkins-for-Compliance-Checks
---
### Objectives:
1. Integrate OPA with Jenkins to enforce compliance checks in the CI/CD pipeline.
2. Write Rego policies to define compliance rules.
3. Simulate compliance failures and verify how OPA handles these failures.
---
---
### Pre-Requisite Installations: 
1. Java for Jenkins
2. Jenkins server
3. Docker for running OPA container
---

---
## Setting up OPA as Docker Container on Jenkins:
```bash
docker run -d --name opa -p 8181:8181 openpolicyagent/opa:latest run --server --addr=0.0.0.0:8181
docker ps 
# verify OPA is accessible via web browser or curl
curl http://localhost:8181/v1/data
```
## Creating a Policy Directory and File: 
```bash
mkdir -p /opt/opa/policies
# creating a rego policy for app_compliance.rego
nano /opt/opa/policies/app_compliance.rego
# see the content of this file in the attached file in the repo
```
## Loading the policy into OPA
```bash
curl -X PUT   --header "Content-Type: text/plain"   --data-binary @/opt/opa/policies/app_compliance.rego   http://68.183.88.95:8181/v1/policies/app_compliance
```
## Integrate OPA with Jenkins Pipeline
```bash
#find the attach Jenkins Pipeline in the Repo
```
---

---
### Conclusion:
This guide demonstrates how to integrate OPA with Jenkins for enforcing compliance checks in a CI/CD pipeline. You learned how to set up OPA, write Rego policies, integrate those policies into a Jenkins pipeline, and simulate compliance failures to verify OPA's responses. This setup ensures that only compliant applications are built and deployed, enhancing the security and governance of your CI/CD process. 
