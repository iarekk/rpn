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

  def eval_rpn_internal([op | rest_tokens], [a, b | rest_stack])
      when op in ["+", "-", "*", "/"] do
    eval_rpn_internal(rest_tokens, [apply_op(op, a, b) | rest_stack])
  end

  def eval_rpn_internal([token | rest_tokens], stack) do
    {int_val, ""} = Integer.parse(token)
    eval_rpn_internal(rest_tokens, [int_val | stack])
  end

  def eval_rpn_internal([], [current_result]) do
    current_result
  end

  def apply_op("+", a, b), do: a + b
  def apply_op("-", a, b), do: a - b
  def apply_op("*", a, b), do: a * b
  def apply_op("/", a, b), do: a / b
end
