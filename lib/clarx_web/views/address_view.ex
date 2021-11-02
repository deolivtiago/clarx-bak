defmodule ClarxWeb.AddressView do
  use ClarxWeb, :view
  alias ClarxWeb.AddressView

  def render("index.json", %{addresses: addresses}) do
    %{data: render_many(addresses, AddressView, "address.json")}
  end

  def render("show.json", %{address: address}) do
    %{data: render_one(address, AddressView, "address.json")}
  end

  def render("address.json", %{address: address}) do
    %{
      id: address.id,
      alias: address.alias,
      street: address.street,
      number: address.number,
      neighborhood: address.neighborhood,
      zip: address.zip
    }
  end
end
