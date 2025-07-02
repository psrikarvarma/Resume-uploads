#include <DHT.h>  // Add this library include

#define DHTPIN 3      
#define MOISTURE_PIN A0 
#define RELAY_HUMIDITY_PIN 6  
#define RELAY_MOISTURE_PIN 4  
#define DHTTYPE DHT11  

DHT dht(DHTPIN, DHTTYPE);  // Correct declaration

void setup() {
  Serial.begin(9600);
  dht.begin();
  pinMode(DHTPIN, INPUT_PULLUP);
  pinMode(RELAY_HUMIDITY_PIN, OUTPUT);
  pinMode(RELAY_MOISTURE_PIN, OUTPUT);
}

void loop() {
  digitalWrite(RELAY_HUMIDITY_PIN, HIGH);
  digitalWrite(RELAY_MOISTURE_PIN, HIGH);
  delay(2000);  

  float humidity = dht.readHumidity();
  float temperature = dht.readTemperature();

  int moistureValue = analogRead(MOISTURE_PIN);
  int moisturePercentage = map(moistureValue, 0, 1023, 0, 100);

  

  Serial.print("Humidity: ");
  Serial.print(humidity);
  Serial.print("%  Temperature: ");
  Serial.print(temperature);
  Serial.print("°C  Moisture: ");
  Serial.print(moisturePercentage);
  Serial.println("%");

  if (humidity > 80) {
    digitalWrite(RELAY_HUMIDITY_PIN, LOW);
    Serial.println("Humidity Relay Activated");
    delay(3000);  
    digitalWrite(RELAY_HUMIDITY_PIN, HIGH);
  }

  if (moisturePercentage > 60) {
    digitalWrite(RELAY_MOISTURE_PIN, LOW);
    Serial.println("Moisture Relay Activated");
    delay(3000);  
    digitalWrite(RELAY_MOISTURE_PIN, HIGH);
  }
}