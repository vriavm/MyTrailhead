@isTest
public with sharing class TestVerifyDate {
    static testMethod void VerifyDate() {
        Test.startTest();
            // valid dates within 30 range
            VerifyDate.CheckDates(System.today(), System.today().addDays(5));
            // valid dates out of range
            VerifyDate.CheckDates(System.today(), System.today().addDays(35));
            // Invalid dates
            VerifyDate.CheckDates(System.today().addDays(5), System.today());
            // Invalid dates - Null values
            /*VerifyDate.CheckDates(null, System.today());
            VerifyDate.CheckDates(System.today(), null);
            VerifyDate.CheckDates(null, null);*/
        Test.stopTest();
    }
}