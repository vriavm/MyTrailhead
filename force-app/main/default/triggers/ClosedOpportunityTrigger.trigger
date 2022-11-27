trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    Set<Id> OpptyIdsForTask = new Set<Id>();
    List<Task> taskList = new List<Task>();
    if (Trigger.isInsert) {
        for (Opportunity opp : Trigger.new) {
            if (null <> opp.StageName && opp.StageName == 'Closed Won') {
                OpptyIdsForTask.add(opp.Id);
            }
        }
    }
    if (Trigger.isUpdate) {
        for (Opportunity opp : Trigger.new) {
            if (null <> opp.StageName && opp.StageName == 'Closed Won' && Trigger.oldMap.get(opp.Id).StageName <> opp.StageName) {
                OpptyIdsForTask.add(opp.Id);
            }
        }
    }
    if (null <> OpptyIdsForTask && OpptyIdsForTask.size() > 0) {
        for (Id oppid : OpptyIdsForTask) {
            taskList.add(new Task(Subject='Follow Up Test Task', WhatId=oppid));
        }
    }

    if (null <> taskList && taskList.size() > 0) {
        Insert taskList;
    }
}