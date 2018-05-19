import java.util.Random;
public class generateRandom {
	 public  double getRandom()
	    {
	        // create instance of Random class
	        Random rand = new Random();
	 
	      
//	        int rand_int1 = rand.nextInt(1000);
//	        int rand_int2 = rand.nextInt(1000);

	        // Generate Random doubles
	        double rand_dub1 = rand.nextDouble();
	       
	 
	       
	        return 100000 + rand_dub1 * 999999;
	    }
}
