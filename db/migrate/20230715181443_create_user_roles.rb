class CreateUserRoles < ActiveRecord::Migration[7.0]
  def change
    create_view :user_roles, materialized: true
  end
end
