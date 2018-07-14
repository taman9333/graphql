module Types
  ProjectType = GraphQL::ObjectType.define do
    name "Project"
    description "A project"

    field :id, !types.Int
    field :p_title, !types.String, property: :title do
      resolve -> (project, args, ctx) { "#{project.user.email} - #{project.title}" }
    end

    field :user, !UserType
  end
end
