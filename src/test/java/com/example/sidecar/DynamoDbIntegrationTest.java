package com.example.sidecar;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.dynamodb.DynamoDbClient;
import software.amazon.awssdk.services.dynamodb.model.ListTablesResponse;

import java.io.File;
import java.net.URI;

public class DynamoDbIntegrationTest {

    private static DynamoDbClient dynamoDbClient;

    @BeforeAll
    public static void beforeTest() throws Exception {

        dynamoDbClient =   DynamoDbClient.builder()
                .endpointOverride(new URI("http://localhost:4566"))
                .region(Region.US_EAST_1)
                .credentialsProvider(StaticCredentialsProvider.create(AwsBasicCredentials.create("access", "secret")))
                .build();

        System.out.println("Working Directory = " + System.getProperty("user.dir"));


        var processBuilder = new ProcessBuilder().directory(new File(System.getProperty("user.dir")+"/localdynamodb"));

        processBuilder.command("terraform", "init");
        processBuilder.start().waitFor();

        processBuilder.command("terraform", "apply", "-auto-approve");
        processBuilder.start().waitFor();

    }


    @Test
    public void getTables(){
        ListTablesResponse listTablesResponse = dynamoDbClient.listTables();
        Assertions.assertEquals(listTablesResponse.tableNames().size(), 4);
    }
}