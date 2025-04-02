#!jq

# v1.4 CookingPot PerfectRecipe from 15,30 to 50,100 chance
( .sheets[] | select(.name == "item")
  | .lines[]
  | select(.id == "CookingPotT2") | .props.bonuses[] | select(.bonus == "PerfectRecipe")
  | .value
  ) = 50
|
( .sheets[] | select(.name == "item")
  | .lines[]
  | select(.id == "CookingPotT3") | .props.bonuses[] | select(.bonus == "PerfectRecipe")
  | .value
  ) = 100

# v1.4 prisoner escape
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "EscapeMalusAllyNextToPrisoner")
  | .value
  ) = -100
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "EscapeRadiusAllyNextToPrisoner")
  | .value
  ) = 100

# v1.4 run stamina
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "RunStaminaHours")
  | .value
  ) = 4
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "RunStaminaRecovery")
  | .value
  ) = 0.1
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "RunStaminaLowRecovery")
  | .value
  ) = 0.1

# v1.4 mining
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "MiningRangeTorusMin")
  | .value
  ) = 10
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "MiningRangeTorusMax")
  | .value
  ) = 10

