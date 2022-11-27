@isTest
public with sharing class TestRestrictContactByName {
    static testMethod void restrictContactByName() {
        Test.startTest();
            Contact c = new Contact(LastName='TestRestrictContactByName');
            Database.SaveResult result = Database.Insert(c, false);


            Contact c1= new Contact(LastName = 'INVALIDNAME');
            Database.SaveResult insResult = Database.Insert(c1, false);


            c.LastName = 'INVALIDNAME';
            Database.SaveResult updtResult = Database.Update(c, false);
        Test.stopTest();

        System.assert(result.isSuccess());

        System.assert(!insResult.isSuccess());
        System.assert(insResult.getErrors().size() > 0);
        System.assertEquals(insResult.getErrors()[0].getMessage(), 'The Last Name "' + c1.LastName + '" is not allowed for DML');

        System.assert(!updtResult.isSuccess());
        System.assert(updtResult.getErrors().size() > 0);
        System.assertEquals(updtResult.getErrors()[0].getMessage(), 'The Last Name "' + c.LastName + '" is not allowed for DML');            
    }
}