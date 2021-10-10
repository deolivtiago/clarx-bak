defmodule Clarx.Registry.Person do
  import Ecto.Changeset

  use Clarx.Schema

  schema "persons" do
    field :name, :string
    field :person_type, Ecto.Enum, values: [natural: 0, juridical: 1]
    field :social_id, :string

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:id, :name, :person_type, :social_id])
    |> validate_required([:name, :person_type, :social_id])
    |> unique_constraint(:social_id)
    |> validate_length(:name, max: 150)
    |> validate_length(:social_id, max: 15)
    |> validate_format(:social_id, ~r/^[0-9]+$/, message: "must be only numbers")
  end
end
