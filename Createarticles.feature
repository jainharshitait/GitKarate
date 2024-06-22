@run5
Feature: Test for the home page

Background: Define Urls
Given url apiUrl
* def articleRequestBody = read('classpath:conduitApp/json/newArticle.json')
* def dataGenerator = Java.type('helpers.dataGenerator')
* set articleRequestBody.article.title = dataGenerator.getRandomarticleValues().title
* set articleRequestBody.article.description = dataGenerator.getRandomarticleValues().description
* set articleRequestBody.article.body = dataGenerator.getRandomarticleValues().body




Scenario: Create and delete article
    #Given header Authorization = 'Token '+token
    Given path 'articles'
    And request articleRequestBody
    When method Post
    Then status 201
    * def articleid = response.article.slug

    Given path 'articles',articleid
    When method Delete
    Then status 204

   