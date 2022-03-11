#Create a file using Puppet

file {'/tmp/school':
  content => 'I love Puppet',
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0744',
}
