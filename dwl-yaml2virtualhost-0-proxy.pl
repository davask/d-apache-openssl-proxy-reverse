#!/usr/bin/perl
use strict;
use warnings;
use YAML::XS 'LoadFile';

my $projects = LoadFile('/tmp/dwl_proxy_projects.yml');

for (my $i = 0; $i < @{$projects}; $i++) {
    for (my $y = 0; $y < @{$projects->[$i]->{env}}; $y++) {

        print '> Generating ' . $projects->[$i]->{domain} . '-' . $projects->[$i]->{env}->[$y]->{subdomain} . '.conf file';

        my $virtualhost = '/etc/apache2/sites-enabled/' . $projects->[$i]->{domain} . '-' . $projects->[$i]->{env}->[$y]->{subdomain} . '.conf';
        open(my $fh, '>', $virtualhost) or die "Could not open file '$virtualhost' $!";
        print $fh '# generated virtualhost by docker image davask/apache2-proxy
<VirtualHost *:80>
    ServerAdmin contact@davaskweblimited.com
    ProxyPreserveHost On
    ServerName ' . $projects->[$i]->{env}->[$y]->{subdomain} . '.' . $projects->[$i]->{domain} . '
    ProxyPass / http://62.210.239.172:' . $projects->[$i]->{env}->[$y]->{port} . '/
    ProxyPassReverse / http://62.210.239.172:' . $projects->[$i]->{env}->[$y]->{port} . '/
</VirtualHost>
';
        close $fh;
    }
}
