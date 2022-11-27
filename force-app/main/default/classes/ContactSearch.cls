public with sharing class ContactSearch {
    public static List<Contact> searchForContacts(String lName, String pCode) {
        List<Contact> cList = [select Id, Name from Contact where lastname=:lName and MailingPostalCode=:pCode LIMIT 200];
        return cList;
    }
}