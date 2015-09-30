#specify the default configs for openssh
default['openssh']['client']['forward_agent'] = 'yes'
default['openssh']['client']['forward_x11'] = 'no'
default['openssh']['client']['forward_x11_trusted'] = 'no'
default['openssh']['client']['g_s_s_a_p_i_authentication'] = 'no'
default['openssh']['client']['send_env'] = 'LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_MESSAGES LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT LC_IDENTIFICATION LC_ALL LANGUAGE XMODIFIERS'

default['openssh']['server']['permit_root_login'] = 'no'
default['openssh']['server']['password_authentication'] = 'yes'
default['openssh']['server']['g_s_s_a_p_i_authentication'] = 'no'
default['openssh']['server']['g_s_s_a_p_i_cleanup_credentials'] = 'yes'

default['openssh']['server']['subsystem']       = 'sftp /usr/libexec/openssh/sftp-server'

default['openssh']['server']['syslog_facility'] = 'AUTHPRIV'
default['openssh']['server']['use_p_a_m']       = 'yes'
default['openssh']['server']['x11_forwarding']  = 'yes'
default['openssh']['server']['accept_env'] = 'LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_MESSAGES LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT LC_IDENTIFICATION LC_ALL LANGUAGE XMODIFIERS'
