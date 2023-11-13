public class ValidateAddress_1 {
    public void validateHomeAddress(){
        String houseName = 'The Old Post Home';
        String street = 'The Laurels';
        String city = 'Noida';
        String state = 'Uttar Pradesh';
        String stateISOCode = 'UP';
        String country = 'India';
        String countryISOCode = 'Ind';

        //1.i
        Integer streetNameLength = street.length();
        System.debug('Number of Characters in Street name   '+streetNameLength);
        //1.ii
        Boolean streetContainsHouseName = street.contains(houseName);
        System.debug('Street Name Contains house name or not    '+streetContainsHouseName);
        //1.iii
        Boolean streetContainsStateISO = street.contains(stateISOCode);
        System.debug('Street Name Contains state ISO code or not    '+streetContainsStateISO);
        //1.iv
        String stateISOUpper = stateISOCode.toUpperCase();
        System.debug('State ISO in Upper case    '+stateISOUpper);

        String countryISOUpper = countryISOCode.toUpperCase();
        System.debug('Country ISO in Upper case    '+countryISOUpper);
        
        String countryUpper = country.toUpperCase();
        System.debug('Country Name in Upper case    '+countryUpper);

        String cityLower = city.toLowerCase();
        System.debug('City Name in lower case    '+cityLower);

        String stateLower = state.toLowerCase();
        System.debug('State Name in lower case    '+stateLower);

        //1.v
        String concatHouseAndStreet = houseName + ' ' + street;
        System.debug('House name and street name together   '+concatHouseAndStreet);

    }
}