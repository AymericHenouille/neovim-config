---Concatenate the tables pass throw the parameters.
---@param tables (table[]) The tables to concatenate.
---@return (table) # A new table with all item in each tables inside.
return function(tables)
  local index = 1
  local buildedtable = {}
  for _, table in ipairs(tables) do
    for _, value in ipairs(table) do
      buildedtable[index] = value
      index = index + 1
    end
  end
  return buildedtable
end
