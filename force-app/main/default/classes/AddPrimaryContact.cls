public class AddPrimaryContact implements Queueable {
    Private Contact c;
    Private String state;
    public AddPrimaryContact(Contact c, String state) {
        this.c = c;
        this.state = state;
    }
    public void execute(QueueableContext context) {
        List<Contact> cnctList = new List<Contact>();
        Contact con;
        for (Account act : [select id from Account where billingstate=:state]) {
            con = c.clone(false, true, false, false);
            con.AccountId = act.id;
            cnctList.add(con);
        }
        if (cnctList <> null && cnctList.size() > 0) {
            Insert cnctList;
        }
    }
}