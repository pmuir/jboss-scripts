Steps to run Forge (complete instructions - just 5 steps):

1. Download and Unzip the distribution into a folder (like where you put maven.)
2. Run `bin/forge` (unix) or `bin/forge.bat` (windows)
3. Create a new Project with JPA `new-project --named example --topLevelPackage com.example`
4. Add CDI `beans setup`
5. Add a bean `beans new-bean --type com.acme.Foo --scope REQUEST`

From there you should have a good starting point for live demos with CDI. You can also do this using the JBoss Tools M3 release from within JBT.`