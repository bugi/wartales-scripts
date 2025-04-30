#!jq

# This is a jq (https://jqlang.org/) script to edit the data.cdb file of a
# Wartales game definition file.

# This tries to duplicate part of
#   https://www.nexusmods.com/wartales/mods/97

#
# implement bolas
# 2025-04-06 -- In game, these are listed literally instead of the referenced strings:
# * #item.CaptureBolas.name
# * #item.CaptureBolas.desc
# * #skill.BeltAccHunt_Master.name
#

( .sheets[] | select(.name=="item") | .lines ) += [
{
  "id": "CaptureBolas",
  "name": "Bolas",
  "weight": 1,
  "baseBonus": [],
  "props": {
    "disableLoot": true,
    "skill": "BeltAccHunt_Master"
  },
  "icon": {
    "file": "ui/Icons_Resources.png",
    "size": 96,
    "x": 6,
    "y": 12
  },
  "type": "BeltAccessory",
  "desc": "A bolas that can be thrown to your enemies and capture them without fail.",
  "rarity": 2,
  "price": 100,
  "iconeDone": true,
  "done": 2
}
]

|
( .sheets[] | select(.name=="craft") | .lines ) += [
{
  "item": "CaptureBolas",
  "tool": "Workshop",
  "recipe": [
    {
      "qty": 3,
      "item": "Sandstone"
    },
    {
      "qty": 2,
      "item": "Rope"
    }
  ],
  "props": {},
  "learnCost": [
    {
      "qty": 1,
      "item": "Knowledge"
    }
  ],
  "jobLevel": 1,
  "group": "TinkererBelt"
}
]

|
( .sheets[] | select(.name=="skill") | .lines ) += [
{
  "id": "BeltAccHunt_Master",
  "name": "Bolas Mastery",
  "desc": "Capture any target.",
  "mode": 1,
  "range": {
    "baseDistance": 6
  },
  "props": {
    "specialAnim": "Throw",
    "apCost": 2
  },
  "script": "\n                function onSkill() {\n                    for (t in skill.getTargets()){\n                        captureTarget(t);\n                    }\n                    allowReplay();\n                }\n            ",
  "notes": "",
  "done": 1,
  "iconeDone": true,
  "icon": {
    "file": "ui/Icons/BattleIcons_03_96PX.png",
    "size": 96,
    "x": 1,
    "y": 6
  }
}
]

