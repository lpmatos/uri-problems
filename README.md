URI Solution
============

Just a **Repository** to resolve **URI** problems.

## Copyright (c)

Lucca Pessoa da Silva Matos (c) 2019

## Getting Started

To use this repository you need to make a **git clone**:

```bash
git clone --depth 1 https://github.com/lpmatos/uri-problems.git -b master
```

This will give access on your **local machine** to this project.

## Organization

* **/solutions** is the directory where the **solutions** by language are located.
* **README.md** is an optional file. A human-readable **README** file.
* The files found in the project root are support files to **CI/CD** process and others contexts.

## Description

This repository brings together solutions for the **URI** Online Judge exercises done in several languages, such as:

* **Python**.
* **Ruby**.
* **Go**.

## How to contribute

1. Make a **Fork**.

2. Name the file with the question ID.

3. Add the file to the appropriate level folder - If the folder does not exist, create according to the standard

4. Make the **Commit**.

5. Open a **Pull Request**.

6. Wait for your pull request to be accepted.. 🚀

Remember: There is no bad code, there are different views/versions of solving the same problem. 😊

## Docker

### Build

To **Build** the image:

```
docker image build -t <IMAGE_NAME> -f <PATH_DOCKERFILE> <PATH_CONTEXT_DOCKERFILE>
```

or

```
docker image build -t <IMAGE_NAME> . (This context)
```

Explain:

* **IMAGE_NAME**:
    * Image **Name/Tag**.
* **PATH_DOCKERFILE**:
    * **Dockerfile** location.
    * Where is the full path to **Dockerfile** located?
* **PATH_CONTEXT_DOCKERFILE**:
    * **Dockerfile** context.
    * Where is the **Dockerfile**?

#### Run the Container with the image

* Running the **Container** in **Detached mode**/**Background**:

```
docker container run -d -p <LOCAL_PORT:CONTAINER_PORT> <IMAGE_NAME>
```

* Running the **Container** in **Interactive mode**:

```
docker container run -it --rm --name <CONTAINER_NAME> -p <LOCAL_PORT:CONTAINER_PORT> <IMAGE_NAME>
```

### Basic Commands

* Windows

```
winpty docker.exe run -it --rm <IMAGE_NAME> <COMMAND>
```

* Showing all local images:

```
docker images
```

or

```
docker image ls
```

* Showing all Active or Inactive **Containers**:

```
docker ps -a
```

* Showing all Active **Containers**:

```
docker ps
```

* Entering an Active **Container**:

```
docker exec -it <CONTAINER_ID> <COMMAND>
```
