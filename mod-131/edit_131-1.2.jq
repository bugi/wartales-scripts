#!jq

# v1.2 Making the 8 title tomb puzzle super easy
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

