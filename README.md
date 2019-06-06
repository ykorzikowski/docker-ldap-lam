# docker-ldap-lam
docker image with lam


```

ldap-lam:
  image: 'ykorzikowski/ldap-lam:latest'
  ports:
    - '8032:8080'
  restart: always
  volumes:
    - /srv/docker/volumes/openldap_lam:/usr/share/ldap-account-manager/config
    - /etc/localtime:/etc/localtime
    - /etc/timezone:/etc/timezone

```

http://www.ldap-account-manager.org/

THX to https://github.com/osixia/docker-openldap
