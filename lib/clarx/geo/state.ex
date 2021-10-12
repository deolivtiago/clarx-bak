defmodule Clarx.Geo.State do
  use Clarx.Schema
  import Ecto.Changeset
  alias Clarx.Geo.{City, Country}

  schema "states" do
    field :code, :string
    field :name, :string
    belongs_to :country, Country
    has_many :cities, City, on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(state, attrs) do
    state
    |> cast(attrs, [:id, :name, :code])
    |> validate_required([:name, :code])
    |> unique_constraint(:code)
    |> validate_length(:code, max: 5)
    |> validate_length(:name, max: 150)
    |> update_change(:code, &String.upcase/1)
    |> assoc_constraint(:country)
    |> cast_assoc(:cities)
  end
end
