set :stage, :staging
set :deploy_to, ->{"/home/wwwkiiiosk/#{fetch(:application)}"}
server 'icfdev.ru', user: 'wwwkiiiosk', port: 253
server 'icfdev.ru', user: 'wwwkiiiosk', port: 254

set :branch, ENV['BRANCH'] || 'master'
