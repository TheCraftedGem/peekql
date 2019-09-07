defmodule Peekql.Orders.Payment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "payments" do
    field :amount, :integer
    field :note, :string

    belongs_to :order, Peekql.Orders.Order
    timestamps()
  end

  def changeset(payment, attrs) do
    payment
    |> cast(attrs, [:amount, :note, :order_id])
    |> validate_required([])
  end
end
