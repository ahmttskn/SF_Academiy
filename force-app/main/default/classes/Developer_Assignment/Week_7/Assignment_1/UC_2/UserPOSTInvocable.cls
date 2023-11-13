public with sharing class UserPOSTInvocable {
    @InvocableMethod(label='Send Data to POST'
                    description='Sending data from Flow to Rest API Callout'
                    category='Contact')
    public static void sendData(List<Id> conIdsFlow) {
        UsersPOSTCallout.createUsersPOST(conIdsFlow);
    }
}