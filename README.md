# Nginx Dockerfile

The Dockerfile is used to produce a Docker Image for `Nginx` on `ARM64`.

# Nginx version

`1.8.0`

# How to build the Image

You need to git pull nginx-arm64.git, then execute the following command under the `nginx-arm64` folder to 
create the image `bobsense/nginx-arm64`,

```
$ git pull https://github.com/bobsense/nginx-arm64.git
$ cd nginx-arm64
$ docker build -t bobsense/nginx-arm64 .
```

# How to use this Image

## Run the image

The typical way to run the image as follows:

```
$ docker run -d -P --name nginx bobsense/nginx-arm64
```

You should make sure which port on host is assigned to 80 exposed on nginx container. Type as follows:

```
$ docker port nginx 80
```

Then you will get like `0.0.0.0:32772`, so `32772` is the one assigned to 80.

Then you can use the web service offered by the nginx container. Just type:

```
$ curl http://127.0.0.1:32772/index.html
```

Normally, you are supposed to see output like:
```
...
<title>Welcome to nginx!<title>
...
```

## Persist files in html and logs

In order to make data in html and logs become independent of the running container, you can do as follows:

```
$ mkdir -p /tmp/html
$ mkdir -p /tmp/logs
$ docker run -d -P --name nginx \
    -v /tmp/html:/usr/local/nginx/html \
    -v /tmp/logs:/usr/local/nginx/logs \
    bobsense/nginx-arm64
```

# Special Declare
You are welcomed to make suggestions. I will try my best to make better.
