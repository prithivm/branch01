#!/bin/bash

# Save trace setting
XTRACE=$(set +o | grep xtrace)
set +o xtrace

if [[ "$1" == "source" ]]; then
    # no-op
    :
elif [[ "$1" == "stack" && "$2" == "install" ]]; then
    echo_summary "Installing networking-sfc"
    setup_develop $NETWORKING_SFC_DIR
elif [[ "$1" == "stack" && "$2" == "pre-install" ]]; then
    echo_summary "Enabling networking-sfc service plugin"
    _neutron_service_plugin_class_add $SFC_PLUGIN_CLASS
elif [[ "$1" == "stack" && "$2" == "post-config" ]]; then
        if is_service_enabled q-svc; then
            echo_summary "Configuring networking-sfc"
        fi
fi
if [[ "$1" == "unstack" ]]; then
    #no-op
    :
fi
if [[ "$1" == "clean" ]]; then
    #no-op
    :
fi

set +x
$xtrace
