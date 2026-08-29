# 🐍 Python na Arquitetura IoT: Integração e Inteligência

Nesta aula, exploramos por que o Python é a linguagem líder para a camada de **Gateway** e **Aplicação** em sistemas IoT, focando em requisitos de processamento e conectividade.

---

## 1. O Papel do Python na Pilha IoT
Enquanto o C++ gerencia o hardware (músculos), o Python gerencia a inteligência (cérebro).

* **Coleta:** Recebe dados via Serial (PySerial), MQTT ou HTTP.
* **Processamento:** Limpeza de dados com Pandas e NumPy.
* **Visualização:** Criação de dashboards rápidos (Streamlit/Dash).
* **Integração:** Envio de alertas para Telegram, E-mail ou Bancos de Dados.

---

## 2. Levantamento de Requisitos (Foco em Python)

Ao projetar a camada Python de um sistema IoT, devemos levantar os seguintes requisitos:

### A. Requisitos Funcionais (O que o script Python deve fazer)
1.  **RF-PY01:** O sistema deve converter strings brutas do Arduino em objetos JSON estruturados.
2.  **RF-PY02:** O sistema deve disparar um e-mail de alerta caso o sensor reporte um valor crítico por mais de 3 leituras consecutivas.
3.  **RF-PY03:** Deve salvar os dados recebidos em um banco de dados SQLite para persistência histórica.

### B. Requisitos Não Funcionais (Como o Python deve se comportar)
1.  **RNF-PY01 (Escalabilidade):** O script deve suportar a conexão de múltiplos Arduinos simultaneamente via threads.
2.  **RNF-PY02 (Robustez):** O sistema deve detectar a desconexão do hardware e tentar reconectar a cada 5 segundos sem travar a interface.
3.  **RNF-PY03 (Performance):** O processamento de cada pacote de dados não deve exceder 50ms para evitar estouro do buffer serial.

---

## 3. Lógica de Programação Composta (Pythonic IoT)

### Gerenciamento de Conexão com `try-except`
Um requisito fundamental em IoT é a resiliência. O Python trata falhas de hardware de forma elegante:

```python
import serial
import time

def iniciar_gateway(porta='COM3'):
    try:
        servidor_iot = serial.Serial(porta, 115200, timeout=1)
        print(f"✅ Gateway Ativo na porta {porta}")
        return servidor_iot
    except serial.SerialException:
        print("❌ Erro: Hardware não encontrado. Verifique a conexão USB.")
        return None

# Lógica de Re-conexão Automática
conexao = None
while conexao is None:
    conexao = iniciar_gateway()
    if conexao is None: time.sleep(5)