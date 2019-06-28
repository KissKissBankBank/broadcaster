Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :user, function: Queries::UserQuery.new
end
