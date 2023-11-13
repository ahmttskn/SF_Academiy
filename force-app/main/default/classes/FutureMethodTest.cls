public with sharing class FutureMethodTest {

    @future
    public static void name() {
        System.debug('Test');
    } 

    @future
    public static void name2() {
        System.debug('Test2');
        System.debug('Test');

    } 
    
    @future
    public static void name3() {
        System.debug('Test3');
    }
    
    @future
    public static void name4() {
        System.debug('Test4');
    } 
}