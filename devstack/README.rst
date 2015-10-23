=======================================
 Enabling networking-sfc using Devstack
=======================================

1. Download DevStack

2. Add this repo as an external repository::

     > cat local.conf
     [[local|localrc]]
     enable_plugin networking-sfc https://github.com/openstack/networking-sfc

3. run ``stack.sh``
