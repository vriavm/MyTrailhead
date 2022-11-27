trigger AccountAddressTrigger on Account (before insert, before update) {
    for (Account act : Trigger.new) {
        if (act.BillingPostalCode <> null && act.Match_Billing_Address__c) {
            act.ShippingPostalCode = act.BillingPostalCode;
        }
    }
}