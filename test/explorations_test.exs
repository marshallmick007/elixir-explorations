defmodule ExplorationsTest do
  use ExUnit.Case
  doctest Explorations

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "assignment 1" do
    x = 1
    assert x == 1
  end

  test "assignment 2" do
    {x,y} = {1,2}
    assert x == 1
    assert y == 2
  end

  test "assignment 3" do
    {x, 2, y} = {1, 2, 3}
    assert x == 1
    assert y == 3
  end

  test "assignment 4" do
    # This type of comparison will not work because
    # the second clause cant match 2 and 3
    assert_raise MatchError, fn ->
      z = 3
      {x, 2, y} = {:ok, z, :success}
      assert x == :ok
      assert y == :success
    end
  end

  test "Wildcard assignment" do
    # '_' lets us ignore a part of a match
    {x, _, y} = {1, 2, 3}
    assert x == 1
    assert y == 3
  end

  test "Negate 2 Lists" do
    # Two lists can be considered equal if the
    # intersection of the lists is the empty list
    # TODO: There is probably a better way to do this
    list1 = [1,2,3]
    list2 = [3,1,2]
    comp = list1 -- list2
    assert comp == []
  end

  test "Is 1 in a List" do
    assert 1 in [1,2,3]
  end

  test "Greeter Function" do
    # greeter is a function that returns a function
    # The inner function remembers the scope of the
    # outer function.
    greeter = fn (name) -> (fn -> "Hello #{name}" end) end
    marshall_greeter = greeter.("Marshall")
    assert marshall_greeter.() == "Hello Marshall"
  end

  test "Prefixer Function" do
    prefixer = fn (prefix) -> (fn (term) -> "#{prefix} #{term}" end) end
    hola_prefixer = prefixer.("Hola")
    assert hola_prefixer.("Marshall") == "Hola Marshall"
  end

  test "Enum map" do
    list = [1, 2, 3, 4, 5]
    squares = Enum.map list, fn (item) -> item * item end
    assert squares == [1, 4, 9, 16, 25]
  end

  test "String Interpolation" do
    s = "Hello #{1 + 2}"
    assert s == "Hello 3"
  end

  test "List Length" do
    list = [1, 2, 3]
    len = length(list)
    assert len == 3
  end
end
