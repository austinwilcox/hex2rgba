local M = {}

function M.hex2rgba()
  local r,c = unpack(vim.api.nvim_win_get_cursor(0))
  local lines = vim.api.nvim_buf_get_lines(0,r-1,r,false)
  local line = unpack(lines)
  local beginningindexofhexcode = string.find(line, '#%x%x%x%x%x')
  local length = 6
  if beginningindexofhexcode == nil then
    beginningindexofhexcode = string.find(line, '#%x%x%x')
    length = 3
    if beginningindexofhexcode == nil then
      return ''
    end
  end
  local hexcode = string.sub(line, beginningindexofhexcode, beginningindexofhexcode + length)
  local rgba = getrgbafromhex(hexcode)
  vim.api.nvim_buf_set_text(0,r-1,beginningindexofhexcode -1,r-1,beginningindexofhexcode + hexcode:len() -1,{rgba})
  return ''
end

function getrgbafromhex(hex)
  local hexwithnopoundsign = hex:gsub("#","")
  local red, green, blue
  if hexwithnopoundsign:len() == 3 then
    red = tonumber("0x"..hexwithnopoundsign:sub(1,1)) * 17
    green = tonumber("0x"..hexwithnopoundsign:sub(2,2)) * 17
    blue = tonumber("0x"..hexwithnopoundsign:sub(3,3)) * 17
  else
    red = tonumber("0x"..hexwithnopoundsign:sub(1,2))
    green = tonumber("0x"..hexwithnopoundsign:sub(3,4))
    blue = tonumber("0x"..hexwithnopoundsign:sub(5,6))
  end
  local rgba = "rgba(" .. tostring(red) ..  "," .. tostring(green) .. "," .. blue ..",1.0)"

  return rgba
end

return M
