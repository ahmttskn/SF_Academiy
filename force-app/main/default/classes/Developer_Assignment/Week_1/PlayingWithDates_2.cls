public with sharing class PlayingWithDates_2 {
    public void printDateOutput(){
        //today date
        date todayDate = Date.today();
        System.debug('Bugunun tarihi => ' + todayDate);
        //Create an instance of a date for 5th November 2789.
        Date newDate1 = Date.newInstance(2789, 11, 5);
        System.debug('newDate1 => ' + newDate1);
        //Create an instance of a date for 4th March 1459. 
        Date newDate2 = Date.newInstance(1459, 3, 4);
        System.debug('newDate2 => ' + newDate2);

        //System.debug('newDate2 => ' + Date.newInstance(1459, 3, 4));
        /*Create three Integer variables (dayInt, monthInt, yearInt) for storing day, month, year 
respectively and provide some default values in them.*/
        integer dayInt = 15;
        integer monthInt = 6;
        integer yearInt = 1999;

        Date newDate3 = date.newInstance(yearInt, monthInt, dayInt);
        System.debug('newDate3 => ' + newDate3);

        //Print the date which is exactly 67 days after today
        date newDate4 = Date.today().addDays(67);
        System.debug('newDate4 => ' + newDate4);

        //Find and print a date which was exactly 7 months earlier than today. 
        date newDate5 = Date.today().addMonths(-7);
        System.debug('newDate5 => ' + newDate5);

        // Find and print a date which was exactly 895 days earlier than today. 
        date newDate6 = Date.today().addDays(-895);
        System.debug('newDate6 => ' + newDate6);
        //Find and print a date which was exactly 59 years earlier than today.
        date newDate7 = Date.today().addYears(-59);
        System.debug('newDate7 => ' + newDate7);
        //Print the date which is exactly 278 years after today
        date newDate8 = Date.today().addYears(278);
        System.debug('newDate8 => ' + newDate8);
    }
}