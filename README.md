# docker-cover-sender

## Использование

Пример gitlab-ci:

```yaml
generate_coverage:
  stage: coverage
  image: devalv/cover-sender:0.1.5

  tags:
    - docker

  script:
    - coverage

  only:
    - main
```

### Сборка

```bash
make image-build
```

>- devalv/cover-sender:0.1.5

### Публикация

```bash
make image-push
```

### Сборка и публикация

```
make image-publish
```
