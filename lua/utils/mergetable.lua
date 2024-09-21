return function(tables)
  local buildedtable = {}
  for _, table in ipairs(tables) do
    for key, value in ipairs(table) do
      buildedtable[key] = value
    end
  end
  return buildedtable
end
