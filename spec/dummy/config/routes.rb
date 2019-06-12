Rails.application.routes.draw do
  mount Broadcaster::Engine => '/broadcaster'
end
