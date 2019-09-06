# defmodule Peekql.OrdersTest do
#   use Peekql.DataCase

#   alias Peekql.Orders

#   describe "orders" do
#     alias Peekql.Orders.Order

#     @valid_attrs %{balance_due: 42, description: "some description", payments_applied: [], total: 42}
#     @update_attrs %{balance_due: 43, description: "some updated description", payments_applied: [], total: 43}
#     @invalid_attrs %{balance_due: nil, description: nil, payments_applied: nil, total: nil}

#     def order_fixture(attrs \\ %{}) do
#       {:ok, order} =
#         attrs
#         |> Enum.into(@valid_attrs)
#         |> Orders.create_order()

#       order
#     end

#     test "list_orders/0 returns all orders" do
#       order = order_fixture()
#       assert Orders.list_orders() == [order]
#     end

#     test "get_order!/1 returns the order with given id" do
#       order = order_fixture()
#       assert Orders.get_order!(order.id) == order
#     end

#     test "create_order/1 with valid data creates a order" do
#       assert {:ok, %Order{} = order} = Orders.create_order(@valid_attrs)
#       assert order.balance_due == 42
#       assert order.description == "some description"
#       assert order.payments_applied == []
#       assert order.total == 42
#     end

#     test "create_order/1 with invalid data returns error changeset" do
#       assert {:error, %Ecto.Changeset{}} = Orders.create_order(@invalid_attrs)
#     end

#     test "update_order/2 with valid data updates the order" do
#       order = order_fixture()
#       assert {:ok, order} = Orders.update_order(order, @update_attrs)
#       assert %Order{} = order
#       assert order.balance_due == 43
#       assert order.description == "some updated description"
#       assert order.payments_applied == []
#       assert order.total == 43
#     end

#     test "update_order/2 with invalid data returns error changeset" do
#       order = order_fixture()
#       assert {:error, %Ecto.Changeset{}} = Orders.update_order(order, @invalid_attrs)
#       assert order == Orders.get_order!(order.id)
#     end

#     test "delete_order/1 deletes the order" do
#       order = order_fixture()
#       assert {:ok, %Order{}} = Orders.delete_order(order)
#       assert_raise Ecto.NoResultsError, fn -> Orders.get_order!(order.id) end
#     end

#     test "change_order/1 returns a order changeset" do
#       order = order_fixture()
#       assert %Ecto.Changeset{} = Orders.change_order(order)
#     end
#   end

#   describe "payments" do
#     alias Peekql.Orders.Payment

#     @valid_attrs %{}
#     @update_attrs %{}
#     @invalid_attrs %{}

#     def payment_fixture(attrs \\ %{}) do
#       {:ok, payment} =
#         attrs
#         |> Enum.into(@valid_attrs)
#         |> Orders.create_payment()
#       payment
#     end

#     test "list_payments/0 returns all payments" do
#       payment = payment_fixture()
#       assert Orders.list_payments() == [payment]
#     end

#     test "get_payment!/1 returns the payment with given id" do
#       payment = payment_fixture()
#       assert Orders.get_payment!(payment.id) == payment
#     end

#     test "create_payment/1 with valid data creates a payment" do
#       assert {:ok, %Payment{} = payment} = Orders.create_payment(@valid_attrs)
#     end

#     test "create_payment/1 with invalid data returns error changeset" do
#       assert {:error, %Ecto.Changeset{}} = Orders.create_payment(@invalid_attrs)
#     end

#     test "update_payment/2 with valid data updates the payment" do
#       payment = payment_fixture()
#       assert {:ok, payment} = Orders.update_payment(payment, @update_attrs)
#       assert %Payment{} = payment
#     end

#     test "update_payment/2 with invalid data returns error changeset" do
#       payment = payment_fixture()
#       assert {:error, %Ecto.Changeset{}} = Orders.update_payment(payment, @invalid_attrs)
#       assert payment == Orders.get_payment!(payment.id)
#     end

#     test "delete_payment/1 deletes the payment" do
#       payment = payment_fixture()
#       assert {:ok, %Payment{}} = Orders.delete_payment(payment)
#       assert_raise Ecto.NoResultsError, fn -> Orders.get_payment!(payment.id) end
#     end

#     test "change_payment/1 returns a payment changeset" do
#       payment = payment_fixture()
#       assert %Ecto.Changeset{} = Orders.change_payment(payment)
#     end
#   end
# end
