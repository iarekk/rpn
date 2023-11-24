defmodule CalculatorTest do
  use ExUnit.Case

  test "single addition works" do
    assert Calculator.eval_rpn(["1", "2", "+"]) == 3
  end
end
