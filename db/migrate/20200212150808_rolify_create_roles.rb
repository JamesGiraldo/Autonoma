# frozen_string_literal: true

# rubocop:todo Style/Documentation
class RolifyCreateRoles < ActiveRecord::Migration[5.1]
  def change # rubocop:todo Metrics/MethodLength
    create_table(:roles) do |t|
      t.string :name
      t.references :resource, polymorphic: true

      t.timestamps
    end

    create_table(:users_roles, id: false) do |t|
      t.references :user
      t.references :role
    end

    add_index(:roles, %i[name resource_type resource_id])
    add_index(:users_roles, %i[user_id role_id])
  end
end
# rubocop:enable Style/Documentation
