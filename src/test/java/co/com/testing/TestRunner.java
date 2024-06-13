package co.com.testing;
import com.intuit.karate.junit5.Karate;

public class TestRunner {
    @Karate.Test
    Karate testSample(){
        return Karate.run("src/test/resources/features/swapi-get.feature");
    }
}
