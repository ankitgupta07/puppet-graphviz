puppet-graphviz
===============

Puppet Module for installing graphviz

Overview
--------
This module installs graphviz on Linux servers which could be used with Java programs.

Module Description
-------------------
Graphviz is an open source graph visualization software. More Details - http://www.graphviz.org/

Setup
-----

**What graphviz module does:**

* Copies the graphviz repo file to /etc/yum.repos.d/
* From the graphviz repo, it would install the mentioned rpms in the module

Usage
------

The graphviz module can be used as:

    class { 'graphviz': }

Limitations
------------

Platforms : Linux

Language : Java

Though this module installs graphviz for Java programs only, the repository already contains graphviz binaries for different programming languages like ruby etc. The required packages can be added to the module.
