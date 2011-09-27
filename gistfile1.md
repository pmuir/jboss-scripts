Steps to run Forge (complete instructions - just 5 steps):

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
8. Add constraints `constraint NotNull --onProperty name` and `constraint Size --onProperty name --min 1 --max 25`
9. Add the email field `field string --named email`
10. Add constraints `constraint NotNull --onProperty email`
11. Add the phoneNumber field `field string --named phoneNumber`
11. Add JSF `project install-facet forge.spec.jsf`
12. Add scaffolding `scaffold setup`
13. Scaffold from entity `scaffold from-entity com.acme.model.Member.java`
14. Built it `build`
15. Start JBoss AS 7
16. Deploy it `as7 deploy`