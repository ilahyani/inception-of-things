# WHOAMI - Real-time Chat Application

A real-time chat application built with React, Socket.IO, Express, and Redis, deployed on a Kubernetes cluster and automated with Ansible.

## Project Structure

```
.github/workflows/    # CI
app/
├── frontend/          # React frontend application
├── backend/           # Express backend server
k8s/                  # Kubernetes manifests
├── dev/              # Development environment configs
├── argocd/           # ArgoCD configuration
ansible/              # Automation scripts
```

## Architecture

The application consists of three main components:

- **Frontend**: React application with Socket.IO client
- **Backend**: Express server with Socket.IO for real-time communication
- **Database**: Redis for message persistence

## Features

- Real-time messaging
- Persistent chat history
- User avatars (Auto generated using DiceBear API)
- Active users list
- Responsive design
- Containerized deployment

## Deployment

```bash
ansible-playbook ansible/playbook.yaml
```

The playbook will:
- Set up K3d cluster
- Deploy the application components
- Configure ArgoCD
- Set up port forwarding

## Kubernetes Components

- Frontend Deployment and Service
- Backend Deployment and Service
- Redis Deployment, Service, and PersistentVolume
- ArgoCD Application

## CI/CD Pipeline

### Continuous Integration with GitHub Actions

This project uses two GitHub Actions workflows for the frontend and backend components:

#### Frontend CI
- Triggered on pushes to `main` branch when changes occur in `app/frontend/**`
- Steps:
  1. Checks out code
  2. Logs in to DockerHub
  3. Creates a tag using current timestamp
  4. Builds and pushes frontend Docker image
  5. Updates Kubernetes manifest with new image tag
  6. Commits and pushes the updated manifest

#### Backend CI ([.github/workflows/deploy-backend.yaml](/.github/workflows/deploy-backend.yaml))
- Triggered on pushes to `main` branch when changes occur in `app/backend/**`
- Steps:
  1. Checks out code
  2. Logs in to DockerHub
  3. Creates a tag using current timestamp
  4. Builds and pushes backend Docker image
  5. Updates Kubernetes manifest with new image tag
  6. Commits and pushes the updated manifest

### Continuous Deployment with ArgoCD

ArgoCD handles the continuous deployment by monitoring the Git repository:

#### ArgoCD Setup
- Deployed in `argocd` namespace
- Configured to watch the Git repository
- Automatically syncs changes from the `k8s/dev` directory
- Manages deployments for:
  - Frontend service
  - Backend service
  - Redis database

### How CI/CD Pipeline Works Together

1. **Code Changes**:
   - Developer pushes changes to `main` branch
   - Changes in frontend or backend directories trigger respective GitHub Actions

2. **CI Process (GitHub Actions)**:
   - Builds new Docker image
   - Pushes image to DockerHub
   - Updates K8s manifests with new image tag
   - Commits changes back to repository

3. **CD Process (ArgoCD)**:
   - Detects changes in K8s manifests
   - Automatically syncs cluster state with Git repository
   - Rolls out new deployments with updated images

