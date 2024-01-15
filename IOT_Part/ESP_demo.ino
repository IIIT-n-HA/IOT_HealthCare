#define BLYNK_TEMPLATE_ID "TMPLE-467"
#define BLYNK_TEMPLATE_NAME "Your template name"
#define BLYNK_AUTH_TOKEN "your token here"
#include <WiFi.h>
#include <WiFiClient.h>
#include <BlynkSimpleEsp32.h>

#include "secret.h"
#include "ThingSpeak.h"

int a =1;
int b=1;
int c=1;
int d=1;
int e=1;


BlynkTimer timer;


unsigned long int previous_time = 0;

char ssid[] = SECRET_SSID;
char pass[] = SECRET_PASS;

WiFiClient client;





unsigned long myChannelNumber = SECRET_CH_ID;
const char* myWriteAPIKey = SECRET_WRITE_APIKEY;




void setup() {
  Serial.begin(9600);

  delay(200);

  WiFi.mode(WIFI_STA);
  ThingSpeak.begin(client);  // Initialize ThingSpeak
  Blynk.begin(BLYNK_AUTH_TOKEN, ssid, pass);
  timer.setInterval(1000, update_blink);
}

void loop() {

  


     Blynk.run();
  timer.run();

    if (millis() - previous_time > 20000) {
      update_data();
      previous_time =  millis();
    }
  
  delay(1000);
  a++;
  b++;
  c++;
  d++;
  e++;
}


void update_data() {
  // Connect or reconnect to WiFi
  if (WiFi.status() != WL_CONNECTED) {
    Serial.print("Attempting to connect to SSID: ");
    Serial.println(SECRET_SSID);
    while (WiFi.status() != WL_CONNECTED) {
      WiFi.begin(ssid, pass);
      Serial.print(".");
      delay(5000);
    }
    Serial.println("\nConnected.");
  }
  // set the fields with the values
  ThingSpeak.setField(1, a);
  ThingSpeak.setField(2, b);
  ThingSpeak.setField(3, c);
  ThingSpeak.setField(4, d);
  ThingSpeak.setField(5, e);

  int x = ThingSpeak.writeFields(myChannelNumber, myWriteAPIKey);
  if (x == 200) {
    Serial.println("Channel update successful.");
  } else {
    Serial.println("Problem updating channel. HTTP error code " + String(x));
  }

 
}

void update_blink(){

    Blynk.virtualWrite(V0, a);  
  Blynk.virtualWrite(V1, b);       
  Blynk.virtualWrite(V2, c);   
  Blynk.virtualWrite(V3, d);  
   Blynk.virtualWrite(V4, e); 
}
