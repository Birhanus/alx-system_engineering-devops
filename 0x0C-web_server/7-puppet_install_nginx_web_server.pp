# install nginx
package { 'nginx':
	  ensure => installed,
}

file_line { 'aaaaa':
	  ensure => 'present',
		   path   => '/etc/nginx/sites-available/default',
		     after  => 'listen 80 default_server;',
		       line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=ykIRWx1RcOE&list=PLj0msIsUsJ05YNJ7c6Ydev1lZmTqS5eyX permanent;',
}

file { '/var/www/html/index.html':
	  content => 'Hello World!',
}

service { 'nginx':
	  ensure  => running,
		    require => Package['nginx'],
}
