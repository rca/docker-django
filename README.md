Sample Docker Image for Django
------------------------------

Run like so:

```
docker run -e MEMCACHED_URL=foo -e BROKER_URL=foo -e POSTGRESQL_URL=foo djapp /bin/bash -c 'cd /app && python manage.py test'
```
