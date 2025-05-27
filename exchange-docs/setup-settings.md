### SETUP settings.xml
```xml
<?xml version="1.0" encoding="UTF-8"?>
    <settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
    http://maven.apache.org/xsd/settings-1.0.0.xsd"> 
<servers>
    <server>
        <id>anypoint-exchange-v3</id>
        <username>~~~Client~~~</username>
        <password>ASK_VALUE</password>
    </server>
    <server>
      <id>FNEXT-CH2-Deployment</id>
      <username>~~~Client~~~</username>
      <password>ASK_VALUE</password>
     </server>
 </servers>
  <mirrors>
    <mirror>
      <id>https-mirror</id>
      <name>HTTPS Mirror Repository for Mule</name>
      <url>https://repository.mulesoft.org/releases/</url>
      <mirrorOf>mulesoft-release</mirrorOf>
    </mirror>
    <mirror>
        <id>my-repository-http-unblocker1</id>
        <mirrorOf>mulesoft-release</mirrorOf>
        <name></name>
        <url>http://repository.mulesoft.org/releases/</url>
        <blocked>false</blocked>
      </mirror>
      <mirror>
        <id>mulesoft-plugin-releases-mirror</id>
        <mirrorOf>mulesoft-plugin-releases</mirrorOf>
        <name>MuleSoft Release Repository</name>
        <url>http://repository.mulesoft.org/releases/</url>
        <blocked>false</blocked>
      </mirror>
  </mirrors>

  <profiles>
    <profile>
       <id>fnext</id>
       <properties>
        <globals.distributionManagementUrl>https://maven.eu1.anypoint.mulesoft.com/api/v3/organizations/d5986291-d221-4579-b2de-b3c3b5371f38/maven</globals.distributionManagementUrl>
        <globals.businessGroupId>d5986291-d221-4579-b2de-b3c3b5371f38</globals.businessGroupId>
        <globals.deployconnectedapp>FNEXT-CH2-Deployment</globals.deployconnectedapp>
        <globals.privatespacename>private-space-fnext</globals.privatespacename>
        <globals.anypoint.platform.base_uri>https://eu1.anypoint.mulesoft.com</globals.anypoint.platform.base_uri>
        <globals.anypoint.platform.client_id>2618af88f0ae458b973f6b7ea15a0d2b</globals.anypoint.platform.client_id>
        <globals.anypoint.platform.client_secret>ASK_VALUE</globals.anypoint.platform.client_secret>
        <globals.anypoint.platform.analytics_base_uri>https://analytics-ingest.eu1.anypoint.mulesoft.com</globals.anypoint.platform.analytics_base_uri>
        <globals.ch2domainName>api.florencenext.com/</globals.ch2domainName>
       </properties>
       <!--Enable snapshots for the built in central repo and use a bogus URL for central to direct -->
       <!--all requests to nexus via the mirror -->
       <repositories>
        <repository>
          <id>anypoint-exchange-v3</id>
          <name>Anypoint Exchange</name>
          <url>https://maven.anypoint.mulesoft.com/api/v3/maven</url>
          <layout>default</layout>
        </repository>
        <repository>
          <id>mulesoft-releases</id>
          <name>MuleSoft Releases Repository</name>
          <url>https://repository.mulesoft.org/releases/</url>
          <layout>default</layout>
        </repository>
      </repositories>
      <pluginRepositories>
        <pluginRepository>
          <id>mulesoft-releases</id>
          <name>MuleSoft Releases Repository</name>
          <layout>default</layout>
          <url>https://repository.mulesoft.org/releases/</url>
          <snapshots>
            <enabled>false</enabled>
          </snapshots>
        </pluginRepository>
      </pluginRepositories>
    </profile>
 </profiles>
 <activeProfiles>
    <!--make the profile active all the time -->
    <activeProfile>fnext</activeProfile>
 </activeProfiles>
</settings>
```