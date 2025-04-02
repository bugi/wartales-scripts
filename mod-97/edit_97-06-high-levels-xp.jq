#!jq

# This is a jq (https://jqlang.org/) script to edit the data.cdb file of a
# Wartales game definition file.

# This tries to duplicate part of
#   https://www.nexusmods.com/wartales/mods/97

( .sheets[] | select(.name == "constant") | .lines[]
  | select(.id == "MaxLevelLock")
  | .value
  ) = 30

|
( .sheets[] | select(.name == "constant") | .lines[]
  | select(.id == "MaxLevelGroups")
  | .valueDifficulty[]
  | select( .difficulty | IN(0,1,2) )
  | .value
  ) = 31
|
( .sheets[] | select(.name == "constant") | .lines[]
  | select(.id == "MaxLevelGroups")
  | .valueDifficulty[]
  | select(.difficulty == 3)
  | .value
  ) = 32

|
( .sheets[] | select(.name == "constant") | .lines[]
  | select(.id == "LevelXpValues")
  | .values
  ) =
[
  { "value": 0 },
  { "value": 100 },   # 200
  { "value": 135 },   # 260
  { "value": 183 },   # 580
  { "value": 248 },   # 980
  { "value": 337 },   # 1430
  { "value": 456 },   # 1810
  { "value": 618 },   # 2070
  { "value": 838 },   # 2170
  { "value": 1136 },  # 2270
  { "value": 1539 },  # 2370
  { "value": 2086 },  # 2470
  { "value": 2827 },  # 2570
  { "value": 3830 },  # 2670
  { "value": 5190 },  # 2770
  { "value": 7033 },
  { "value": 9529 },
  { "value": 12913 },
  { "value": 17497 },
  { "value": 23708 },
  { "value": 32125 },
  { "value": 43529 },
  { "value": 58982 },
  { "value": 79921 },
  { "value": 108293 },
  { "value": 146738 },
  { "value": 198830 },
  { "value": 269414 },
  { "value": 365057 },
  { "value": 494652 },
  { "value": 670254 }
]

