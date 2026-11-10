@requires:nelim.pickletools.colonistrace
Feature: RimScent Decay Expansion scent thoughts reach a colonist

  Background:
    Given the save "test-colony" is loaded
    Then mod "nelim.rimscent.extended.decay" is loaded

  Scenario: S1 a fresh corpse beside a colonist gives the fresh corpse thought
    Given Nelim's Pickle Tools: a fresh corpse of the kind "Colonist" is placed at (109, 204)
    When I wait 600 ticks
    Then Nelim's Pickle Tools: "Larson" currently feels the mood thought "RimScentExtended_Scent_CorpseFresh"

  Scenario: S1 a rotting corpse beside a colonist gives the rotting corpse thought
    Given Nelim's Pickle Tools: a rotting corpse of the kind "Colonist" is placed at (109, 204)
    When I wait 600 ticks
    Then Nelim's Pickle Tools: "Larson" currently feels the mood thought "RimScentExtended_Scent_CorpseRotting"

  Scenario: S1 a dessicated corpse beside a colonist gives the dessicated corpse thought
    Given Nelim's Pickle Tools: a dessicated corpse of the kind "Colonist" is placed at (109, 204)
    When I wait 600 ticks
    Then Nelim's Pickle Tools: "Larson" currently feels the mood thought "RimScentExtended_Scent_CorpseDessicated"

  Scenario: S3 spoiled food beside a colonist gives the rotten food thought
    Given Nelim's Pickle Tools: the thing "MealSimple" is placed at (109, 204) at 1 of its time to rot
    When I wait 600 ticks
    Then Nelim's Pickle Tools: "Larson" currently feels the mood thought "RimScentExtended_Scent_RottenFood"

  Scenario: S4 a feverish neighbour gives the fever thought
    Given Nelim's Pickle Tools: "Jet" has the hediff "Flu"
    And Nelim's Pickle Tools: "Jet" stands next to "Larson"
    When I wait 600 ticks
    Then Nelim's Pickle Tools: "Larson" currently feels the mood thought "RimScentExtended_Scent_Fever"

  Scenario: S5 an infected neighbour gives the infection thought
    Given Nelim's Pickle Tools: "Jet" has the hediff "WoundInfection"
    And Nelim's Pickle Tools: "Jet" stands next to "Larson"
    When I wait 600 ticks
    Then Nelim's Pickle Tools: "Larson" currently feels the mood thought "RimScentExtended_Scent_Infection"
