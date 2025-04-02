#!jq

# This is a jq (https://jqlang.org/) script to edit the data.cdb file of a
# Wartales game definition file.

# Use the apply_jq_to_res_pak.sh script to apply this file and its siblings
# to assemble a new res.pak file.

# At it's core, the apply_jq_to_res_pak.sh script does something
# like this in a loop:
#   jq --tab -f edit.jq < v1.0.40128/data.cdb > new-data.cdb



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

# v1.0 run stamina
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "RunStaminaHours")
  | .value
  ) = 2
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "RunStaminaRecovery")
  | .value
  ) = 0.5
|
( .sheets[] | select(.name == "constant")
  | .lines[]
  | select(.id == "RunStaminaLowRecovery")
  | .value
  ) = 1

# v1.0 horse pack  10 -> 2000 carry (search for "Fontes")
|
( .sheets[] | select(.name == "item")
  | .lines[]
  | select(.id == "AnimAccCarriage")
  | .baseBonus[] | select(.attribute == "Transport")
  | .value
  ) = 2000

