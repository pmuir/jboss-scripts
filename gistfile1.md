Assumptions
===========

* Forge setup
* OpenShift Express tools installed, account created, domain set up

Steps to run Forge to create a "kitchensink" app
================================================

1. Download and Unzip the distribution into a folder (like where you put maven.)
2. Run `bin/forge` (unix) or `bin/forge.bat` (windows)
3. Create a new Project with JPA `new-project --named acme --topLevelPackage`
4. Import into Eclipse
4. Add CDI `beans setup`
5. Add JPA `persistence setup --provider HIBERNATE --container JBOSS_AS7` and don't add custom apis
5. Add Bean Validation `validation setup --provider HIBERNATE_VALIDATOR`
5. Add JSF `faces setup`
6. Add the Member entity `entity --named Member --package com.acme.model`
7. Add the name field `field string --named name`
8. Add constraints `constraint NotNull --onProperty name` and `constraint Size --onProperty name --min 1 --max 25` and `constraint Pattern --onProperty name --regexp "[A-Za-z ]*" --message "must contain only letters and spaces"`
9. Add the email field `field string --named email`
10. Add constraints `constraint NotNull --onProperty email` 
11. Add the phoneNumber field `field string --named phoneNumber`
12. Add constraints `constraint NotNull --onProperty phoneNumber` and `constraint Size --onProperty phoneNumber --min 10 --max 12` and `constraint Digits --onProperty phoneNumber --fraction 0 --integer 12`
12. Add scaffolding `scaffold setup`
13. Scaffold from entity `scaffold from-entity com.acme.model.Member.java`
13. `rest setup`
14. `rest endpoint-from-entity com.acme.model.Member.java`
14. Built it `build`
15. Start JBoss AS 7.0.1 (7.0.2 is broken for JSF resources + JNDI binding)
16. Deploy it `as7 deploy`

Deploy to OpenShift Express
===========================

1. From the command line `rhc-create-app -a acme -t jbossas-7.0 -n` and copy the git URL
1. In forge *project root*, run git init
2. In forge run git remote add openshift "<gitURL>"
3. Add this profile to the pom:

    <profiles>
      <profile>
         <!-- When built in OpenShift the 'openshift' profile will be used when invoking mvn. -->
         <!-- Use this profile for any OpenShift specific customization your app will need. -->
         <!-- By default that is to put the resulting archive into the 'deployments' folder. -->
         <!-- http://maven.apache.org/guides/mini/guide-building-for-different-environments.html -->
         <id>openshift</id>
         <build>
            <plugins>
               <plugin>
                  <artifactId>maven-war-plugin</artifactId>
                  <version>2.1.1</version>
                  <configuration>
                     <outputDirectory>deployments</outputDirectory>
                     <warName>ROOT</warName>
                  </configuration>
               </plugin>
            </plugins>
         </build>
      </profile>
   </profiles>

4. Add the files to deploy to openshift and commit `git add src pom.xml` and `git commit -m"deploy"`
5. Push the files to openshift `git push openshift HEAD`
6. Paste url from openshift setup into web browser

Deploy to Flex
==============

1. Open Flex console https://openshift.redhat.com/flex/flex/index.html
2. Clusters -> Add Cluster, Create ACME cluster - this takes a while
3. Servers -> Add Server
4. Applications -> Add Application
5. Go into application and click on Components, choose JBoss as application type, AS 7.0 as the version
6. Hit save
7. Files -> Upload -> `workspace-demos/acme/target/acme.war`
8. Save 
9. Deploy Changes -> Start and click Deploy - this takes a while
10. Copy cluster URL and add `acme`
11. Copy server ip and add `acme`

TODO
====

* Add in JAX-RS scaffold
* Get metawidget working with validator
* get the console output back from git push properly