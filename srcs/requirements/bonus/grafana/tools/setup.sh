sed "s/database_name_here/$MYSQL_WORDPRESS_DATABASE/1" -i -r wp-config.php

grafana server \
    --config /etc/grafana.ini \
    --homepath /usr/share/grafana \
    cfg:paths.data=/var/lib/grafana/data \
    cfg:paths.plugins=/var/lib/grafana/plugins \
    cfg:paths.provisioning=/var/lib/grafana/provisioning \
    cfg:server.http_addr=0.0.0.0 \
    cfg:server.domain=pcoletta.42.fr \
    cfg:server.root_url=%\(protocol\)s://%\(domain\)s:%\(http_port\)s/grafana/