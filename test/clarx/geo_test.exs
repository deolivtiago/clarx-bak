defmodule Clarx.GeoTest do
  use Clarx.DataCase

  alias Clarx.Geo

  describe "countries" do
    alias Clarx.Geo.Country

    import Clarx.GeoFixtures

    @invalid_attrs %{code: nil, name: nil}

    test "list_countries/0 returns all countries" do
      country = country_fixture()
      assert Geo.list_countries() == [country]
    end

    test "get_country!/1 returns the country with given id" do
      country = country_fixture()
      assert Geo.get_country!(country.id) == country
    end

    test "create_country/1 with valid data creates a country" do
      valid_attrs = %{code: "some code", name: "some name"}

      assert {:ok, %Country{} = country} = Geo.create_country(valid_attrs)
      assert country.code == "some code"
      assert country.name == "some name"
    end

    test "create_country/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Geo.create_country(@invalid_attrs)
    end

    test "update_country/2 with valid data updates the country" do
      country = country_fixture()
      update_attrs = %{code: "some updated code", name: "some updated name"}

      assert {:ok, %Country{} = country} = Geo.update_country(country, update_attrs)
      assert country.code == "some updated code"
      assert country.name == "some updated name"
    end

    test "update_country/2 with invalid data returns error changeset" do
      country = country_fixture()
      assert {:error, %Ecto.Changeset{}} = Geo.update_country(country, @invalid_attrs)
      assert country == Geo.get_country!(country.id)
    end

    test "delete_country/1 deletes the country" do
      country = country_fixture()
      assert {:ok, %Country{}} = Geo.delete_country(country)
      assert_raise Ecto.NoResultsError, fn -> Geo.get_country!(country.id) end
    end

    test "change_country/1 returns a country changeset" do
      country = country_fixture()
      assert %Ecto.Changeset{} = Geo.change_country(country)
    end
  end
end
