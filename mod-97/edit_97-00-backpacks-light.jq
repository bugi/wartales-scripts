#!jq

# This is a jq (https://jqlang.org/) script to edit the data.cdb file of a
# Wartales game definition file.

# This tries to duplicate part of
#   https://www.nexusmods.com/wartales/mods/97

# uniform backpacks
( .sheets[] | select(.name == "itemType")
  | .lines[]
  | select( .id | IN(
      "Armor",  "ArmorMedium",  "ArmorHeavy"
      )
    )
  | .props
  .backpackName
  )="BackpackLight"

