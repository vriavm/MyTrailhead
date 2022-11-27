@isTest
public with sharing class AccountProcessorTest {
    static testMethod void accountProcessor() {
        List<Account> actList = new List<Account>();
        actList.add(new Account(Name='Test Account 1'));
        actList.add(new Account(Name='Test Account 2'));
        actList.add(new Account(Name='Test Account 3'));
        Insert actList;
        List<Contact> cnctList = new List<Contact>();
        cnctList.add(new Contact(lastName='Test Contact 1 for Account 2', AccountId=actList[1].Id));
        cnctList.add(new Contact(lastName='Test Contact 1 for Account 3', AccountId=actList[2].Id));
        cnctList.add(new Contact(lastName='Test Contact 2 for Account 3', AccountId=actList[2].Id));
        Insert cnctList;
        List<Id> accountIds = new List<Id>();
        accountIds.add(actList[0].Id);
        accountIds.add(actList[1].Id);
        accountIds.add(actList[2].Id);        
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();
        for (Account act : [select id, Number_of_Contacts__c, (select id from contacts) from Account where id IN :accountIds]) {
            System.assertequals(act.Number_of_Contacts__c, (act.contacts == null)?0:act.contacts.size());
        }
    }
}