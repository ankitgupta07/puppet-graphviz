# Class: graphviz
#
# This manifest would remove the installed graphviz software
#

class graphviz::remove {

  file { 'graphviz-yum-repo':
        ensure  => absent,
        path    => '/etc/yum.repos.d/graphviz-rhel.repo',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        source  => 'puppet:///modules/graphviz/graphviz-rhel.repo',
		require => [Package['graphviz-graphs.x86_64'], Package['graphviz-java.x86_64']]
    }
	
	$packagelist = ['swig', 'graphviz.x86_64', 'graphviz-devel.x86_64', 'graphviz-gd.x86_64', 'graphviz-graphs.x86_64', 'graphviz-java.x86_64']
	
    package { $packagelist:
        ensure  => absent
    }
}
