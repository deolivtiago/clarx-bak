defmodule Clarx.Repo.Migrations.CreateStates do
  use Ecto.Migration

  def change do
    create table(:states) do
      add :name, :string, size: 150, null: false
      add :code, :string, size: 5, null: false
      add :country_id, references(:countries, on_delete: :delete_all), null: false

      timestamps()
    end

    create unique_index(:states, [:code])
    create index(:states, [:country_id])
  end
end
