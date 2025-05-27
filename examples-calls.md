


### CALL WITHOUT TEMPLATE - /api/emails
```json
{
    "from_address": "acanale@florencenext.com",
    "to_addresses": ["andreacanale92@gmail.com"],
    "subject": "From",
    "body": "test from office email"
}
```


### CALL WITH TEMPLATE - /api/notifications
```json
{
    "subject": "test-alert",
    "to_addresses": ["acanale@florencenext.com","storki@florencenext.com"],
    "template": "alert",
    "body": "<h3>Non compare</h3><img src='https://media.licdn.com/dms/image/C4D03AQF472Xog5iw1g/profile-displayphoto-shrink_400_400/0/1598814297899?e=1714608000&v=beta&t=nTleKGAFzcLkrlGh3p3_PRjw4pg1AOI_GAGdE1zBub0'/>",
    "params":
        {
          "appname": "appname",
          "level": "ERROR",
          "message": "testmessage",
          "correlationId": "ssss-ssss-ssss-sss"
        }
}
```