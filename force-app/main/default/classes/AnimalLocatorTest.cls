@isTest
public with sharing class AnimalLocatorTest {
    @isTest static void testPostCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        Test.startTest();
            AnimalLocator.getAnimalNameById(2);
        Test.stopTest();
    }
}