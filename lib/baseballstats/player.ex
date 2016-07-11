defmodule Baseballstats.Player do
  use Ecto.Schema

  import Ecto.Changeset

  schema "players" do
    field :playerID, :string
    field :birthYear, :integer
    field :birthMonth, :integer
    field :birthDay, :integer
    field :birthCountry, :string
    field :birthState, :string
    field :birthCity, :string
    field :deathYear, :integer
    field :deathMonth, :integer
    field :deathDay, :integer
    field :deathCountry, :string
    field :deathState, :string
    field :deathCity, :string
    field :nameFirst, :string
    field :nameLast, :string
    field :nameGiven, :string
    field :weight, :integer
    field :height, :integer
    field :bats, :string
    field :throws, :string
    field :debut, :string
    field :finalGame, :string
    field :retroID, :string
    field :bbrefID, :string
    timestamps
  end

end

