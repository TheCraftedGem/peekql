defmodule PeekqlWeb.OrdersResolver do
  alias Peekql.Orders

  def all_orders(_root, _args, _info) do
    orders = Orders.list_orders()
    {:ok, orders}
  end

  def create_order(_root, %{input: input}, _info) do
    Orders.create_order(input)
  end
end
