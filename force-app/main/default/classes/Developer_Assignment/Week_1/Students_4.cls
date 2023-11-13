public with sharing class Students_4 {
    public String firstName;
    public String lastName;
    public Integer year;
    public String major;
    
    public String generateReport(){
        System.debug('Report Generated for '+firstName+' '+lastName+' of '+year);
        return major;
    }
}