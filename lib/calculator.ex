# Solution for https://leetcode.com/problems/evaluate-reverse-polish-notation/

defmodule Calculator do
  @spec eval_rpn(tokens :: [String.t()]) :: integer
  def eval_rpn(tokens) do
    eval_rpn_internal(tokens, [])
  end

  @spec eval_rpn_internal(
          tokens :: [String.t()],
          stack :: [Integer.t()]
        ) ::
          Integer.t()

  # processing an operation:
  # take 2 from the stack, apply operation
  # place the result back on the stack
  def eval_rpn_internal([op | rest_tokens], [a, b | rest_stack])
      when op in ["+", "-", "*", "/"] do
    eval_rpn_internal(rest_tokens, [apply_op(op, b, a) | rest_stack])
  end

  # keep putting integers on the stack
  def eval_rpn_internal([token | rest_tokens], stack) do
    # no error handling for invalid numbers
    {int_val, ""} = Integer.parse(token)
    eval_rpn_internal(rest_tokens, [int_val | stack])
  end

  # input empty, single element on the stack = result
  def eval_rpn_internal([], [current_result]) do
    current_result
  end

  def apply_op("+", a, b), do: a + b
  def apply_op("-", a, b), do: a - b
  def apply_op("*", a, b), do: a * b
  # forcing the integer division, as `/` returns a float
  def apply_op("/", a, b), do: div(a, b)
end
