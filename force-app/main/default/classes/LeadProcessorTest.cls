@isTest
public with sharing class LeadProcessorTest {
    static testMethod void leadProcessor() {
        List<Lead> ldList = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            ldList.add(new Lead(lastName = 'Lead' + i, company='Company' + i));
        }
        Insert ldList;
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id jobId = Database.executeBatch(lp);
        Test.stopTest();
        system.assertequals(0, [select count() from lead where leadsource <> 'Dreamforce']);
    }
}