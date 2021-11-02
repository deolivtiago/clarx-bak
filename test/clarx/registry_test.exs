defmodule Clarx.RegistryTest do
  use Clarx.DataCase

  alias Clarx.Registry

  describe "persons" do
    alias Clarx.Registry.Person

    import Clarx.RegistryFixtures

    @invalid_attrs %{name: nil, person_type: nil, social_id: nil}

    test "list_persons/0 returns all persons" do
      person = person_fixture()
      assert Registry.list_persons() == [person]
    end

    test "get_person!/1 returns the person with given id" do
      person = person_fixture()
      assert Registry.get_person!(person.id) == person
    end

    test "create_person/1 with valid data creates a person" do
      valid_attrs = %{name: "some name", person_type: :natural, social_id: "some social_id"}

      assert {:ok, %Person{} = person} = Registry.create_person(valid_attrs)
      assert person.name == "some name"
      assert person.person_type == :natural
      assert person.social_id == "some social_id"
    end

    test "create_person/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Registry.create_person(@invalid_attrs)
    end

    test "update_person/2 with valid data updates the person" do
      person = person_fixture()
      update_attrs = %{name: "some updated name", person_type: :juridical, social_id: "some updated social_id"}

      assert {:ok, %Person{} = person} = Registry.update_person(person, update_attrs)
      assert person.name == "some updated name"
      assert person.person_type == :juridical
      assert person.social_id == "some updated social_id"
    end

    test "update_person/2 with invalid data returns error changeset" do
      person = person_fixture()
      assert {:error, %Ecto.Changeset{}} = Registry.update_person(person, @invalid_attrs)
      assert person == Registry.get_person!(person.id)
    end

    test "delete_person/1 deletes the person" do
      person = person_fixture()
      assert {:ok, %Person{}} = Registry.delete_person(person)
      assert_raise Ecto.NoResultsError, fn -> Registry.get_person!(person.id) end
    end

    test "change_person/1 returns a person changeset" do
      person = person_fixture()
      assert %Ecto.Changeset{} = Registry.change_person(person)
    end
  end

  describe "addresses" do
    alias Clarx.Registry.Address

    import Clarx.RegistryFixtures

    @invalid_attrs %{alias: nil, neighborhood: nil, number: nil, street: nil, zip: nil}

    test "list_addresses/0 returns all addresses" do
      address = address_fixture()
      assert Registry.list_addresses() == [address]
    end

    test "get_address!/1 returns the address with given id" do
      address = address_fixture()
      assert Registry.get_address!(address.id) == address
    end

    test "create_address/1 with valid data creates a address" do
      valid_attrs = %{alias: "some alias", neighborhood: "some neighborhood", number: "some number", street: "some street", zip: "some zip"}

      assert {:ok, %Address{} = address} = Registry.create_address(valid_attrs)
      assert address.alias == "some alias"
      assert address.neighborhood == "some neighborhood"
      assert address.number == "some number"
      assert address.street == "some street"
      assert address.zip == "some zip"
    end

    test "create_address/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Registry.create_address(@invalid_attrs)
    end

    test "update_address/2 with valid data updates the address" do
      address = address_fixture()
      update_attrs = %{alias: "some updated alias", neighborhood: "some updated neighborhood", number: "some updated number", street: "some updated street", zip: "some updated zip"}

      assert {:ok, %Address{} = address} = Registry.update_address(address, update_attrs)
      assert address.alias == "some updated alias"
      assert address.neighborhood == "some updated neighborhood"
      assert address.number == "some updated number"
      assert address.street == "some updated street"
      assert address.zip == "some updated zip"
    end

    test "update_address/2 with invalid data returns error changeset" do
      address = address_fixture()
      assert {:error, %Ecto.Changeset{}} = Registry.update_address(address, @invalid_attrs)
      assert address == Registry.get_address!(address.id)
    end

    test "delete_address/1 deletes the address" do
      address = address_fixture()
      assert {:ok, %Address{}} = Registry.delete_address(address)
      assert_raise Ecto.NoResultsError, fn -> Registry.get_address!(address.id) end
    end

    test "change_address/1 returns a address changeset" do
      address = address_fixture()
      assert %Ecto.Changeset{} = Registry.change_address(address)
    end
  end
end
