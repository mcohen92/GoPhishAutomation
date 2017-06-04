#!/bin/bash
touch test.txt
cat > config.json <<EOL
{
        "admin_server" : {
                "listen_url" : "0.0.0.0:3333",
                "use_tls" : false,
                "cert_path" : "example.crt",
                "key_path" : "example.key"
        },
        "phish_server" : {
                "listen_url" : "0.0.0.0:80",
                "use_tls" : false,
                "cert_path" : "example.crt",
                "key_path": "example.key"
        },
        "smtp" : {
                "host" : "$3:25",
                "user" : "$1",
                "pass" : "$2"
        },
		"db_name" : "sqlite3",
        "db_path" : "gophish.db",
        "migrations_path" : "db/migrations/"
}
EOL