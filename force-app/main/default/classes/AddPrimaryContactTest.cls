@isTest
public class AddPrimaryContactTest {
    static testMethod void addPrimaryContact() {
        List<Account> actList = new List<Account>();
        for (Integer i=1; i<=100; i++) {
            if (i <= 50) {
                actList.add(new Account(name='Test Account' + i, billingstate='CA'));
            }
            else {
                actList.add(new Account(name='Test Account' + i, billingstate='NY'));
            }
        }
        Insert actList;
        Contact c = new Contact(lastname='ContactForAccount');
        AddPrimaryContact apc = new AddPrimaryContact(c, 'CA');
        Test.startTest();
        Id jobId = System.enqueueJob(apc);
        Test.stopTest();
        System.assertEquals(50, [select count() from Contact where Account.Billingstate = 'CA']);
    }
}