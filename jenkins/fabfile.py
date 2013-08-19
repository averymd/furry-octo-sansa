from __future__ import with_statement
from fabric.api import settings, abort, run, cd, env, put

env.hosts = ['projects.irrsinn.net']
env.user = 'root'

def apache_config():
  with cd('/etc/apache2/sites-available'):
    put('projects.irrsinn.net-vhost', 'projects.irrsinn.net')
    put('default-vhost', 'default')
    run('apache2ctl -k restart')

def base_installs():
  run('apt-get update')
  run('apt-get install -y tomcat7 default-jdk git gitweb vim nano php5 libapache2-mod-php5 php5-mcrypt varnish')

def deploy_clean_jenkins():
  run('wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war')
  run('cp jenkins.war /var/lib/tomcat7/webapps')
  run('chmod -R 0777 /usr/share/tomcat7')

def gitlist_install():
  run('mkdir -r /var/www/projects.irrsinn.net/git')  
  run('mkdir /root/repositories')

  with cd('/root/repositories'):
    #Get repos somehow
    run('chmod -R 0755 .')

  with cd('/var/www/projects.irrsinn.net/git'):
    run('chmod -R 0755 .')
    run('mkdir cache')
    run('chmod 0777 cache')
    put('gitlist-config.ini', 'config.ini', mode=0755)

  run('apache2ctl -k restart')

def projects_install():
  gitlist_install()
  apache_config()
  varnish_config()

def setup_server():
  base_installs()
  tomcat_install()
  projects_install()

def tomcat_install():
  run('/etc/init.d/tomcat7 start')

def varnish_config():
  with cd('/etc/varnish'):
    put('projects.irrsinn.net.vcl', 'projects.irrsinn.net.vcl', mode=0755)
    put('default.vcl', 'default.vcl', mode=0755)
  run('pkill varnishd', warn_only=True)
  run('apache2ctl -k restart')
  run('service varnish restart')
  run('varnishd -f /etc/varnish/default.vcl -s malloc,256M -a :80')