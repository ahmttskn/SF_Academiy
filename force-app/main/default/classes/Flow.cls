public with sharing class Flow {
    
    @InvocableMethod(label='Bu bir deneme classı dır' 
    description='Returns the list of account names corresponding to the specified account IDs.' 
    category='Account')
    public static List<String> getAccountNames(List<ID> ids) {
        List<string> name = new List<string>();
        System.debug('Ben calistim');
        return name;
    }
}