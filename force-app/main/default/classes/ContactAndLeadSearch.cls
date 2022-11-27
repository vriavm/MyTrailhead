public with sharing class ContactAndLeadSearch {
    public static List<List<Sobject>>  searchContactsAndLeads(String input) {
        Contact c = new Contact(lastname='Smith');
        insert c;
        Lead l = new Lead(lastname='Smith', company='company', email='ContactAndLeadSearch1984@gmail.com');
        insert l;
        //input = '*' + input + '*';
        List<List<Sobject>> srchResult = [FIND :input IN ALL Fields Returning Contact(FirstName, LastName), Lead(FirstName, LastName)];
        return srchResult;
    }
}