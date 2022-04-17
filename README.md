# MoinMoin Wiki

Moin is installed in `/opt/moin` directory and uwsgi in `/opt/uwsgi`.

The wiki instance is running from `/opt/wiki` and is exposed as a docker volume.

```
docker run --rm -it -p 1717:1717 -p 3031:3031 -p 9090:9090 -v $(pwd)/wiki:/opt/wiki moin
```

## Stats

Stats from uwsgi can be retrieved with a http call to port 1717:

```
curl http://localhost:1717/
```
