Assumptions
===========

* Forge 1.0.0.Beta3 setup (<http://jboss.org/forge>)
* OpenShift Express tools installed, account created, domain set up (<http://openshift.com>)

Steps to run Forge to create a simple app
================================================

1. Download and Unzip the Forge distribution into a folder (like where you put maven.)
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

1. `rhc-express setup`
4. Add the files to deploy to openshift `git add src pom.xml`
5. Push the files to openshift `rhc-express deploy`
6. Paste url from openshift setup into web browser

Deploy to Flex
==============

1. `rhc-flex setup`
2. `rhc-flex deploy`
3. `rhc-flex start-application`
4. Go to the flex console <https://openshift.redhat.com/flex/flex/index.html> and click on "Clusters", find the cluster DNS, and go to <ClusterDNS>/acme