# 🖥️ Levantamento de Requisitos: Sistemas Operacionais em IoT

Esta aula aborda como os requisitos de um projeto IoT ditam a escolha do Sistema Operacional (ou a ausência dele) nas camadas da arquitetura.

---

## 1. O Dilema do Sistema Operacional na Camada Edge
No IoT, a escolha do SO não é baseada em "gosto", mas em restrições de hardware e requisitos de tempo real.

### Categorias de Execução:
1.  **Bare Metal (Sem SO):** O código (C++) roda diretamente no hardware. Ex: Arduino Uno.
2.  **RTOS (Real-Time Operating System):** SO focado em determinismo e multitarefa de baixa latência. Ex: FreeRTOS, Zephyr.
3.  **GPOS (General Purpose OS):** SO completo para processamento complexo. Ex: Raspberry Pi OS (Linux), Windows IoT.

---

## 2. Requisitos que Direcionam a Escolha do SO

### A. Requisitos Funcionais (RF)
* **RF-SO01 (Multitarefa):** Se o sistema precisa ler 5 sensores, processar Wi-Fi e gerenciar uma tela simultaneamente, um **RTOS** é necessário para escalonar essas tarefas.
* **RF-SO02 (Processamento de Imagem/IA):** Se o requisito envolve visão computacional (Python/OpenCV), a arquitetura exige um **GPOS (Linux)**.

### B. Requisitos Não Funcionais (RNF) - Os Críticos
* **RNF-SO01 (Determinismo):** Se o requisito exige resposta a um sensor em exatamente $10ms$, um **RTOS** é obrigatório. Sistemas como Linux podem sofrer variações (jitter).
* **RNF-SO02 (Boot Time):** Se o sistema deve estar operacional em $< 1s$ após ligar, o **Bare Metal** é a escolha ideal.
* **RNF-SO03 (Gerenciamento de Energia):** Requisitos de bateria de longa duração favorecem **Bare Metal** ou **RTOS** com modos de *Deep Sleep* otimizados.

---

## 3. Matriz de Requisitos vs. Sistema Operacional

| Requisito | Bare Metal (C++) | RTOS (C++/MicroPython) | Linux IoT (Python) |
| :--- | :--- | :--- | :--- |
| **Complexidade de Código** | Baixa | Média | Alta |
| **Tempo Real (Hard)** | Excelente | Excelente | Inadequado |
| **Poder de Processamento** | Muito Baixo | Baixo/Médio | Muito Alto |
| **Memória (RAM)** | < 32 KB | 32 KB - 1 MB | > 512 MB |
| **Exemplo de Hardware** | Arduino Uno | ESP32 / STM32 | Raspberry Pi / BeagleBone |

---

## 4. Integração de Software e SO

### Lógica de Requisito: Gestão de Memória (C++ vs Python)
O levantamento de requisitos deve prever como o SO gerencia os recursos:

* **No Bare Metal (C++):** O requisito de "Estabilidade" é garantido pelo programador (gestão manual de memória).
* **No Linux (Python):** O requisito de "Confiabilidade" é facilitado pelo SO (proteção de memória e gerenciamento de processos), permitindo que o Python execute tarefas pesadas sem derrubar o hardware.

---

## 5. Exemplo de Levantamento Composto

**Projeto:** Sistema de Controle de Drones
* **Requisito Funcional:** Estabilizar os motores a cada $2ms$.
    * *Decisão:* **RTOS ou Bare Metal (C++)**. O Linux não garantiria a precisão temporal necessária para o voo.
* **Requisito Funcional:** Transmitir vídeo via 4G e identificar objetos.
    * *Decisão:* **Linux (Python)**. Requer drivers complexos de rede e bibliotecas pesadas impossíveis em microcontroladores simples.

---

## 📝 Atividade: Análise de Requisitos e SO

**Instruções:** Para os cenários abaixo, defina o SO ideal e justifique com base em um Requisito Não Funcional (RNF):

1.  **Marca-passo Cardíaco:** (Monitoramento vital constante e bateria de 10 anos).
2.  **Totem de Autoatendimento de Shopping:** (Interface gráfica fluida, conexão com banco de dados e câmera).
3.  **Sensor de Umidade de Solo (LoRa):** (Envio de dados a cada 1 hora, movido a energia solar).

---

## 🚀 Tópico para Debate
> "Por que não usamos Linux em tudo no IoT?"
> *Considere: Custo, consumo de energia, complexidade de segurança e tempo de inicialização.*