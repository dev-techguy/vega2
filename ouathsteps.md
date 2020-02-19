# generate the keystore.jks file
keytool -importkeystore -srcstoretype PKCS12 -srckeystore /path/to/certificate -destkeystore keystore.jks 

# generate alias using
keytool -genkey -keyalg RSA -alias "your_alias_name" -keystore keystore.jks

# access the file admin-token.sh and update its contents
Change this line that is the path to your *app.properties*

# run the file using this command
Run the file using this command *./admin-token.sh*

# get the bearer token generated
Use postman that is select Authorization Type Bearer. Paste the token and click the preview button.



# source key store
knSxfijQ2RKtEg76