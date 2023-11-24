defmodule CalculatorTest do
  use ExUnit.Case

  test "single addition works" do
    assert Calculator.eval_rpn(["1", "2", "+"]) == 3
  end

  test "repeated addition works" do
    assert Calculator.eval_rpn(["1", "2", "+", "3", "+"]) == 6
  end

  test "repeated addition works in different order" do
    assert Calculator.eval_rpn(["1", "2", "10", "+", "+"]) == 13
  end
end
