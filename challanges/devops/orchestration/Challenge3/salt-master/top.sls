install_and_start_apache:
    pkg.installed:  
        - name: apache2
welcome_page:
    file.managed:
        - name:  /var/www/html/index.html
        - source:  salt://index.html
# This is throwing error while applying state
# TypeError: '>' not supported between instances of 'dict' and 'int'
#apache2:
#    service.running:
#        enable: true

# Putting cmd.run to start apache2 service as service module has issues. 
apache2_run:
    cmd.run:
        - name: /usr/sbin/service  apache2 restart > /dev/null 2>&1
    
    
