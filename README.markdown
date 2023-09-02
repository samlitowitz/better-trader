# Dynamic cooldown list

Match defensives to offensives based on the situation.
Tell player if they should expect healer cds.
Tell player if they should use their cds.
Tell teammate if they should expect healer cds.
Tell teammate if they should use their cds.

## preparation

1. offensive spells available to enemy team
2. defensive spells available to player and teammates

## dynamic list

1. offensive spell in use
2. defensive cooldowns available to player and teammates

# Addon

## Profiles

1. Store changes to cooldown defaults
   1. cooldown disabled
   2. changes to duration
   3. changes to charges

## Design

1. Default, all cooldowns enabled
2. Profiles

## QOL

1. location to be moveable
2. offensive and defensive cds/cd customizable by spec
3. option to only include player defensives (skip/ignore teammates)
4. test mode
   1. pick offensive cd(s) to be "used"
   2. set defensive cd(s) to be available (default to players class + current trinket(s))

# How do I choose what defensive to use for an offensive?

For brevity, DCD is used to refer to a defensive cooldown and OCD is used to refer to the offensive cooldown.

## Static Analysis

1. Can this DCD prevent damage of type the done or enabled by the OCD?
   1. Damage type done or enabled by OCD, damage type affected by DCD
2. Relationship between the duration of OCD and duration of DCD
3. Relationship between the CD or the OCD and the CD of the DCD
   1. What is the LCM of the OCD and the DCD?

## Dynamic Analysis

1. Can the player use the DCD?
   2. Is a charge available
2. Is the DCD on cooldown?
   1. How long is the remaining cooldown?
3. See static analysis

# ...

offensive cd > [defensive cd]

track active offensive cd's, show corresponding defensive cds to use (match based on cooldown length and availability,
is it off cd)
match for you
from prepared list (you build it this shows it)

This is big WIP, subject to change at any time

1. Display buttons in tiers by CD
2. Allow customization of spells and CDs
3. Allow CD matching to be displayed

# References

1. https://old.reddit.com/r/worldofpvp/comments/15tt3nk/need_help_with_learning_offensive_cds_1_per_spec/
2. https://wowpedia.fandom.com/wiki/World_of_Warcraft_API
3. https://www.townlong-yak.com/framexml/live/Blizzard_APIDocumentation
4. https://www.wowace.com/projects/ace3/pages/getting-started
5. https://wowpedia.fandom.com/wiki/SpecializationID
