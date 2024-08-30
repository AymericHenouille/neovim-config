local function merge_tables(table1, table2)
  local table = {}
  for _, current_table in ipairs({ table1, table2 }) do
    for index, value in ipairs(current_table) do
      table[index] = value
    end
  end
  return table
end

return {
  merge_tables = merge_tables
}
