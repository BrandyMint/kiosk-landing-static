set :stage, :reproduction
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
set :deploy_to, -> { "/home/wwwkiiiosk/#{fetch(:application)}" }
#server 'srv-2.kiiiosk.ru', user: 'wwwkiiiosk', port: 2223, roles: %w(web app db)
server 'icfdev.ru', user: 'wwwkiiiosk', port: 252, roles: %w(web app db)
set :rails_env, :reproduction
set :branch, ENV['BRANCH'] || 'master'
fetch(:default_env).merge!(rails_env: :reproduction)

