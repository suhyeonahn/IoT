# IoT

Install Mirantis cri-dockerd as Docker Engine shim for Kubernetes :
https://computingforgeeks.com/install-mirantis-cri-dockerd-as-docker-engine-shim-for-kubernetes/

- IoT (Internet of Things) :
    It refers to the network of physical objects or "things" that are embedded with sensors, software, and other technologies to collect and exchange data over the internet. These objects can include a wide range of devices, from everyday items like household appliances and wearable devices to industrial equipment and vehicles.
  The concept of IoT revolves around the idea of connecting these objects to the internet and each other, allowing them to communicate, share information, and perform various tasks without direct human intervention. IoT devices can gather data from their surroundings, process that data, and make intelligent decisions or trigger actions based on the data they receive. This can lead to increased efficiency, automation, and improved experiences in various domains.

- Ingress Controller :
    It provides a way to define rules for routing incoming traffic to different services based on the incoming request's hostname or path. In other words, an Ingress acts as a traffic controller, directing incoming requests to the appropriate service.
    The Ingress controller is responsible for interpreting the Ingress rules and configuring the necessary routing mechanisms, such as load balancers or reverse proxies, to ensure that external traffic reaches the correct services within the cluster.
    This enables you to expose your services to the outside world and control how different URLs or domains are mapped to different services within the cluster.

- k3s vs k3d :
    k3s and k3d are both lightweight alternatives to standard Kubernetes deployments, but they serve slightly different purposes and are intended for different use cases.
    K3s is a lightweight Kubernetes distribution optimized for resource-constrained environments, edge computing, and production scenarios where operational simplicity and minimal resource usage are priorities.
    k3d is a tool for quickly creating lightweight Kubernetes clusters using Docker containers. It's primarily designed for development and testing, allowing you to easily create isolated Kubernetes environments on your local machine.

- algo CD :
    Argo CD is an open-source declarative GitOps continuous delivery tool designed to automate the deployment of applications to Kubernetes clusters. GitOps is a methodology that utilizes Git repositories as the single source of truth for defining and managing the desired state of applications and infrastructure.
    Argo CD works by synchronizing the actual state of the target Kubernetes cluster with the desired state specified in a Git repository. This desired state is defined using Kubernetes manifests, which are YAML or JSON files describing the configuration of applications, services, and other resources within the cluster.
