public with sharing class AccountProcessor {
    @future
    public static void countContacts(List<Id> acctIds) {
        List<Account> actUpdate = new List<Account>();
        for (Account act : [select id, (select id from contacts) from Account where id IN :acctIds]) {
            actUpdate.add(new Account(Id=act.Id, Number_of_Contacts__c=((act.contacts == null)?0:act.contacts.size())));
        }
        if (null <> actUpdate && actUpdate.size() > 0) {
            Update actUpdate;
        }
    }
}