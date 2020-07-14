server '46.101.246.61', port: 22, roles: [:web, :app, :db], primary: true
set :stage,           :production
set :branch,          'master'