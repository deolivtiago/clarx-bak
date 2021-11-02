defmodule ClarxWeb.AddressController do
  use ClarxWeb, :controller

  alias Clarx.Registry
  alias Clarx.Registry.Address

  action_fallback ClarxWeb.FallbackController

  def index(conn, %{"person_id" => person_id}) do
    person = Registry.get_person!(person_id)
    render(conn, "index.json", addresses: person.addresses)
  end

  def create(conn, %{"person_id" => person_id, "address" => address_params}) do
    person = Registry.get_person!(person_id)

    with {:ok, %Address{} = address} <- Registry.create_address(person, address_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.person_address_path(conn, :show, person_id, address))
      |> render("show.json", address: address)
    end
  end

  def show(conn, %{"id" => id}) do
    address = Registry.get_address!(id)
    render(conn, "show.json", address: address)
  end

  def update(conn, %{"id" => id, "address" => address_params}) do
    address = Registry.get_address!(id)

    with {:ok, %Address{} = address} <- Registry.update_address(address, address_params) do
      render(conn, "show.json", address: address)
    end
  end

  def delete(conn, %{"id" => id}) do
    address = Registry.get_address!(id)

    with {:ok, %Address{}} <- Registry.delete_address(address) do
      send_resp(conn, :no_content, "")
    end
  end
end
