///match_any(expression, value...)
/**
 * match_any :: a, a* -> Boolean
 *
 * Check whether an expression is equal to one of the given values.
 * Returns true if the expression matches one or more of the values, false otherwise.
 *
 * @param expression the expression to check
 * @param value... (variadic) the values to compare against
 * @returns true if the expression matches any of the values, false otherwise
 */
for (var i = 1; i < argument_count; i++)
  if (argument[0] == argument[i])
    return true;

return false;
