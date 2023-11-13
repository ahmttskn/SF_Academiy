// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents




Account[] accts = new Account[]{new Account(billingcity = 'San Jose')};
try {
    insert accts;
} catch (System.DmlException e) {
    for (Integer i = 0; i < e.getNumDml(); i++) {
        // Process exception here
        System.debug('Bu mesajı ben yazdım'); 
    }
}





Map<string, List<decimal>> cityTemp = new Map<string, List<decimal>>();
System.debug(cityTemp);

cityTemp.put('Newyork', new List<decimal>{32.2, 43,5, 23.7});
cityTemp.put('Texas', new List<decimal>{42.2, 47,5, 23.7});
cityTemp.put('Boston', new List<decimal>{72.2, 43,5, 29.7});
cityTemp.put('Burlingame', new List<decimal>{62.2, 43,5, 63.7});

List<string> cityTempKays = new List<string>();
cityTempKays.addAll(cityTemp.keySet());
System.debug(cityTempKays);

Map<String,decimal> cityAveList = new Map<String,decimal>();

for (string key : cityTempKays) {
    decimal ave = 0;
    for (decimal eK : cityTemp.get(key)) {
        ave = ave + eK;
    }
    cityAveList.put(key, ave/cityTemp.get(key).size());   
    System.debug(key + ' Temprature Ave is: '+ ave/cityTemp.get(key).size());
}

System.debug('City Temp Ave List ' + cityAveList);

Map<Object, Object> mapName = new Map<Object, Object>();
















// Map<Integer, String> Infos = new Map<Integer, String>();
// Infos.put(111111, 'Ahmet');
// Infos.put(22222, 'Maehmet');
// Infos.put(33333, 'Farzana');
// List<Integer> MapKey = new List<Integer>() ;
// MapKey.addAll(Infos.keySet());
// System.debug(MapKey);

// for (Integer key : Infos.keySet()) {
//     if (Infos.get(key) == 'Ahmet') {
//         System.debug('this is ahmet');
//     } else {
//         System.debug('not');
//     }
//     // System.debug( Infos.get(key) );
// }


// System.debug(Infos.get(111111));































Homework_19.adressVe('94010');



dalls d = new dalls();
d.myFavorite();


string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);

Aysel_interview AY = new Aysel_interview();



// November 7, 1867
date MrB = date.newInstance(1867, 11, 7);
integer mary = date.

daysBetween(date.today()).MrB;
date.
system.debug(mary);




Dallas_Team dT = new Dallas_Team();
dT.methodName();