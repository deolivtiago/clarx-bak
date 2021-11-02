defmodule Clarx.Repo.Migrations.CreateAddresses do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add :alias, :string, size: 15, null: false
      add :street, :string, size: 100, null: false
      add :number, :string, size: 10
      add :neighborhood, :string, size: 50
      add :zip, :string, size: 15, null: false
      add :city_id, references(:cities, on_delete: :restrict), null: false
      add :person_id, references(:persons, on_delete: :delete_all), null: false

      timestamps()
    end

    create unique_index(:addresses, [:alias])
    create index(:addresses, [:city_id])
    create index(:addresses, [:person_id])
  end
end
