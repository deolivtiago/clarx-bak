defmodule Clarx.Geo.City do
  use Clarx.Schema
  import Ecto.Changeset
  alias Clarx.Geo.State

  schema "cities" do
    field :name, :string
    belongs_to :state, State

    timestamps()
  end

  @doc false
  def changeset(city, attrs) do
    city
    |> cast(attrs, [:id, :name])
    |> validate_required([:name])
    |> validate_length(:name, max: 150)
    |> assoc_constraint(:state)
  end
end
