public with sharing class SalesController {
    @AuraEnabled
    public static String initMethod(){

        SalesControllerW sc = new SalesControllerW();
        sc.bu = 'Commercial Operations';
        sc.bugraphData = '{ BU: \'Commercial Operations\', 2022: 0, 2023: 0 },\r\n{ BU: \'Australia\', 2022: 433062.47, 2023: 47219.56 },\r\n{ BU: \'Canada\', 2022: 522139.34, 2023: 54328.78 }';
        sc.buListFinal = new List<String>{'Global', 'Australia', 'Canada'};
        sc.lastYear = '2022';
        sc.PYTD = 2022;
        sc.strPYTD = '2022';
        sc.strYTD = '2023';
        sc.thisYear = '2023';
        sc.YTD = 2023;
        sc.ytdgraphData = '{ year: \'2022\', Sales: 955201.81 },{ year: \'2023\', Sales: 98548.34 }';

        SalesMap sm = new SalesMap();
        sm.x_xAustralia = 433062.47;
        sm.xxxAustralia = 47219.56;
        sm.x_xCanada = 522139.34;
        sm.xxxCanada = 51328.78;
        sm.x_xGlobal = 955201.81;
        sm.xxxGlobal = 98548.34;
        sm.x_xcOperations = 0;
        sm.xxxcOperations = 0;

        sc.salesMap = new SalesMap();
        sc.salesMap = sm;

        String scString1 = JSON.serialize(sc);
        System.debug(scString1);
        String scString2 = scString1.replace('x_xc', '2022Commercial ').replace('xxxc', '2023Commercial ').replace('x_x', '2022').replace('xxx', '2023');
        System.debug(scString2);
        return scString2;
    }

    public class SalesControllerW {
        @AuraEnabled
        public String bu {get; set;}
        @AuraEnabled
        public String bugraphData {get; set;}
        @AuraEnabled
        public List<String> buListFinal {get; set;}
        @AuraEnabled
        public String lastYear {get; set;}
        @AuraEnabled
        public Integer PYTD {get; set;}
        @AuraEnabled
        public SalesMap salesMap {get; set;}
        @AuraEnabled
        public String strPYTD {get; set;}
        @AuraEnabled
        public String strYTD {get; set;}
        @AuraEnabled
        public String thisYear {get; set;}
        @AuraEnabled
        public Integer YTD {get; set;}
        @AuraEnabled
        public String ytdgraphData {get; set;}
    }

    public class SalesMap {
        @AuraEnabled
        public Decimal x_xAustralia {get; set;}
        @AuraEnabled
        public Decimal xxxAustralia {get; set;}
        @AuraEnabled
        public Decimal x_xCanada {get; set;}
        @AuraEnabled
        public Decimal xxxCanada {get; set;}
        @AuraEnabled
        public Decimal x_xGlobal {get; set;}
        @AuraEnabled
        public Decimal xxxGlobal {get; set;}
        @AuraEnabled
        public Decimal x_xcOperations {get; set;}
        @AuraEnabled
        public Decimal xxxcOperations {get; set;}
    }

}