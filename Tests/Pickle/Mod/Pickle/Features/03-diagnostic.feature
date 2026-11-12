@requires:nelim.pickletools.colonistrace
Feature: RimScent Decay Expansion diagnostic of the red scent scenarios

  Background:
    Given the save "test-colony" is loaded
    Then mod "nelim.rimscent.extended.decay" is loaded

  Scenario: D1 a dessicated corpse, thoughts listed
    Given Nelim's Pickle Tools: a dessicated corpse of the kind "Colonist" is placed at (109, 204)
    When I wait 600 ticks
    Then Nelim's Pickle Tools: "Larson" has the thought "RimScentExtended_Scent_CorpseDessicated"

  Scenario: D2 a feverish neighbour, thoughts listed
    Given Nelim's Pickle Tools: "Jet" has the hediff "Flu"
    And Nelim's Pickle Tools: "Jet" stands next to "Larson"
    When I wait 600 ticks
    Then Nelim's Pickle Tools: "Larson" has the thought "RimScentExtended_Scent_Fever"
