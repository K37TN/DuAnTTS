package laptrinh.com.service;

import org.apache.commons.lang3.RandomStringUtils;

public class RandomString {
    public static String randomPassword() {
        String input = "abcdefghijk0123456789!@#$%^&*/";
        return RandomStringUtils.random(6, input);
    }
}
