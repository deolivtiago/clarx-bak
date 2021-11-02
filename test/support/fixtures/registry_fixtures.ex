defmodule Clarx.RegistryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Clarx.Registry` context.
  """

  @doc """
  Generate a unique person social_id.
  """
  def unique_person_social_id, do: "some social_id#{System.unique_integer([:positive])}"

  @doc """
  Generate a person.
  """
  def person_fixture(attrs \\ %{}) do
    {:ok, person} =
      attrs
      |> Enum.into(%{
        name: "some name",
        person_type: :natural,
        social_id: unique_person_social_id()
      })
      |> Clarx.Registry.create_person()

    person
  end

  @doc """
  Generate a address.
  """
  def address_fixture(attrs \\ %{}) do
    {:ok, address} =
      attrs
      |> Enum.into(%{
        alias: "some alias",
        neighborhood: "some neighborhood",
        number: "some number",
        street: "some street",
        zip: "some zip"
      })
      |> Clarx.Registry.create_address()

    address
  end
end
