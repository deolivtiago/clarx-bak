defmodule Clarx.Repo.Migrations.CreateCountries do
  use Ecto.Migration

  def change do
    create table(:countries) do
      add :name, :string, size: 150, null: false
      add :code, :string, size: 5, null: false

      timestamps()
    end

    create unique_index(:countries, [:code])
  end
end
