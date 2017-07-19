user www-data;
worker_processes auto;
pid /run/nginx.pid;

events {
	worker_connections 1024;
}

http {
	keepalive_timeout 65;
	types_hash_max_size 2048;
	server_tokens off;

	include /etc/nginx/mime.types;
	default_type application/octet-stream;

	##
	# SSL Settings
	##

	ssl_protocols TLSv1 TLSv1.1 TLSv1.2; # Dropping SSLv3, ref: POODLE
	ssl_prefer_server_ciphers on;

	##
	# Logging Settings
	##

	access_log /var/log/nginx/access.log;
	error_log /var/log/nginx/error.log;

	##
	# Gzip Settings
	##

	gzip on;
	gzip_proxied any;
	gzip_disable "msie6";
	gzip_types
            	text/css
                text/plain
    	        text/javascript
    	        application/javascript
    	        application/json
    	        application/x-javascript
    	        application/xml
    	        application/xml+rss
    	        application/xhtml+xml
    	        application/x-font-ttf
    	        application/x-font-opentype
    	        application/vnd.ms-fontobject
    	        image/svg+xml
    	        image/x-icon
    	        application/rss+xml
    	        application/atom_xml;

        gzip_comp_level 5;
        gzip_vary on;
        gzip_min_length 50;

	##
	# Virtual Host Configs
	##

	include /etc/nginx/conf.d/*.conf;
	include /etc/nginx/sites-enabled/*;
}
