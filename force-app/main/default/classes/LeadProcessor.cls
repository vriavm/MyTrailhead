public class LeadProcessor implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.Batchablecontext bc) {
        return Database.getQueryLocator('select id, leadsource from Lead');
    }

    public void execute (Database.Batchablecontext bc, List<Lead> scope) {
        for (Lead ld : scope) {
            ld.LeadSOurce = 'Dreamforce';
        }
        Update scope;
    }

    public void finish(Database.Batchablecontext bc) {

    }
}