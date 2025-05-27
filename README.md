# mule-notification-service

This mule application is in charge of send email or notification trough the SMTP relay feature of Gmail.

In order to make the relay work the IP of the private space needs to be specified as stated in this [guide](https://support.google.com/a/answer/176600?hl=it#:~:text=Il%20nome%20di%20dominio%20completo,Porta%2025%2C%20465%20o%20587)

Also to authenticate you have to use:

- username: email, example: mrossi@florencenext.com
- password: app password previously created and verified as expressed in the guide before.

In case the mail or the notification cannot be delivered using gmail (e.g. credential changed) the mail will be delivered using Twilio sendgrid SMTP service and a alert fallback mail will be sent to system admin.
To authenticate to Sendgrid you'll need an api key.