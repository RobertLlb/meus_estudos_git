Rails.application.routes.draw do
  root 'git_commands#index'
  post '/generate_command', to: 'git_commands#create', as: 'generate_command'
end