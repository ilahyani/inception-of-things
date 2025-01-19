## Overview

This project automates the deployment of a GitLab instance, a simple application, and ArgoCD on a K3s cluster (lightweight Kubernetes distribution) using K3d (lightweight wrapper to run k3s on Docker) and Ansible for configuration. The project structure includes configuration files and Ansible tasks to set up and manage the deployments.

## Project Structure

```
ansible/
	application/
		tasks/
			main.yaml
	argocd/
		tasks/
			main.yaml
	gitlab/
		tasks/
			main.yaml
	playbook.yaml
	setup/
		tasks/
			main.yaml
argocd.yaml
dev/
	app.yaml
gitlab.yaml
```

### Key Files and Directories

- **ansible/**: Contains Ansible roles and tasks for deploying GitLab, the application, and ArgoCD.
  - **application/tasks/main.yaml**: Tasks for deploying the application.
  - **argocd/tasks/main.yaml**: Tasks for deploying ArgoCD.
  - **gitlab/tasks/main.yaml**: Tasks for deploying GitLab.
  - **playbook.yaml**: Main Ansible playbook that includes all roles.
- **argocd.yaml**: ArgoCD application configuration file.
- **dev/app.yaml**: Kubernetes manifest for the application.
- **gitlab.yaml**: Kubernetes manifest for GitLab.

## Prerequisites

- Ansible
- Kubernetes cluster
- kubectl configured to interact with your Kubernetes cluster

## Setup

1. **Clone the repository**:
   ```sh
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Install Ansible**:
   ```sh
   sudo apt update
   sudo apt install ansible
   ```

3. **Ensure kubectl is configured**:
   ```sh
   kubectl config view
   ```

## Deployment

1. **Run the Ansible playbook**:
   ```sh
   ansible-playbook ansible/playbook.yaml
   ```

### Ansible Roles

- **setup**: Prepares the environment for deployment.
- **gitlab**: Deploys GitLab and waits for it to be ready.
- **application**: Deploys the application and waits for it to be ready.
- **argocd**: Deploys ArgoCD and waits for it to be ready.

### Detailed Task Descriptions

#### GitLab Deployment

- **Deploy GitLab**: Applies the GitLab manifest.
- **Wait For GitLab Pod To Run**: Waits for the GitLab pod to be ready.
- **Wait For GitLab Container To Be Ready**: Ensures the GitLab container is ready.
- **Save GitLab Root Password**: Placeholder for saving the GitLab root password.

#### Application Deployment

- **Deploy Application**: Applies the application manifest.
- **Wait For Application Pod To Run**: Waits for the application pod to be ready.

#### ArgoCD Deployment

- **Add GitLab Host to ArgoCD Source Repo**: Updates the ArgoCD source repo URL with the GitLab host.
- **Deploy ArgoCD**: Applies the ArgoCD installation manifest and the ArgoCD application configuration.
- **Wait For ArgoCD Server Pod To Run**: Waits for the ArgoCD server pod to be ready.
- **Save ArgoCD Password**: Placeholder for saving the ArgoCD password.

## Configuration

### ArgoCD Configuration

The ArgoCD application configuration is defined in [`argocd.yaml`](command:_github.copilot.openRelativePath?%5B%7B%22scheme%22%3A%22file%22%2C%22authority%22%3A%22%22%2C%22path%22%3A%22%2FUsers%2Filahyani%2Fworkspace%2Finception-of-things%2Fargocd.yaml%22%2C%22query%22%3A%22%22%2C%22fragment%22%3A%22%22%7D%5D "/Users/ilahyani/workspace/inception-of-things/argocd.yaml"). It specifies the source repository, target revision, and destination namespace for the application.

### Application Configuration

The application Kubernetes manifest is defined in [`dev/app.yaml`](command:_github.copilot.openRelativePath?%5B%7B%22scheme%22%3A%22file%22%2C%22authority%22%3A%22%22%2C%22path%22%3A%22%2FUsers%2Filahyani%2Fworkspace%2Finception-of-things%2Fdev%2Fapp.yaml%22%2C%22query%22%3A%22%22%2C%22fragment%22%3A%22%22%7D%5D "/Users/ilahyani/workspace/inception-of-things/dev/app.yaml").

### GitLab Configuration

The GitLab Kubernetes manifest is defined in [`gitlab.yaml`](command:_github.copilot.openRelativePath?%5B%7B%22scheme%22%3A%22file%22%2C%22authority%22%3A%22%22%2C%22path%22%3A%22%2FUsers%2Filahyani%2Fworkspace%2Finception-of-things%2Fgitlab.yaml%22%2C%22query%22%3A%22%22%2C%22fragment%22%3A%22%22%7D%5D "/Users/ilahyani/workspace/inception-of-things/gitlab.yaml").
