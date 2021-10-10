defmodule Clarx.Geo.Country do
  use Clarx.Schema
  import Ecto.Changeset

  schema "countries" do
    field :code, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(country, attrs) do
    country
    |> cast(attrs, [:name, :code])
    |> validate_required([:name, :code])
    |> unique_constraint(:code)
    |> validate_length(:code, max: 5)
    |> validate_length(:name, max: 150)
    |> update_change(:code, &String.upcase/1)
  end
end
