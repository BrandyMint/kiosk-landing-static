# config valid only for current version of Capistrano
lock '3.3.5'
set :application, "kiosk-landing-static"
set :scm, :git
set :repo_url, 'git@github.com:BrandyMint/kiosk-landing-static.git'
set :keep_releases, 5
set :branch, ENV['BRANCH'] || 'master'
