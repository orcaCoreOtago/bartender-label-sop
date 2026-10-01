-- fit-figures.lua  (ORCA SOP house style)
-- In the PDF (Typst) output, shrinks any image taller than the page so it fits,
-- keeping its proportions. Mermaid flowcharts are the usual culprits.
-- A page can turn this off with `fit-figures: false` in its front matter.

local MAX_H_IN = 8.6   -- usable A4 height in inches, leaving room for a caption

local function to_in(v)
  if not v then return nil end
  local n, u = tostring(v):match("^%s*([%d%.]+)%s*(%a*)%s*$")
  n = tonumber(n)
  if not n then return nil end
  if u == "in" then return n
  elseif u == "cm" then return n / 2.54
  elseif u == "mm" then return n / 25.4
  elseif u == "pt" then return n / 72
  end
  return nil   -- px, %, or unknown: leave alone
end

local enabled = true

return {
  { Meta = function(m)
      if m["fit-figures"] == false then enabled = false end
    end },
  { Image = function(img)
      if not enabled or not quarto.doc.is_format("typst") then return nil end
      local h, w = to_in(img.attributes.height), to_in(img.attributes.width)
      if h and h > MAX_H_IN then
        local s = MAX_H_IN / h
        img.attributes.height = string.format("%.2fin", MAX_H_IN)
        if w then img.attributes.width = string.format("%.2fin", w * s) end
        return img
      end
    end }
}
