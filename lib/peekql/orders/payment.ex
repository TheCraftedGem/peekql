defmodule Peekql.Orders.Payment do
  use Ecto.Schema
  import Ecto.Changeset


  schema "payments" do
    field :amount, :integer
    field :note, :string
    field :order_id, :id
    belongs_to :orders, Order
    timestamps()
  end

  @doc false
  def changeset(payment, attrs) do
    payment
    |> cast(attrs, [])
    |> validate_required([])
  end
end
