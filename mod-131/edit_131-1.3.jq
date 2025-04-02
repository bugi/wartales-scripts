#!jq

# v1.3 Drinking buddies and Misanthropic Troop only costs 30 (from 300) influence (search for DrinkMate, MisanthropicTroop)
( .sheets[] | select(.name == "bonus")
  | .lines[]
  | select(.id == "DrinkMate" or .id == "MisanthropicTroop" )
  | .props.fixedValue
  ) = 30

# v1.3 mission negotiation
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "MissionNegociationProbabilityInitialCursor")
  | .value
  ) = 100
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "MissionNegociationProbabilityDecrement")
  | .value
  ) = 0
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "MissionNegociationInfluenceChancePow")
  | .value
  ) = 1
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "MissionNegociationGoldMalus")
  | .value
  ) = 0

