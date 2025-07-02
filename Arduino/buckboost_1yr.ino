int feedback = A1;     // The feedback input is A1
int PWM = 3;           // Digital pin D3 for PWM signal
int pwm = 1;           // Initial value of PWM width

void setup() {
  Serial.begin(9600);
  pinMode(feedback, INPUT);
  pinMode(PWM, OUTPUT);
  TCCR2B = TCCR2B & B11111000 | B00000001;  // pin 3 and 11 PWM frequency of 31372.55 Hz
}

void loop() {
  float voltage = (2.5 / 3.6) * (1023 / 5);  // We read the value of the potentiometer, which is the desired value
  float output = analogRead(feedback);      // We read the feedback, which is the real value

  // If the desired value is HIGHER than the real value, we increase PWM width
  if (voltage > output) {
    // Serial.println("trying to increase output voltage. pwm: " + String(pwm));
    pwm = pwm + 1;
    pwm = constrain(pwm, 1, 254);
    delay(90);
  }

  // If the desired value is LOWER than the real value, we decrease PWM width
  if (voltage < output) {
    Serial.println("trying to decrease output voltage. pwm: " + String(pwm));
    pwm = pwm - 1;
    pwm = constrain(pwm, 1, 254);
    delay(90);
  }

  analogWrite(PWM, pwm);  // Finally, we create the PWM signal
}
