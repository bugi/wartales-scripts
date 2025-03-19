#!jq

# This is a jq (https://jqlang.org/) script to edit the data.cdb file of a
# Wartales game definition file.

# Put this in a file called "edit.jq" then run it like this:
#   jq --tab -f edit.jq < v1.0.40128/data.cdb > new-data.cdb
# "v1.0.40128/data.cdb" is the input file.
# "new-data.cdb" is the output file.

# The initial script is to emulate v1.7 of Wartales mod 131:
#   https://www.nexusmods.com/wartales/mods/131



#
# v1.0
#

# v1.0 PlayerBaseSpeed
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "PlayerBaseSpeed")
  | .value
  ) = 15

# v1.0 PlayerRunSpeed
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "PlayerRunSpeed")
  | .value
  ) = 20

# v1.0 Ambush
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "RoamingAmbushCloseDetection")
  | .value
  ) = 0
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "RoamingAmbushEnterForest")
  | .value
  ) = 45000
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "PlayerAmbushRadius")
  | .value
  ) = 2000
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "PlayerAmbushDelay")
  | .value
  ) = 0
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "PlayerAmbushRunDurationFactor")
  | .value
  ) = 150

# v1.0 run stamina skipped because it is changed in v1.4

# v1.0 horse pack  10 -> 2000 carry (search for "Fontes")
|
( .sheets[] | select(.name == "item")
  | .lines[]
  | select(.id == "AnimAccCarriage")
  | .baseBonus[] | select(.attribute == "Transport")
  | .value
  ) = 2000


#
# v1.1
#

# v1.1 money laundering
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "MoneyLaunderingBase")
  | .value
  ) = 100

# v1.1 gather refill
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "GatherRefillSlow")
  | .value
  ) = 1
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "GatherRefillNormal")
  | .value
  ) = 2
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "GatherRefillFast")
  | .value
  ) = 3
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "GatherRefillFactorExtreme")
  | .value
  ) = 4

# v1.1 merchant refill
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "MerchantRefillPerDaySlow")
  | .value
  ) = 1
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "MerchantRefillPerDayNormal")
  | .value
  ) = 5
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "MerchantRefillPerDayFast")
  | .value
  ) = 10
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "MerchantFullRefillDays")
  | .value
  ) = 1

# v1.1 mining skipped because it changed in v1.4

# v1.1 fishing
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "FishingDurationControl")
  | .value
  ) = 0.01

# v1.1 lockpicking
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "LockpickMinRangeRatio")
  | .value
  ) = 1
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "LockpickMaxRangeRatio")
  | .value
  ) = 1

# v1.1 forge heat, duration, timer
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "ForgeHeatSpeedIncreaseMin")
  | .value
  ) = 100
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "ForgeHeatSpeedIncreaseMax")
  | .value
  ) = 100
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "ForgeDurationPerfectHeatMin")
  | .value
  ) = 300
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "ForgeDurationPerfectHeatMax")
  | .value
  ) = 300
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "ForgeOverlapTimerMin")
  | .value
  ) = 0
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "ForgeOverlapTimerMax")
  | .value
  ) = 0


#
# v1.2
#

# v1.2 Making the 8 title tomb puzzle super easy
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "NinePuzzle_Start_MinShuffleMoves")
  | .value
  ) = 0
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "NinePuzzle_Start_MaxWellPlaceTiles")
  | .value
  ) = 8

# v1.2 Professions easy to level; JobXpLevels changed to minimal
|
( .sheets[] | select(.name == "constant")
  | .lines[] | select(.id == "JobXpLevels")
  | .values
  ) = [ { "value": 1 } , { "value": 2 } , { "value": 3 } , { "value": 4 } ]

# v1.2 Career Guidance cost 10 times less
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "ExtraAttributePoint_InfluenceCost")
  | .values
  ) = [ { "value": 1 } , { "value": 3 } ]


#
# v1.3
#

# v1.3 Drinking buddies and Misanthropic Troop only costs 30 (from 300) influence (search for DrinkMate, MisanthropicTroop)
|
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


#
# v1.4
#

# v1.4 CookingPot PerfectRecipe from 15,30 to 50,100 chance
|
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

# v1.1 mining
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

