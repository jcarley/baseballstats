defmodule Baseballstats.PlayerCsvTest do
  use ExUnit.Case
  doctest Baseballstats.PlayerCsv

  # test "parse csv file" do
    # filename = "master.csv"
    # players = Baseballstats.PlayerCsv.parse(filename)
  # end

  test "splits a line" do
    line = "first,second,third"
    columns = Baseballstats.PlayerCsv.split_columns(line)
    assert columns === ~w(first second third)
  end

  test "strips the line of leading and trailing whitespace" do
    line = "    first,second,third             "
    columns = Baseballstats.PlayerCsv.split_columns(line)
    assert columns === ~w(first second third)
  end

  test "parses headers" do
    line = "id,name,birthday"
    columns = Baseballstats.PlayerCsv.parse_headers(line)
    assert columns === [:id, :name, :birthday]
  end

  test "parse a player with all data points" do
    headers = [:playerID, :birthYear, :birthMonth, :birthDay, :birthCountry, :birthState, :birthCity, :deathYear, :deathMonth, :deathDay, :deathCountry, :deathState, :deathCity, :nameFirst, :nameLast, :nameGiven, :weight, :height, :bats, :throws, :debut, :finalGame, :retroID, :bbrefID]
    line = "abbated01,1877,4,15,USA,PA,Latrobe,1957,1,6,USA,FL,Fort Lauderdale,Ed,Abbaticchio,Edward James,170,71,R,R,1897-09-04,1910-09-15,abbae101,abbated01"
    player = Baseballstats.PlayerCsv.parse_player(line, headers)
    assert is_list(player)
  end

  test "parse a player with some data points" do
    headers = [:playerID, :birthYear, :birthMonth, :birthDay, :birthCountry, :birthState, :birthCity, :deathYear, :deathMonth, :deathDay, :deathCountry, :deathState, :deathCity, :nameFirst, :nameLast, :nameGiven, :weight, :height, :bats, :throws, :debut, :finalGame, :retroID, :bbrefID]
    line = "aasedo01,1954,9,8,USA,CA,Orange,,,,,,,Don,Aase,Donald William,190,75,R,R,1977-07-26,1990-10-03,aased001,aasedo01"
    player = Baseballstats.PlayerCsv.parse_player(line, headers)
    assert is_list(player)
  end

  test "return default value" do
    s = ""
    value = Baseballstats.PlayerCsv.default(s, "0")
    assert value === "0"
  end
end
