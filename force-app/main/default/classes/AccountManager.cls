@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest req = RestContext.request;
        String accountId = req.requestURI.substringBetween('Accounts/', '/contacts');
        Account result =  [SELECT Name,Id, (select id, name from contacts)
                          FROM Account
                         WHERE Id = :accountId];
        return result;
    }

    /*@HttpPost
    global static ID createAccount(String name) {
        Account thisAccount = new Account(
            Name=name);
        insert thisAccount;
        return thisAccount.Id;
    }  */ 
}