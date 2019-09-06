require IEx
defmodule PeekqlWeb.OrdersResolver do
  alias Peekql.Orders

  def all_orders(_root, _args, _info) do
    orders = Orders.list_orders()
    {:ok, orders}
  end

  def create_order(_root, %{input: input}, _info) do
    Orders.create_order(input)
  end

  def find_order(_root, %{id: id}, _inf) do
    order = Orders.get_order!(id)
    {:ok, order }
  end

  def place_payment(_, %{input: input}, _) do
    order = Orders.get_order!(input[:order_id])
    Orders.update_order(order, input)
    Orders.create_payment(input)
  end
end
