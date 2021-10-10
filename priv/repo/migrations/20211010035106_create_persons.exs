defmodule Clarx.Repo.Migrations.CreatePersons do
  use Ecto.Migration

  def change do
    create table(:persons) do
      add :name, :string, size: 150, null: false
      add :person_type, :integer, null: false
      add :social_id, :string, size: 15, null: false

      timestamps()
    end

    create unique_index(:persons, [:social_id])
  end
end
