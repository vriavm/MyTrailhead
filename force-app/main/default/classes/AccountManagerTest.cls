@isTest
global with sharing class AccountManagerTest {
    @istest static void testgetAccount() {
        //ID thisAccountId = AccountManager.createAccount('IntelliCorp 1');
        Account act = new Account(name = 'AccountManagerTest IntelliComp');
        Insert act;
        ID thisAccountId  = act.Id;
        Contact c = new Contact (lastname='THAccountManagerTest', email='THAccountManagerTest@campaigmonitor.com', accountid=thisAccountId);
        Insert c;
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://cunning-moose-ty77qk-dev-ed.my.salesforce.com/services/apexrest/Accounts/'
            + thisAccountId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account result = AccountManager.getAccount();
        System.assertEquals(result.Id, thisAccountId);       
    }

    /*@istest static void testcreateAccount() {
        ID thisAccountId = AccountManager.createAccount('IntelliCorp 1');
        Account act = [select name from Account where id = :thisAccountId];
        system.assertEquals('IntelliCorp 1', act.Name);
    }*/
}