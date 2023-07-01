# Docker

# Introduction

Docker is a containerization platform that facilitates the packaging, distribution, and execution of applications. It utilizes operating system-level virtualization technology to isolate and encapsulate applications along with their dependencies into containers.

Docker containers provide a consistent and isolated environment where an application can run regardless of the underlying operating system and infrastructure. This means that you can create a Docker container in a development environment and run it in any other Docker-compatible hosting environment, such as local machines, bare-metal servers, cloud-based VMs, or managed container clusters.

The primary purpose of Docker is to enable developers to build, package, and distribute applications along with all their dependencies in a consistent manner. With Docker, you can create images that include the application code, libraries, frameworks, system dependencies, configuration files, and any other elements required for the application to function. These images can be shared in public or private registries, allowing other developers to quickly and reliably deploy and run the applications.

Additionally, Docker also provides benefits in terms of efficiency, scalability, and resource management. Since containers share the host operating system's kernel, they are lightweight compared to traditional virtualization of virtual machines, resulting in fast startup times and lower resource overhead. Moreover, Docker provides tools for orchestrating and managing containers in production environments, enabling horizontal scalability, load balancing, distributed application deployment, and fault tolerance.

# Basics

## 1. Images
In the context of containerization, an image is a lightweight, standalone, and executable software package that includes everything needed to run a piece of software, including the code, runtime environment, libraries, dependencies, and configuration files. Images are the building blocks for creating and running containers.

Characteristics of container images:

    Self-contained: An image is a self-contained unit that includes all the necessary components required to run an application. It encapsulates the application's code, along with its dependencies, runtime, system libraries, and other files.

    Immutable: Images are typically created as read-only, meaning they cannot be modified once built. This immutability ensures consistency and reproducibility, as the image remains unchanged throughout its lifecycle.

    Layered Structure: Images are often built in layers. Each layer represents a specific instruction or change made to the image during its construction. This layered approach allows for efficient storage and distribution, as layers that have not changed can be reused across multiple images.

    Versioned: Images can be versioned, allowing for different versions of an application or its dependencies to be stored and managed. This versioning enables easy rollback or deployment of specific image versions.

    Registry: Images are stored in a registry, which is a centralized repository for managing and distributing container images. Docker Hub is a popular public registry, but private registries can also be used for internal storage and sharing of images.

    Platform-independent: Container images are designed to be platform-independent. They can be created on one system and run on any other system that supports the container runtime, such as Docker or container orchestration platforms like Kubernetes.

To create an image, a Dockerfile is typically used. A Dockerfile is a text file that contains a set of instructions for building the image, including the base image, environment variables, package installations, and any custom configurations.

Images serve as a template or blueprint for creating containers. When a container is launched from an image, it becomes a running instance of that image with its own isolated environment, but shares the underlying operating system kernel with the host and other containers.

By using images, developers can package their applications and their dependencies consistently and distribute them easily, ensuring that the application runs consistently across different environments and platforms.

## 2. DockerFile
A Dockerfile is a text file that contains a set of instructions used to build a Docker image. It is a script-like configuration file that specifies the steps to follow in order to create an image that encapsulates an application and its dependencies.

Elements and concepts related to Dockerfiles:

    Base Image: The Dockerfile starts with specifying a base image, which serves as the foundation for the new image you are building. The base image can be an official image from the Docker Hub or a custom image built on top of another base image.

    Instructions: Dockerfiles consist of a series of instructions that are executed in sequential order during the image build process. These instructions can include actions such as copying files into the image, installing packages, setting environment variables, exposing ports, and running commands.

    Layered Approach: Docker images are built using a layered approach, where each instruction in the Dockerfile adds a new layer on top of the previous layers. Layers are cached, which allows for efficient image building. If an instruction doesn't change, Docker can reuse the cached layer instead of rebuilding it.

    Context: The context is the directory or file path provided to the Docker build command. The Docker build process uses this context to locate the files referenced in the Dockerfile and copy them into the image. By default, the context directory and all its subdirectories are sent to the Docker daemon during the build process.

    Environment Variables: Dockerfiles can define environment variables that can be used during the build process or when running containers based on the image. Environment variables can be set using the ENV instruction in the Dockerfile.

    Docker Build: To build an image from a Dockerfile, you use the docker build command, providing the path to the directory containing the Dockerfile and the desired image name and tag. The Docker daemon reads the instructions from the Dockerfile, executes them in order, and generates the final image.

Dockerfiles provide a declarative and reproducible way to define the configuration of Docker images. They allow developers to automate the process of creating consistent and reliable images that can be easily shared and deployed across different environments.

**Example**
``` docker
# Specify the base image
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the application dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose a port (optional)
EXPOSE 3000

# Define the command to run the application
CMD [ "node", "app.js" ]
```

**Basic Commands**
A Dockerfile consists of several instructions that define the steps to build a Docker image. Here are some of the basic commands commonly used in a Dockerfile:

| Command  |    |
| ------------- | ------------- |
| FROM          | Specifies the base image to use for building the new image. |
| WORKDIR  | Sets the working directory inside the container where subsequent instructions will be executed.  |
|COPY           |Copies files or directories from the host machine to the container's filesystem. It has two arguments: the source path on the host and the destination path inside the container.
|    RUN           |Executes a command in the container during the build process. It can be used for tasks like installing dependencies, compiling code, or setting up the environment. Multiple RUN instructions can be used to perform multiple commands.
| ENV              |Sets environment variables inside the container. It allows you to define variables that can be accessed by processes running in the container.
| EXPOSE          |   Documents the ports on which the container listens for connections. It informs the user which ports should be published when running a container based on the image.
|   CMD            |Defines the default command to be executed when a container is run from the image. It is typically used to start the main process of the application. Only one CMD instruction can be present in a Dockerfile, and if multiple CMD instructions are provided, only the last one will take effect.


## 3. CONTAINERS
Containers are lightweight and isolated runtime environments that allow you to run applications and their dependencies in a consistent and portable manner. A container provides an encapsulated environment where an application can run without interfering with other applications or the underlying host system.

Here are some key characteristics of containers:

    Isolation: Containers use operating system-level virtualization to provide process-level isolation. Each container runs as a separate entity with its own filesystem, libraries, and network stack, ensuring that applications inside the containers are isolated from one another and from the host system.

    Portability: Containers are designed to be portable across different computing environments. Once created, a container can be deployed and run on any system that supports containerization, regardless of the underlying infrastructure or operating system.

    Lightweight: Containers are lightweight because they share the host system's kernel. Unlike traditional virtual machines, containers do not require a separate guest operating system, resulting in faster startup times, lower memory usage, and reduced resource overhead.

    Reproducibility: Containers are created from images, which are pre-packaged and self-contained units that include the application code, dependencies, and runtime environment. Images are versioned and can be easily shared, ensuring that the same container can be replicated across different environments.

    Scalability: Containers enable easy scaling of applications. Multiple instances of a container can be run simultaneously to handle increased workload or traffic. Container orchestration platforms like Docker Swarm or Kubernetes can automatically manage the distribution and scaling of containers across a cluster of machines.

    Flexibility: Containers are versatile and can encapsulate different types of applications, from simple command-line tools to complex microservices architectures. They provide a consistent and predictable runtime environment, allowing applications to run reliably across different systems.


### Containers vs Virtual machine

* Architecture: 

Virtual machines emulate a complete infrastructure, including hardware, operating system, and virtualization resources. Each virtual machine has its own operating system and is isolated from other virtual machines. On the other hand, containers share the host system's kernel and isolate only the necessary processes and resources for running the application. This results in lower resource overhead and faster startup times for containers.

* Isolation:

Virtual machines provide a high level of isolation since each virtual machine has its own operating system, making them more secure and suitable for environments with strict isolation requirements. Containers also provide isolation, but at the process level, sharing the same host system's kernel. This may be sufficient for most use cases but may not be as robust as the isolation provided by a virtual machine.

* Resource Utilization: 

Virtual machines have higher resource overhead because each virtual machine needs to run a complete operating system. This can result in less efficient usage of resources such as CPU, memory, and storage. Containers, by sharing the host system's kernel, are lighter in terms of resource usage and have more efficient resource utilization.

* Startup Time: 

Virtual machines generally take longer to start as they require booting up a complete operating system. Containers are faster to start as they do not need to boot up a complete operating system, only the necessary processes to run the application.

* Portability: 

Virtual machines are portable and can be run on any compatible virtualization environment. However, they may be more complex to migrate due to operating system dependencies. Containers are highly portable as they can run on any compatible container environment, as long as the host supports the containerization mechanism being used, such as Docker. Containers are independent of the host operating system.

In summary, virtual machines provide a high level of isolation and are suitable for environments with strict security and isolation requirements. Containers are lighter, faster to start, have more efficient resource usage, and are highly portable, making them ideal for agile application development and deployment. The choice between containers and virtual machines depends on the specific requirements of the environment and the needs of the application.

<br/>

![My Remote Image](https://images.contentstack.io/v3/assets/blt300387d93dabf50e/bltb6200bc085503718/5e1f209a63d1b6503160c6d5/containers-vs-virtual-machines.jpg)

<br/>

# Data Persistence

Data persistence refers to the ability to store and maintain data in a durable manner, even after the termination or reboot of an application or system. It is the capability to preserve data for future use, allowing it to be retrieved and accessed later.

| Term                  | Description                              
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Docker Volumes        | Docker Volumes are a feature provided by Docker that allow you to create and manage persistent storage for containers. Volumes provide an independent and durable storage location that can be shared among multiple containers. They are managed by Docker and stored within the Docker host's file system or a remote storage system. Volumes can be attached to containers during their creation, providing a reliable and portable way to store and access data that persists beyond the lifespan of a container. Docker Volumes have features like data sharing between containers, data backup and restoration, and support for plugins to integrate with external storage systems. |
| Bind Mounts           | Bind mounts in Docker allow you to mount a file or directory from the host system into a container. By using bind mounts, you can directly access files or directories on the host's file system within the container. Any changes made to the files or directories in the bind mount are immediately visible both inside the container and on the host. Bind mounts provide a straightforward way to achieve data persistence by linking specific directories or files between the host and the container. They are useful when you want to access or modify files on the host system from within a container. |
| Docker tmpfs mounts   | Docker tmpfs mounts enable you to mount a temporary file system into a container's file system. A tmpfs mount is stored in memory and is not persisted on disk, meaning its contents are lost when the container is stopped or restarted. Tmpfs mounts are useful when you need a temporary, lightweight, and fast storage solution within a container, but where data persistence is not required or desired. They are commonly used for storing temporary files, caches, or other ephemeral data that doesn't need to persist between container runs.                                               |
| Ephemeral FS          | Ephemeral File System (Ephemeral FS) refers to a temporary or non-persistent file system that exists only for the duration of a process or session. It is typically used to store transient or disposable data that is not intended to persist beyond the current execution context. Ephemeral file systems are often created in memory or temporary storage space and are automatically cleared or deleted when the process or session ends. In the context of containers, ephemeral file systems can be used for temporary storage or caches, and they don't provide data persistence between container runs.                 |