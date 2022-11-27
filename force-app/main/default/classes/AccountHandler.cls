public with sharing class AccountHandler {
    public static void insertAccount(Integer noOfAccts) {
        //try { 
            List<Account> addAccounts = new  List<Account>();
            Integer i = 0;
            While (i < noOfAccts) {
                addAccounts.add(new Account(Name = 'Acme Inc ' + i, AccountNumber = 'A000' + i));
                i++;
            }
            Insert addAccounts;
        /*}
        Catch (Exception e) {
            //return null;
        }*/
    }
}