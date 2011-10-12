@resource_categories
Feature: Resource Categories
  In order to have resource_categories on my website
  As an administrator
  I want to manage resource_categories

  Background:
    Given I am a logged in refinery user
    And I have no resource_categories

  @resource_categories-list @list
  Scenario: Resource Categories List
   Given I have resource_categories titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of resource_categories
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @resource_categories-valid @valid
  Scenario: Create Valid Resource Category
    When I go to the list of resource_categories
    And I follow "Add New Resource Category"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 resource_category

  @resource_categories-invalid @invalid
  Scenario: Create Invalid Resource Category (without title)
    When I go to the list of resource_categories
    And I follow "Add New Resource Category"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 resource_categories

  @resource_categories-edit @edit
  Scenario: Edit Existing Resource Category
    Given I have resource_categories titled "A title"
    When I go to the list of resource_categories
    And I follow "Edit this resource_category" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of resource_categories
    And I should not see "A title"

  @resource_categories-duplicate @duplicate
  Scenario: Create Duplicate Resource Category
    Given I only have resource_categories titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of resource_categories
    And I follow "Add New Resource Category"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 resource_categories

  @resource_categories-delete @delete
  Scenario: Delete Resource Category
    Given I only have resource_categories titled UniqueTitleOne
    When I go to the list of resource_categories
    And I follow "Remove this resource category forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 resource_categories
 