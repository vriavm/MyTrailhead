@isTest
public class DailyLeadProcessorTest {
    static testMethod void dailyLeadProcessor() {
        String SCH = '0 0 0 5 1 ? 2021';
        DailyLeadProcessor dlp = new DailyLeadProcessor();
        List<lead> ldList = new List<lead>();
        for (Integer i=1; i<=200; i++) {
            ldList.add(new Lead(lastname='Test' + i, company='Company' + i));
        }
        Insert ldList;
        Test.startTest();
        System.Schedule('DailyLeadProcessorTest', SCH, dlp);
        Test.stopTest();
        System.assertequals(200, [select count() from Lead where LeadSOurce='Dreamforce' limit 200]);
    }
}