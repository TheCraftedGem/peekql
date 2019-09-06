defmodule Peekql.OrderResolverTest do
  use PeekqlWeb.ConnCase
  alias Peekql.Order
  alias Peekql.AbsintheHelpers

  @order %{description: "some description", total: 10000, balance_due: 500, payments_applied: []}

  describe "Order Resolver" do
    test "find/2 returns a order", context do
      {:ok, order} = Order.create_order(@order)

      query = """
      {
        order(id: #{order.id}) {
          id
        }
      }
      """

      res = context.conn
        |> post("/graphiql", AbsintheHelpers.query_skeleton(query, "orders"))

      assert json_response(res, 200)["data"]["order"]["id"] == to_string(order.id)
    end
  end
end
