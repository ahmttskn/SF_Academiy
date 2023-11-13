public with sharing class Students_SF {

    //AccessModifier DataType variableName;
    public static String firstName;
    public static String lastName;
    public static Integer year;
    public static String major;   

    //AccessModifier returnType methodName
    public static String generateReport(){        
        System.debug('Report Generated for '+firstName+' '+lastName+' of '+year);
        return major;
    } 
    
}