# dockerize next 13 app (typescript) for dev and staging environment

- Run for dev environment
```
docker compose -f docker-compose.dev.yml up -d
```

- Run for staging environment
```
docker compose -f docker-compose.staging.yml up -d
```



---

- few issues i was facing
  - env var not loading: [env file should be specify at build time]