nova:
  compute:
    version: queens
    enabled: true
    heal_instance_info_cache_interval: 60
    vncproxy_url: openstack:6080
    vnc_keymap: en-gb
    resume_guests_state_on_host_boot: False
    preallocate_images: space
    nfs_mount_options: 'vers=3,lookupcache=pos'
    bind:
      vnc_address: 127.0.0.1
      vnc_port: 6080
      vnc_name: 0.0.0.0
    database:
      engine: mysql
      host: 127.0.0.1
      port: 3306
      name: nova
      user: nova
      password: password
    identity:
      engine: keystone
      region: RegionOne
      host: 127.0.0.1
      port: 35357
      user: nova
      password: password
      tenant: service
    logging:
      log_appender: false
      log_handlers:
        watchedfile:
          enabled: true
        fluentd:
          enabled: false
        ossyslog:
          enabled: false
    message_queue:
      engine: rabbitmq
      host: 127.0.0.1
      port: 5672
      user: openstack
      password: password
      virtual_host: '/openstack'
    image:
      engine: glance
      host: 127.0.0.1
      port: 9292
    network:
      engine: neutron
      region: RegionOne
      host: 127.0.0.1
      port: 9696
      password: password
    cache:
      engine: memcached
      members:
      - host: 127.0.0.1
        port: 11211
      security:
        enabled: true
        strategy: ENCRYPT
        secret_key: secret
    config_drive:
      cdrom: True
      format: iso9660
      inject_password: True
    consoleauth:
      token_ttl: 600
