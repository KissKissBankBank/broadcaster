Rails.application.routes.draw do
  if Rails.env.development?
    post '/graphql', to: 'graphql#execute'
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end
end
