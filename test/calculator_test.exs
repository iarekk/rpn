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

  test "subtraction works" do
    assert Calculator.eval_rpn(["12", "5", "-"]) == 7
  end

  test "apply division rounds towards 0" do
    assert Calculator.apply_op("/", 1, 10) == 0
    assert Calculator.apply_op("/", 1, -10) == 0
  end

  test "complext expression" do
    # ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
    # = ((10 * (6 / (12 * -11))) + 17) + 5
    # = ((10 * (6 / -132)) + 17) + 5
    # = ((10 * 0) + 17) + 5
    # = (0 + 17) + 5
    # = 17 + 5
    # = 22

    assert Calculator.eval_rpn([
             "10",
             "6",
             "9",
             "3",
             "+",
             "-11",
             "*",
             "/",
             "*",
             "17",
             "+",
             "5",
             "+"
           ]) == 22
  end
end
