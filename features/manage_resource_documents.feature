@resource_documents
Feature: Resource Documents
  In order to have resource_documents on my website
  As an administrator
  I want to manage resource_documents

  Background:
    Given I am a logged in refinery user
    And I have no resource_documents

  @resource_documents-list @list
  Scenario: Resource Documents List
   Given I have resource_documents titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of resource_documents
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @resource_documents-valid @valid
  Scenario: Create Valid Resource Document
    When I go to the list of resource_documents
    And I follow "Add New Resource Document"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 resource_document

  @resource_documents-invalid @invalid
  Scenario: Create Invalid Resource Document (without name)
    When I go to the list of resource_documents
    And I follow "Add New Resource Document"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 resource_documents

  @resource_documents-edit @edit
  Scenario: Edit Existing Resource Document
    Given I have resource_documents titled "A name"
    When I go to the list of resource_documents
    And I follow "Edit this resource_document" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of resource_documents
    And I should not see "A name"

  @resource_documents-duplicate @duplicate
  Scenario: Create Duplicate Resource Document
    Given I only have resource_documents titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of resource_documents
    And I follow "Add New Resource Document"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 resource_documents

  @resource_documents-delete @delete
  Scenario: Delete Resource Document
    Given I only have resource_documents titled UniqueTitleOne
    When I go to the list of resource_documents
    And I follow "Remove this resource document forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 resource_documents
 