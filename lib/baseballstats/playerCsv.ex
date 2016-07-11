defmodule Baseballstats.PlayerCsv do

  def parse(filename) do
    {:ok, players} = File.open(filename, [:read], fn(file) ->
      headers = IO.read(file, :line) |> parse_headers

      Enum.map IO.stream(file, :line), &(parse_player(&1, headers))
    end)

    players
  end

  def parse_player(line, headers) do
    player = line
      |> split_columns
      |> convert_types

    Enum.zip headers, player
  end

  def parse_headers(line) do
    line
    |> split_columns
    |> Enum.map(&String.to_atom/1)
  end

  def split_columns(line) do
    line
    |> String.strip
    |> String.split(",")
  end

  def convert_types([playerID, birthYear, birthMonth, birthDay, birthCountry, birthState, birthCity, deathYear, deathMonth, deathDay, deathCountry, deathState, deathCity, nameFirst, nameLast, nameGiven, weight, height, bats, throws, debut, finalGame, retroID, bbrefID]) do
    [
      playerID,
      convert_to_int(birthYear, "0"),
      convert_to_int(birthMonth, "0"),
      convert_to_int(birthDay, "0"),
      birthCountry,
      birthState,
      birthCity,
      convert_to_int(deathYear, "0"),
      convert_to_int(deathMonth, "0"),
      convert_to_int(deathDay, "0"),
      deathCountry,
      deathState,
      deathCity,
      nameFirst,
      nameLast,
      nameGiven,
      convert_to_int(weight, "0"),
      convert_to_int(height, "0"),
      bats,
      throws,
      debut,
      finalGame,
      retroID,
      bbrefID
    ]
  end

  def convert_to_int(s, default_value) do
    s
    |> default(default_value)
    |> String.to_integer
  end

  def default(s, d) do
    value = String.strip(s)
    if byte_size(value) === 0 do
      d
    else
      value
    end
  end

end

