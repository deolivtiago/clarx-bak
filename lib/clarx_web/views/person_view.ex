defmodule ClarxWeb.PersonView do
  use ClarxWeb, :view
  alias ClarxWeb.{AddressView, PersonView}

  def render("index.json", %{persons: persons}) do
    %{data: render_many(persons, PersonView, "person.json")}
  end

  def render("show.json", %{person: person}) do
    %{data: render_one(person, PersonView, "person_with_addresses.json")}
  end

  def render("person_with_addresses.json", %{person: person}) do
    %{
      id: person.id,
      name: person.name,
      person_type: person.person_type,
      social_id: person.social_id,
      addresses: render_many(person.addresses, AddressView, "address.json")
    }
  end

  def render("person.json", %{person: person}) do
    %{
      id: person.id,
      name: person.name,
      person_type: person.person_type,
      social_id: person.social_id
    }
  end
end
