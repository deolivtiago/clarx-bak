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

  describe "states" do
    alias Clarx.Geo.State

    import Clarx.GeoFixtures

    @invalid_attrs %{code: nil, name: nil}

    test "list_states/0 returns all states" do
      state = state_fixture()
      assert Geo.list_states() == [state]
    end

    test "get_state!/1 returns the state with given id" do
      state = state_fixture()
      assert Geo.get_state!(state.id) == state
    end

    test "create_state/1 with valid data creates a state" do
      valid_attrs = %{code: "some code", name: "some name"}

      assert {:ok, %State{} = state} = Geo.create_state(valid_attrs)
      assert state.code == "some code"
      assert state.name == "some name"
    end

    test "create_state/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Geo.create_state(@invalid_attrs)
    end

    test "update_state/2 with valid data updates the state" do
      state = state_fixture()
      update_attrs = %{code: "some updated code", name: "some updated name"}

      assert {:ok, %State{} = state} = Geo.update_state(state, update_attrs)
      assert state.code == "some updated code"
      assert state.name == "some updated name"
    end

    test "update_state/2 with invalid data returns error changeset" do
      state = state_fixture()
      assert {:error, %Ecto.Changeset{}} = Geo.update_state(state, @invalid_attrs)
      assert state == Geo.get_state!(state.id)
    end

    test "delete_state/1 deletes the state" do
      state = state_fixture()
      assert {:ok, %State{}} = Geo.delete_state(state)
      assert_raise Ecto.NoResultsError, fn -> Geo.get_state!(state.id) end
    end

    test "change_state/1 returns a state changeset" do
      state = state_fixture()
      assert %Ecto.Changeset{} = Geo.change_state(state)
    end
  end

  describe "cities" do
    alias Clarx.Geo.City

    import Clarx.GeoFixtures

    @invalid_attrs %{name: nil}

    test "list_cities/0 returns all cities" do
      city = city_fixture()
      assert Geo.list_cities() == [city]
    end

    test "get_city!/1 returns the city with given id" do
      city = city_fixture()
      assert Geo.get_city!(city.id) == city
    end

    test "create_city/1 with valid data creates a city" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %City{} = city} = Geo.create_city(valid_attrs)
      assert city.name == "some name"
    end

    test "create_city/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Geo.create_city(@invalid_attrs)
    end

    test "update_city/2 with valid data updates the city" do
      city = city_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %City{} = city} = Geo.update_city(city, update_attrs)
      assert city.name == "some updated name"
    end

    test "update_city/2 with invalid data returns error changeset" do
      city = city_fixture()
      assert {:error, %Ecto.Changeset{}} = Geo.update_city(city, @invalid_attrs)
      assert city == Geo.get_city!(city.id)
    end

    test "delete_city/1 deletes the city" do
      city = city_fixture()
      assert {:ok, %City{}} = Geo.delete_city(city)
      assert_raise Ecto.NoResultsError, fn -> Geo.get_city!(city.id) end
    end

    test "change_city/1 returns a city changeset" do
      city = city_fixture()
      assert %Ecto.Changeset{} = Geo.change_city(city)
    end
  end
end
