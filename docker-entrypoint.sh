#!/bin/sh

docker_set_admin_password() {
  ./cps.py -s "admin:${CALIBRE_WEB_ADMIN_PASSWORD:-admin123}"
  unset CALIBRE_WEB_ADMIN_PASSWORD
}

main() {
  docker_set_admin_password
  exec "$@"
}

main "$@"
