Feature:  Update user personal information 

    Scenario Outline: User can update and save their personal information data 
        Given I have "userPicture" on the home tab 
        # And  I want to update my personal information details 
        When I tap on the "userPicture" on the app bar 
        And  I tap on "userProfile" from the side navigation menu
        And I edit the <field> field on the tab
        Then the <user_input> information on the personal tab should be visible 
        Examples:
            | field                     | user_input                    |
            | name                      | John Smith                    |
            | date_of_birth             | 1900-00-00                    |
            | gender                    | male_or_female                |
            | contact_number            | +2547201231516                |
        