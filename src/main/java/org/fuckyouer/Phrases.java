package org.fuckyouer;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

@Component("phrases")
public class Phrases {

    @Value("classpath:phrases")
    private Resource phrasesResource;

    private List<String> phrases;
    private Random random = new Random();

    @PostConstruct
    public void init() throws IOException {
        phrases = new BufferedReader(new InputStreamReader(phrasesResource.getInputStream())).lines().collect(Collectors.toList());
    }

    public String getRandom() {
        return phrases.get(random.nextInt(phrases.size()));
    }

}
