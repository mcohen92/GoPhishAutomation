#!/bin/bash

# When this script is called, the username, password, and IP address of the smtp server
# are passed. The user shouldn't need to worry about this because this script and its 
# command line args will be called by the deployment template. 

if [[ $EUID -ne 0 ]]; then
	echo "Please run this script as root" 1>&2
	exit 1
fi

apt-get install unzip -y > /dev/null 2>&1

wget https://github.com/gophish/gophish/releases/download/v0.3.0/gophish-v0.3-linux-64bit.zip

unzip gophish-v0.3-linux-64bit.zip

cd gophish-v0.3-linux-64bit

echo "Updating config file"



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

  