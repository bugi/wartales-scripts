#!jq

# This is a jq (https://jqlang.org/) script to edit the data.cdb file of a
# Wartales game definition file.

# This tries to duplicate part of
#   https://www.nexusmods.com/wartales/mods/97

#
# implement bolas
#

( .sheets[] | select(.name=="item") | .lines ) +=
[
  {
    "id": "PowerfulBackhandManual",
    "name": "",
    "weight": 0.5,
    "baseBonus": [],
    "props": {
      "disableLoot": true,
      "special": 2,
      "skill": "PowerfulBackhand",
      "flags": 64
    },
    "icon": {
      "file": "ui/Icons_Resources.png",
      "size": 96,
      "x": 1,
      "y": 8
    },
    "type": "SkillManual",
    "price": 300,
    "rarity": 2,
    "iconeDone": true,
    "done": 2
  },
  {
    "id": "RiposteManual",
    "name": "",
    "weight": 0.5,
    "baseBonus": [],
    "props": {
      "disableLoot": true,
      "special": 2,
      "skill": "LightHelmetGuard",
      "flags": 64
    },
    "icon": {
      "file": "ui/Icons_Resources.png",
      "size": 96,
      "x": 1,
      "y": 8
    },
    "type": "SkillManual",
    "price": 300,
    "rarity": 2,
    "iconeDone": true,
    "done": 2
  },
  {
    "id": "RingLeaderThreatManual",
    "name": "",
    "weight": 0.5,
    "baseBonus": [],
    "props": {
      "disableLoot": true,
      "special": 2,
      "skill": "RingleaderThreat",
      "flags": 64
    },
    "icon": {
      "file": "ui/Icons_Resources.png",
      "size": 96,
      "x": 1,
      "y": 8
    },
    "type": "SkillManual",
    "price": 300,
    "rarity": 2,
    "iconeDone": true,
    "done": 2
  },
  {
    "id": "RaidExperienceManual",
    "name": "",
    "weight": 0.5,
    "baseBonus": [],
    "props": {
      "disableLoot": true,
      "special": 2,
      "skill": "RaidExperience",
      "flags": 64
    },
    "icon": {
      "file": "ui/Icons_Resources.png",
      "size": 96,
      "x": 1,
      "y": 8
    },
    "type": "SkillManual",
    "price": 300,
    "rarity": 2,
    "iconeDone": true,
    "done": 2
  },
  {
    "id": "SurvivalStrategyManual",
    "name": "",
    "weight": 0.5,
    "baseBonus": [],
    "props": {
      "disableLoot": true,
      "special": 2,
      "skill": "SurvivalStrategy",
      "flags": 64
    },
    "icon": {
      "file": "ui/Icons_Resources.png",
      "size": 96,
      "x": 1,
      "y": 8
    },
    "type": "SkillManual",
    "price": 300,
    "rarity": 2,
    "iconeDone": true,
    "done": 2
  }
]


|
( .sheets[] | select(.name=="craft") | .lines ) +=
[
  {
    "item": "RingLeaderThreatManual",
    "tool": "Workshop",
    "recipe": [
      {
        "qty": 1,
        "item": "Knowledge"
      }
    ],
    "props": {},
    "learnCost": [
      {
        "qty": 5,
        "item": "Knowledge"
      }
    ],
    "jobLevel": 1,
    "group": "TinkererVarious"
  },
  {
    "item": "RaidExperienceManual",
    "tool": "Workshop",
    "recipe": [
      {
        "qty": 1,
        "item": "Knowledge"
      }
    ],
    "props": {},
    "learnCost": [
      {
        "qty": 5,
        "item": "Knowledge"
      }
    ],
    "jobLevel": 1,
    "group": "TinkererVarious"
  },
  {
    "item": "SurvivalStrategyManual",
    "tool": "Workshop",
    "recipe": [
      {
        "qty": 1,
        "item": "Knowledge"
      }
    ],
    "props": {},
    "learnCost": [
      {
        "qty": 5,
        "item": "Knowledge"
      }
    ],
    "jobLevel": 1,
    "group": "TinkererVarious"
  }
]

