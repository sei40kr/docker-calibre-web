# docker-calibre-web

Docker image for [Calibre-Web](https://github.com/janeczku/calibre-web).

## Usage

```sh
docker run -d \
           -e 'CALIBRE_WEB_ADMIN_PASSWORD=admin123'
           --name calibre-web \
           -p 8083:8083 \
           --restart unless-stopped \
           -v /path/to/config:/config \
           -v /path/to/books:/books \
           calibre-web:<version>
```

## Environment Variables

| Variable                     | Default Value | Description        |
|------------------------------|---------------|--------------------|
| `CALIBRE_WEB_ADMIN_PASSWORD` | `admin123`    | The admin password |

## Building Locally

```sh
git clone https://github.com/sei40kr/docker-calibre-web.git
cd docker-calibre-web
docker build --build-arg 'version=<version>' --pull -t calibre-web:<version> .
```
