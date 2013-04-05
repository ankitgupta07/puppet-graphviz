# Class: graphviz
#
# This module installs graphviz which could be used with Java code
#
# Parameters: version, ensure and autoupgrade

class graphviz($version=undef, $ensure=present, $autoupgrade='false') {

    if !($ensure in ['present', 'absent']) {
        fail('graphviz ensure parameter must be absent or present')
    }

    if !($autoupgrade in ['true', 'false']) {
        fail('graphviz autoupgrade parameter must be true or false')
    }

    if ($version) {
        $version_real = $version
    }
    else {
        $version_real = present
    }

    if ($ensure == 'present') {
        if ($autoupgrade == 'true') {
            $package_ensure = latest
        }
        else {
            $package_ensure = $version_real
        }
    }
    else {
        $package_ensure = absent
    }

  file { 'graphviz-yum-repo':
        ensure  => file,
        path    => '/etc/yum.repos.d/graphviz-rhel.repo',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        source  => 'puppet:///modules/graphviz/graphviz-rhel.repo'
    }
	
	$packagelist = ['swig', 'graphviz.x86_64', 'graphviz-devel.x86_64', 'graphviz-gd.x86_64', 'graphviz-graphs.x86_64', 'graphviz-java.x86_64']
	
    package { $packagelist:
        ensure  => $package_ensure,
		require => File['graphviz-yum-repo']
    }
}
