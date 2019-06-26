module GraphQLHelpers
  def graphql_resolve(field_name, obj, args, ctx)
    type = ApplicationSchema.types.fetch(described_class.name)
    field = type.fields.fetch(field_name)

    field.resolve(obj, args || {}, ctx || {})
  end
end
