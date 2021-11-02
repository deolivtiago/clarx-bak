defmodule Clarx.Registry.Address do
  use Clarx.Schema
  import Ecto.Changeset
  alias Clarx.{Geo.City, Registry.Person}

  schema "addresses" do
    field :alias, :string
    field :street, :string
    field :number, :string
    field :neighborhood, :string
    field :zip, :string
    belongs_to :city, City
    belongs_to :person, Person

    timestamps()
  end

  @doc false
  def changeset(address, attrs) do
    address
    |> cast(attrs, [:id, :alias, :street, :number, :neighborhood, :zip, :city_id, :person_id])
    |> validate_required([:alias, :street, :zip, :city_id])
    |> unique_constraint(:alias)
    |> validate_length(:alias, max: 15)
    |> validate_length(:street, max: 100)
    |> validate_length(:number, max: 10)
    |> validate_length(:neighborhood, max: 50)
    |> validate_length(:zip, is: 8)
    |> validate_format(:zip, ~r/^[0-9]+$/, message: "must be only numbers")
    |> assoc_constraint(:city)
    |> assoc_constraint(:person)
  end
end
