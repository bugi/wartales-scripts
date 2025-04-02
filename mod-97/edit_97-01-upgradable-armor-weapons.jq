#!jq

# This is a jq (https://jqlang.org/) script to edit the data.cdb file of a
# Wartales game definition file.

# This tries to duplicate part of
#   https://www.nexusmods.com/wartales/mods/97

#
# Make most weapons and armor upgradable.  Not unlootable items and not those
# only available from a cheat menu, such as Rare and Legendary items from Pit.
# I don't know why not to allow those be upgradable.
#

( .sheets[] | select(.name == "item") | .lines[]
  | select( .type | IN(

    # uses .type not .parentType
    # .parentType is for .name=="itemType"

    # "AnimalAccessory" ,
    # "Armor" ,
      "ArmorHeavy" ,
    # "ArmorLayer" ,
      "ArmorLight" ,
      "ArmorMedium" ,
      "Axe" ,
      "Axe2H" ,
    # "Ballista" ,
      "Bow" ,
      "Crossbow" ,
      "Dagger" ,
      "FistWeapon" ,
    # "Helmet" ,
      "HelmetHeavy" ,
      "HelmetLight" ,
      "HelmetMedium" ,
      "HorseArmor" ,
    # "LeftHand" ,
      "Mace" ,
      "Mace2H" ,
      "Polearm" ,
      "Shield" ,
      "Sword" ,
      "Sword2H"
      )
    )

  # "Unco" means uncommon, as in less rare than "Rare".
  # Base things have disableLoot=true
  #     and (.id | test("Base$") | not )
  # Pit things have disableLoot=true
  #     and (.id | test("RarePit\\d$") | not )
  #     and (.id | test("LegendaryPit\\d$") | not )

  .props | select(
        .hideInCheatMenu != true
    and .disableLoot != true
    )
  .flags
  )=128

## 129 was probably a typo in mod 97
#|
#( .sheets[] | select(.name == "item") | .lines[]
#  | select(
#      .id == "HeavyArmorCommonGeneric"
#    )
#  .props
#  .flags
#  )=129

