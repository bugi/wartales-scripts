#!jq

# This is a jq (https://jqlang.org/) script to edit the data.cdb file of a
# Wartales game definition file.

# This tries to duplicate part of
#   https://www.nexusmods.com/wartales/mods/97

# TavernFoodProduction = 10000
( .sheets[] | select(.name == "trait")
  | .lines[]
  | select(.id == "Cook")
  | .props.tavern.levels[]
  | .bonuses[] | select(.bonus == "TavernFoodProduction")
  .value
  )=10000

# Bard TavernComfort = 10000
|
( .sheets[] | select(.name == "trait")
  | .lines[]
  | select(.id == "Bard")
  | .props.tavern.levels[]
  | .bonuses[] | select(.bonus == "TavernComfort")
  .value
  )=10000

# Brewer TavernAlcoholProduction = 10000
|
( .sheets[] | select(.name == "trait")
  | .lines[]
  | select(.id == "Brewer")
  | .props.tavern.levels[]
  | .bonuses[] | select(.bonus == "TavernAlcoholProduction")
  .value
  )=10000

