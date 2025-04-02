#!jq

# This is a jq (https://jqlang.org/) script to edit the data.cdb file of a
# Wartales game definition file.

# This tries to duplicate part of
#   https://www.nexusmods.com/wartales/mods/97

#
# add skills for the classes
#


( .sheets[] | select(.name == "unitClass") | .lines[]
  | select(.id | IN(
      "Arbalist",
      "Axeman",
      "Bowman",
      "Brute",
      "Pugilist",
      "Rogue",
      "Spearman",
      "Swordman"
      )
    )
  | .baseSkills ) +=
[
  {
    "skill": "OathOfTheCowards",
    "minLevel": 14
  },
  {
    "skill": "ThirstForFreedom",
    "minLevel": 14
  },
  {
    "skill": "ForcefulRelease",
    "minLevel": 14
  },
  {
    "skill": "SailorsPlacidity",
    "minLevel": 15
  },
  {
    "skill": "ChronicPyromany",
    "minLevel": 15
  },
  {
    "skill": "CloseRanks",
    "minLevel": 15
  },
  {
    "skill": "MilitaryFormation",
    "minLevel": 17
  },
  {
    "skill": "EliteMercenaries",
    "minLevel": 17
  },
  {
    "skill": "DishonorableTechnics",
    "minLevel": 17
  },
  {
    "skill": "Independence",
    "minLevel": 20
  },
  {
    "skill": "FervorOfTheLaw",
    "minLevel": 20
  },
  {
    "skill": "ExtremeResilience",
    "minLevel": 20
  },
  {
    "skill": "SuspiciousLuck",
    "minLevel": 22
  },
  {
    "skill": "AloneAgainstAll",
    "minLevel": 22
  },
  {
    "skill": "DuelScience",
    "minLevel": 22
  },
  {
    "skill": "ExhilaratingFervour",
    "minLevel": 25
  },
  {
    "skill": "Penance",
    "minLevel": 25
  },
  {
    "skill": "CritOnEngaged",
    "minLevel": 25
  },
  {
    "skill": "PowerfulBackhand",
    "minLevel": 30
  },
  {
    "skill": "LightHelmetGuard",
    "minLevel": 30
  },
  {
    "skill": "HeavyHelmetAlazar",
    "minLevel": 30
  }
]


# this makes all subclasses available at the beginning of the game
|
( .sheets[] | select(.name == "unitClass") | .lines[]
  | select(.id | IN(
      "ArbalistSpe04",
      "MasteringCrossbow",
      "Barbarian",
      "MasteringAxe",
      "Marksman",
      "MasteringBow",
      "Brawler",
      "MasteringMace",
      "Bully",
      "MasteringFist",
      "Assassin",
      "MasteringDagger",
      "Halberdier",
      "MasteringPolearm",
      "Duellist",
      "MasteringSword"
      )
    )
  | .props.flags
  )= 28
