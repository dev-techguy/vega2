# Intro

Vedlagt ligger to script.
* admin-token.sh
* non-admin.token.sh

Første lager token for admin clienten. Denne brukte vi mot selvbetjenings api'et.
Dette brukte vi til å lage scope og ny client for oss. Denne andre klienten bruker vi i non-admin-token.sh til å lage et token
som vi kan bruke gjennom maskinporten, til å kalle på vår egen tjeneste som validere at det er en gyldig requet
autentisert av maskinporten.

# Oppsett
## jks
Dere må populere en jks fil som inneholder virksomhets-sertifikatet.

Det følgende er fra notatene til Matilsynets Helge Langset, som opprettet jks filene vi brukte.

```bash
keytool -importkeystore -srcstoretype PKCS12 -srckeystore Buypass-ID-MATTILSYNET-serienummer2448449375614358364515925-2019-02-19.p12 -destkeystore mattilsynet-maskinporten.jks
keytool -keypasswd -alias "mattilsynet test" -keystore mattilsynet-maskinporten.jks
keytool -list -v -keystore mattilsynet-maskinporten.jks
```

### Forklaring
Linje en er import og opprettelse av JKS-en. Linje to endrer passordet til privatnøkkelen slik at den ikke har samme passord som PKCS 12-filen. Linje tre er bare for å se på innholdet. Jeg beholdt aliaset "mattilsynet test" siden det var det sertifikatet heter. Det er nødvendig at aliaset er riktig i konfigurasjonsfilen til grant-generatoren (og jeg testet ikke om aliaset kunne være noe annet enn sertifikatnavnet, f. eks. "mattilsynet-test").

## jwt-grant-generator/*.properties
Videre justerer dere .properties fil(ene) under jwt-grant-generator.
Legg inn rett passord for deres jkt fil(er) og issuer. For filen som brukes av non-admin-token.sh må dere oppdatere scope også.

Justere navn og plassering i .sh filene til å peke på deres .properties og .jkt filer.
Vi endt emed å navngi det andre parent med clientId som vi selv lagde med selvbetjenings-api'et.

Jeg har spredd noen kommentarer rundt i filene.
