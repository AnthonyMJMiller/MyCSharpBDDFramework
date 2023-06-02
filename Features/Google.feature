Feature: Random Google Tests

@smoke
Scenario Outline: Verify search box accepts alphanumeric characters
	Given I am on Google
	When I click on the search box
	Then I verify that I can type alphanumeric <characters>

	Examples: 
	| characters      |
	| asjkbvuig649857 |
	| alkjbvuygrej875 |
	| jguykuoo786348g |
	| yiuh89iuhg54jbh |