public class aysel_interview2 {
     public Aysel_interview2() {

        for (Integer i = 1; i < 101; i++) {
            
            if (math.mod(i, 3) == 0 && math.mod(i, 5) == 0) {
                System.debug('fooBar');
            } else if (math.mod(i, 3) == 0) {
                System.debug('Too');
            } else if (math.mod(i, 5) == 0) {
                System.debug('Bar');
            } else {
                System.debug(i);
            } 
        }
    }

}