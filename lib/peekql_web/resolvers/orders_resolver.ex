defmodule PeekqlWeb.OrdersResolver do
  alias Peekql.Orders

  def all_orders(_root, _args, _info) do
    orders = Orders.list_orders()

    {:ok, orders}
  end
end
