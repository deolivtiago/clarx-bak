defmodule Clarx.Geo.City do
  use Clarx.Schema
  import Ecto.Changeset
  alias Clarx.{Geo.State, Registry.Address}

  schema "cities" do
    field :name, :string
    belongs_to :state, State
    has_many :addresses, Address

    timestamps()
  end

  @doc false
  def changeset(city, attrs) do
    city
    |> cast(attrs, [:id, :name, :state_id])
    |> validate_required([:name])
    |> validate_length(:name, max: 150)
    |> assoc_constraint(:state)
    |> cast_assoc(:addresses)
  end
end
