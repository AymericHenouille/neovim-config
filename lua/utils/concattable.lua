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
