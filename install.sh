#!/bin/sh

work() {
    wget -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
    sed -i -e 's@http://archive.ubuntu.com@http://tw.archive.ubuntu.com@' /etc/apt/sources.list

    cat > /etc/apt/sources.list.d/pgdg.list <<EOF
deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main
EOF

    apt-get update

    DEBIAN_FRONTEND=noninteractive apt-get -y install git vim-nox
    DEBIAN_FRONTEND=noninteractive apt-get -y install postgresql-9.3 pgadmin3
}

work
