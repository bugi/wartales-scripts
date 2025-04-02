#!jq

# This is a jq (https://jqlang.org/) script to edit the data.cdb file of a
# Wartales game definition file.

# This tries to duplicate part of
#   https://www.nexusmods.com/wartales/mods/97


# make basics weightless
( .sheets[] | select(.name == "item")| .lines[]
  | select( .type | IN(
      "Miscellaneous",
      "Component",
      "Flowers",
      "Tool",
      "ToolProd"
      )
    )
  .weight
  )=0

