set :stage, :staging
set :deploy_to, ->{"/home/wwwmerchantly/#{fetch(:application)}"}
server 'srv-2.kiiiosk.ru', user: 'wwwmerchantly', port: 2224
set :branch, ENV['BRANCH'] || 'master'
