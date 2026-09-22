Feature: RimScent Decay Expansion loads without optional integrations

  Scenario: the minimal dependency set loads every owned scent definition
    Given the save "test-colony" is loaded
    Then mod "nelim.rimscent.extended.decay" is loaded
    And def "RimScentExtended_Scent_CorpseFresh" of type "ThoughtDef" exists
    And def "RimScentExtended_Scent_CorpseRotting" of type "ThoughtDef" exists
    And def "RimScentExtended_Scent_CorpseDessicated" of type "ThoughtDef" exists
    And def "RimScentExtended_Scent_Fever" of type "ThoughtDef" exists
    And def "RimScentExtended_Scent_Infection" of type "ThoughtDef" exists
    And def "RimScentExtended_Scent_RottenFood" of type "ThoughtDef" exists
    And def "RimScentExtended_Scent_Sickroom" of type "ThoughtDef" exists
    And no errors were logged
