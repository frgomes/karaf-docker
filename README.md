Apache Karaf Docker image
=========================

BUILD
-----
docker build github.com/skliche/karaf-docker -t skliche/karaf-docker:1.0

Run
---

```bash
docker run -d -t --name karafserver -p 1099:1099 -p 8101:8101 -p 8181:8181 -p 44444:44444 -v /home/docker/deploy:/deploy skliche/karaf-docker:1.0
```
