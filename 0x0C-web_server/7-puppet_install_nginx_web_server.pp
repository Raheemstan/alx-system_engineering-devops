# Install nginx with puppet

# Install Nginx module
class { 'nginx':
  manage_repo => true,
}

# Define Nginx server configuration
nginx::resource::vhost { 'default':
  listen_port    => 80,
  server_name    => '_',
  www_root       => '/var/www/html',
  index_files    => ['index.html'],
  error_log_path => '/var/log/nginx/error.log',
  access_log_path => '/var/log/nginx/access.log',
  locations      => {
    '/' => {
      content => 'Hello World!',
    },
    '/redirect_me' => {
      ensure   => present,
      location => {
        try_files => '$uri $uri/ =404',
        return    => '301 http://$host/',
      },
    },
  },
}
