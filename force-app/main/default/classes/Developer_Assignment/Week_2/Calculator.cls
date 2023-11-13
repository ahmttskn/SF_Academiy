public class Calculator {
    public decimal  dynamicCalulationMethod(decimal a, decimal b, string calc){
        
        //Solution 2

        if (calc == 'ADDITION') {
            return a + b;
        } else if (calc == 'SUBSTRACTION') {
            return a - b;
        } else if (calc == 'DIVISION') {
            return a/b;
        } else if (calc == 'MULTIPLICATION') {
            return a*b;
        } else {
            system.debug('İşleminizi bir daha gözden geçirin..');
            return null;
        }
    }

    public void solition_3(){
         //Apex

        //Solution 3.1
        List<String> coloursList = new List<String>();
        coloursList.add('Red');
        coloursList.add('White');
        coloursList.add('Green');
        coloursList.add('Black');
        coloursList.add('Yellow');
        System.debug('coloursList   '+coloursList);

        //Solution 3.2
        Integer size = coloursList.size();
        System.debug('coloursList size  '+coloursList.size());
        System.debug('coloursList size  '+size);

        //Solution 3.3
        Boolean containsRed = coloursList.contains('Red');
        System.debug('containsRed  '+coloursList.contains('Red'));
        System.debug('containsRed  '+containsRed);

        //Solution 3.4
        String lastElement = coloursList.get(size-1);
        String lastElementInUpperCase = lastElement.toUpperCase();
        System.debug('lastElementInUpperCase    '+lastElementInUpperCase);

        //Solution 3.5
        coloursList[4] = coloursList[4].toUpperCase();
        System.debug('coloursList   '+coloursList);

        //Solution 3.6
        String listInStringForm = coloursList.toString();
        System.debug('listInStringForm  '+listInStringForm);

        //Solution 3.7
        List<String> colourCodesList = new List<String>{'#FF0000', '#00FFFF', '#0000FF', '#ADD8E6'};
        System.debug('colourCodesList   '+colourCodesList);

        //Solution 3.8
        Boolean areTwoListsEqual = coloursList.equals(colourCodesList);
        System.debug('areTwoListsEqual  '+areTwoListsEqual);

        //Solution 3.9
        List<String> mergedList = new List<String>();
        mergedList.addAll(coloursList);
        mergedList.addAll(colourCodesList);
        System.debug('mergedList    '+mergedList);
    }
}