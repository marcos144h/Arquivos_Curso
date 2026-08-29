# 🏗️ Arquitetura de Sistemas IoT Avançada

Este guia explora a integração robusta entre sistemas embarcados e camadas de software de alto nível, focando em escalabilidade e performance.

---

## 1. Arquitetura de 4 Camadas (Edge Computing)
Para sistemas complexos, utilizamos o conceito de **Edge Computing** (Processamento na Borda):

1.  **Device Layer (Arduino):** Coleta e filtragem primária.
2.  **Communication Layer:** Serial/MQTT/Websockets.
3.  **Edge Gateway (Python):** Processamento local, limpeza de dados e alarmes imediatos.
4.  **Cloud Layer:** Banco de dados (InfluxDB/PostgreSQL) e visualização (Grafana).

---

## 2. Programação de Baixo Nível: C++ Avançado
No Arduino, para evitar perda de dados, utilizamos **Interrupções (Interrupts)**. Isso permite que o microcontrolador responda instantaneamente a eventos externos sem depender do ciclo do `loop()`.

### Exemplo: Contador de Pulsos (Sensores de Fluxo ou RPM)
```cpp
// Uso de Volatile para variáveis compartilhadas com Interrupções
volatile int contadorPulsos = 0;
const int pinoInterrupcao = 2; // Pino que suporta interrupção

void setup() {
  Serial.begin(115200); // Baud rate alto para menor latência
  pinMode(pinoInterrupcao, INPUT_PULLUP);
  
  // Configura interrupção: dispara no modo FALLING (de 5V para 0V)
  attachInterrupt(digitalPinToInterrupt(pinoInterrupcao), sensorISR, FALLING);
}

void loop() {
  static unsigned long ultimoEnvio = 0;
  
  // Envia dados a cada 1 segundo (Não bloqueante)
  if (millis() - ultimoEnvio > 1000) {
    noInterrupts(); // Protege a variável durante a leitura
    int cópiaContador = contadorPulsos;
    contadorPulsos = 0;
    interrupts();
    
    Serial.print("DATA_PULSE:");
    Serial.println(cópiaContador);
    
    ultimoEnvio = millis();
  }
}

// Rotina de Serviço de Interrupção (ISR) - Deve ser curta e rápida
void sensorISR() {
  contadorPulsos++;
}