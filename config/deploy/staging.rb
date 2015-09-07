set :stage, :staging
set :deploy_to, ->{"/home/wwwkiiiosk/#{fetch(:application)}"}
server 'icfdev.ru', user: 'wwwkiiiosk', port: 250
server 'icfdev.ru', user: 'wwwkiiiosk', port: 251

set :branch, ENV['BRANCH'] || 'master'
