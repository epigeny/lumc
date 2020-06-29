opal backup-project -u administrator -p password -pr lumc -ar /home/administrator/archive/lumc -f | opal task --user administrator --password password --wait
mkdir -p tmp
opal file --user administrator --password password --download /home/administrator/archive/lumc > tmp/lumc.zip 
opal file --opal https://opal-demo.obiba.org --user administrator --password password -up tmp/lumc.zip /home/administrator
opal project --opal https://opal-demo.obiba.org --user administrator --password password --add --name lumc -db mongodb
opal restore-project --opal https://opal-demo.obiba.org --user administrator --password password --project lumc --archive /home/administrator/lumc.zip
