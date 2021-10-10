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
end
