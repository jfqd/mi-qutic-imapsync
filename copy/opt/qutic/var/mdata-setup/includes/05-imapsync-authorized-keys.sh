#!/bin/bash
# Configure ruby ssh authorized_keys file if available via mdata

if mdata-get imapsync_authorized_keys 1>/dev/null 2>&1; then
  home='/home/imapsync'
  mkdir -p ${home}/.ssh
  echo "# This file is managed by mdata-get imapsync_authorized_keys" \
    > ${home}/.ssh/authorized_keys
  mdata-get imapsync_authorized_keys >> ${home}/.ssh/authorized_keys
  chmod 700 ${home}/.ssh
  chmod 640 ${home}/.ssh/authorized_keys
  chown imapsync:imapsync ${home}/.ssh/authorized_keys
fi
