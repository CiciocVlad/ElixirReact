defmodule PersonInfo.Directory.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "persons" do
    field :avatar, :string
    field :name, :string
    field :role, :string

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:name, :role, :avatar])
    |> validate_required([:name, :role, :avatar])
  end
end
