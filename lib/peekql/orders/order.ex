defmodule Peekql.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset


  schema "orders" do
    field :balance_due, :integer
    field :description, :string
    field :payments_applied, {:array, :integer}
    field :total, :integer

    has_many :payments, Peekql.Orders.Payment
    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:description, :total, :balance_due, :payments_applied])
    |> validate_required([:description, :total, :balance_due])
  end
end
