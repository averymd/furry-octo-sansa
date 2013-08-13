from __future__ import with_statement
from fabric.api import settings, abort, run, cd, env

env.hosts = ['192.241.189.7']
env.user = 'root'

def deploy_clean_jenkins():
  run('wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war')
  run('cp jenkins.war /var/lib/tomcat7/webapps')
  run('chmod -R 0777 /usr/share/tomcat7')

def deploy_scripts():
	return

def setup_server():
  run('apt-get update')
  run('apt-get install -y tomcat7 default-jdk')
  run('mkdir /var')
  run('/etc/init.d/tomcat7 start')