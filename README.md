# Inception

Inception is a 42 project focused on learning Docker and Docker Compose. The objective is to create a small network of three Docker containers: one for Nginx, one for WordPress, and one for MariaDB. These containers must interact over the Docker network to serve a local website.


## Project Structure

The project is structured as follows:
- `srcs/`: Contains the Docker configurations and project files.
  - `nginx/`: Configuration files for the Nginx container.
  - `wordpress/`: Files related to the WordPress installation.
  - `mariadb/`: MariaDB configuration and initialization files.
  - `.env`: Environment variables file.

## Usage

To launch this project, follow these steps:

1. Clone this repository and navigate into it:
    ```sh
    git clone <repository_url>
    cd <repository_directory>
    ```

2. In the `srcs` folder, fill out the `ExampleEnvFile` and save it as `srcs/.env`.

3. Edit the `login` variable in the Makefile to reflect your 42 school login.

4. Build and launch the Docker containers using `make`:
    ```sh
    make
    ```

5. The website should be accessible at `https://localhost` or `http://<your_login>.42.fr` (replace `<your_login>` with the value in the Makefile).

## Project Notes

### Viewing Docker Images, Containers, Volumes, and Networks

- Show Docker images:
  ```sh
  docker images
  ```

- Show Docker containers:
  ```sh
  docker ps
  ```
  Add `-a` to view stopped/exited containers:
  ```sh
  docker ps -a
  ```

- Show Docker volumes:
  ```sh
  docker volume ls
  ```
  Inspect a volume:
  ```sh
  docker volume inspect <volume_name>
  ```

- Show Docker networks:
  ```sh
  docker network ls
  ```

### Useful Commands for Debugging Docker Containers

- Show logs:
  ```sh
  docker-compose logs
  ```
  Follow logs for a specific container:
  ```sh
  docker-compose logs --follow <container_name>
  ```

- Run a container in interactive mode:
  ```sh
  docker run -it <image_ID>
  ```

- Execute a command inside a running container:
  ```sh
  docker exec <container_name> <command>
  ```

- Execute an interactive command inside a running container:
  ```sh
  docker exec -it <container_name> <command>
  ```

- Open a shell inside a running container:
  ```sh
  docker exec -it <container_name> sh
  ```

### Dockerfile Basic Commands

- `FROM`: Sets the base image for the container. For example, Alpine:3.18.
- `RUN`: Executes commands during the build process, such as installing software.
- `COPY`: Copies files from the host to the container.
- `EXPOSE`: Exposes a port to the outside.
- `CMD ["command", "args"]`: Specifies the default command to run in the container. It can be overridden by providing a different command in the `docker run` command.
- `ENTRYPOINT ["command", "args"]`: Defines the command to run at container startup. Unlike `CMD`, this command cannot be overridden by `docker run`.

### Useful Resources

#### Docker
- [Docker Curriculum](https://docker-curriculum.com/)
- [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/)
- [How to Debug a Docker Compose Build](https://www.matthewsetter.com/basic-docker-compose-debugging/)

#### Alpine Linux
- [Alpine Linux](https://www.alpinelinux.org/)

#### Nginx
- [NGINX Configuration Beginner's Guide](https://nginx.org/en/docs/beginners_guide.html)
- [OpenSSL Man Page](https://www.openssl.org/docs/man1.0.2/man1/openssl-req.html)
- [Generate Self-Signed SSL Certificate with OpenSSL](https://stackoverflow.com/a/10176685)

#### MariaDB
- [How do I find the MySQL my.cnf location](https://stackoverflow.com/a/2485758)
- [How to Install and Configure Mariadb](https://www.rootusers.com/how-to-install-and-configure-mariadb/)
- [Configuring MariaDB with Option Files](https://mariadb.com/kb/en/configuring-mariadb-with-option-files/)
- [MariaDB Server System Variables](https://mariadb.com/kb/en/server-system-variables/)
- [Configuring MariaDB for Remote Client Access](https://mariadb.com/kb/en/configuring-mariadb-for-remote-client-access/)
- [How to Allow Remote Access to MariaDB in Ubuntu Linux](https://geekrewind.com/allow-remote-access-to-mariadb-database-server-on-ubuntu-18-04/)

#### WordPress
- [PHP](https://www.php.net/)
- [Installing WordPress with curl and WP-CLI](https://make.wordpress.org/cli/handbook/guides/installing/)
- [WP-CLI Commands](https://developer.wordpress.org/cli/commands/)
- [WP-CLI Overview](https://jparks.work/index.php?title=Wp-cli)

### Advanced Tips

#### Persistent Data
Ensure your data persists between container restarts by properly configuring Docker volumes. For instance, in the `docker-compose.yml` file:
```yaml
volumes:
  db_data:
    driver: local
  wordpress_data:
    driver: local
```

#### Security
- Use strong, unique passwords for your MariaDB and WordPress instances.
- Regularly update your Docker images to include the latest security patches.

#### Performance
- Use optimized images, such as Alpine, to reduce the container size.
- Leverage multi-stage builds in Dockerfiles to keep your images lean and performant.

