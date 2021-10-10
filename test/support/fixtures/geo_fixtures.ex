defmodule Clarx.GeoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Clarx.Geo` context.
  """

  @doc """
  Generate a unique country code.
  """
  def unique_country_code, do: "some code#{System.unique_integer([:positive])}"

  @doc """
  Generate a country.
  """
  def country_fixture(attrs \\ %{}) do
    {:ok, country} =
      attrs
      |> Enum.into(%{
        code: unique_country_code(),
        name: "some name"
      })
      |> Clarx.Geo.create_country()

    country
  end
end
