module Queries
  class UserQuery < GraphQL::Function
    description 'Find a user by id'

    type Types::UserType
    argument :id, !types.Int

    def call(_obj, args, _ctx)
      return User.find(args[:id]) if args[:id]

      raise ArgumentError, 'Please provide an id'
    end
  end
end
