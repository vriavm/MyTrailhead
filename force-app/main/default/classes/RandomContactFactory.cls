public with sharing class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer count, String lastName) {
        List<Contact> returnList = new List<Contact>();
        for (Integer i = 1; i <= count; i++) {
            returnList.add(new Contact(FirstName='Test ' + i, LastName=lastname));
        }
        return returnList;
    }
}