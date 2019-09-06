defmodule PeekqlWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Ecto, repo: Peekql.Repo

  alias PeekqlWeb.OrdersResolver

  object :payment do
    field :id, non_null(:id)
    field :amount, non_null(:integer)
    field :note, :string
    field :order_id, non_null(:id)
    field :inserted_at
    field :order, :order, resolve: assoc(:order)
  end

  object :order do
    field :id, non_null(:id)
    field :description, non_null(:string)
    field :total, non_null(:integer)
    field :balance_due, non_null(:integer)
    field :payments, list_of(:payment)
  end

  input_object :order_input_type do
    field :description, non_null(:string)
    field :total, non_null(:integer)
    field :balance_due, non_null(:integer)

  end

  input_object :payment_input_type do
    field :amount, non_null(:integer)
    field :note, non_null(:string)
    field :order_id, non_null(:id)
  end


  query do
    @desc "Shows All Orders"
    field :all_orders, non_null(list_of(non_null(:order))) do
      resolve &OrdersResolver.all_orders/3
    end

    @desc "Find One Order"
    field :find_order, :order do
      arg :id, non_null(:id)
      resolve &OrdersResolver.find_order/3
    end
  end

  mutation do
    @desc "Creates Order"
    field :create_order, :order do
      arg(:input, non_null(:order_input_type))
      resolve &OrdersResolver.create_order/3
    end

    @desc "Creates Payment For Order"
    field :place_payment, :payment do
      arg(:input, non_null(:payment_input_type))
      resolve &OrdersResolver.place_payment/3
    end

  end
end
