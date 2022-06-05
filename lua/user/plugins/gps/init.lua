local icons = require "user.icons"
return {
  disable_icons = false,
  icons = {
    ["class-name"] = "%#CmpItemKindClass#" .. icons.kind.Class .. "%*" .. " ", -- Classes and class-like objects
    ["function-name"] = "%#CmpItemKindFunction#" .. icons.kind.Function .. "%*" .. " ", -- Functions
    ["method-name"] = "%#CmpItemKindMethod#" .. icons.kind.Method .. "%*" .. " ", -- Methods (functions inside class-like objects)
    ["container-name"] = "%#CmpItemKindProperty#" .. icons.type.Object .. "%*" .. " ", -- Containers (example: lua tables)
    ["tag-name"] = "%#CmpItemKindKeyword#" .. icons.misc.Tag .. "%*" .. " ", -- Tags (example: html tags)
    ["mapping-name"] = "%#CmpItemKindProperty#" .. icons.type.Object .. "%*" .. " ",
    ["sequence-name"] = "%CmpItemKindProperty#" .. icons.type.Array .. "%*" .. " ",
    ["null-name"] = "%CmpItemKindField#" .. icons.kind.Field .. "%*" .. " ",
    ["boolean-name"] = "%CmpItemKindValue#" .. icons.type.Boolean .. "%*" .. " ",
    ["integer-name"] = "%CmpItemKindValue#" .. icons.type.Number .. "%*" .. " ",
    ["float-name"] = "%CmpItemKindValue#" .. icons.type.Number .. "%*" .. " ",
    ["string-name"] = "%CmpItemKindValue#" .. icons.type.String .. "%*" .. " ",
    ["array-name"] = "%CmpItemKindProperty#" .. icons.type.Array .. "%*" .. " ",
    ["object-name"] = "%CmpItemKindProperty#" .. icons.type.Object .. "%*" .. " ",
    ["number-name"] = "%CmpItemKindValue#" .. icons.type.Number .. "%*" .. " ",
    ["table-name"] = "%CmpItemKindProperty#" .. icons.ui.Table .. "%*" .. " ",
    ["date-name"] = "%CmpItemKindValue#" .. icons.ui.Calendar .. "%*" .. " ",
    ["date-time-name"] = "%CmpItemKindValue#" .. icons.ui.Table .. "%*" .. " ",
    ["inline-table-name"] = "%CmpItemKindProperty#" .. icons.ui.Calendar .. "%*" .. " ",
    ["time-name"] = "%CmpItemKindValue#" .. icons.misc.Watch .. "%*" .. " ",
    ["module-name"] = "%CmpItemKindModule#" .. icons.kind.Module .. "%*" .. " ",
  },
  separator = " " .. icons.ui.ChevronRight .. " ",
}
