trigger OrderEventTrigger on Order_Event__e (after insert) {
    List<Task> tskList = new List<Task>();
    for (Order_Event__e ordEvent : Trigger.new) {
        if (ordEvent.Has_Shipped__c == true) {
            tskList.add(new Task(Priority='Medium', Subject='Follow up on shipped order ' + ordEvent.Order_Number__c, OwnerId=ordEvent.CreatedById));
        }
    }
    if (null != tskList && tskList.size() > 0) {
        Insert tskList;
    }
}