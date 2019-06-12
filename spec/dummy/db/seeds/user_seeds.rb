user_data = [
  {
    email: 'publisher_1@email.com',
  },
  {
    email: 'publisher_2@email.com',
  },
  {
    email: 'subscriber_1@email.com',
  },
  {
    email: 'subscriber_2@email.com',
  },
]

user_data.each do |user_params|
  next if User.where(email: user_params[:email]).any?

  puts "User #{user_params[:email]}"

  User.create(**user_params)
end
