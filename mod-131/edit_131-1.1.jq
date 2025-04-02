#!jq

# v1.1 money laundering
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

# v1.1 mining
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "MiningRangeTorusMin")
  | .value
  ) = 1
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "MiningRangeTorusMax")
  | .value
  ) = 1

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
