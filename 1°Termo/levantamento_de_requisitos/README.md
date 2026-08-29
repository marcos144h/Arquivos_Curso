# 📋 Levantamento de Requisitos para Projetos IoT

Este documento serve como guia para a fase de definição de escopo em projetos de Internet das Coisas, garantindo a integração entre hardware, conectividade e software.

---

## 1. Introdução
O levantamento de requisitos em IoT é peculiar pois deve considerar não apenas as necessidades do usuário, mas as restrições do ambiente físico e a autonomia dos dispositivos.

---

## 2. Requisitos Funcionais (RF)
Os Requisitos Funcionais descrevem **o que o sistema deve fazer**. São as funcionalidades diretas e comportamentos esperados.

| ID | Requisito Funcional | Descrição |
| :--- | :--- | :--- |
| **RF01** | Coleta de Dados | O sistema deve ler a temperatura e umidade a cada 5 segundos via sensor DHT11. |
| **RF02** | Acionamento Remoto | O usuário deve poder ligar/desligar uma lâmpada através de um comando em Python. |
| **RF03** | Alerta Local | O Arduino deve soar um buzzer se o sensor de gás detectar níveis acima de 400ppm. |
| **RF04** | Registro de Logs | O script Python deve salvar todas as leituras em um arquivo `.csv` ou Banco de Dados. |
| **RF05** | Dashboard | O sistema deve exibir um gráfico em tempo real com as métricas recebidas. |

---

## 3. Requisitos Não Funcionais (RNF)
Os Requisitos Não Funcionais descrevem **como o sistema deve funcionar**. Estão ligados a desempenho, segurança, confiabilidade e restrições técnicas.

| Categoria | ID | Requisito Não Funcional |
| :--- | :--- | :--- |
| **Desempenho** | RNF01 | A latência entre a leitura do sensor e a exibição no Python deve ser < 200ms. |
| **Confiabilidade** | RNF02 | O sistema deve retomar a conexão serial automaticamente após uma queda de energia. |
| **Segurança** | RNF03 | Os dados críticos enviados via Serial devem conter um checksum (CRC) para evitar corrupção. |
| **Usabilidade** | RNF04 | O código Python deve ter uma interface de linha de comando (CLI) intuitiva. |
| **Restrição** | RNF05 | O firmware deve ser escrito em C++ e ocupar menos de 80% da memória Flash do Arduino Uno. |

---

## 4. Mapeamento de Requisitos para Tecnologias

### Implementação (Hardware/C++)
* **RF01 (Coleta):** Implementado no Arduino usando bibliotecas de sensores e `analogRead()` / `digitalRead()`.
* **RNF05 (Memória):** Otimização de variáveis e uso de `PROGMEM` em C++ para economizar RAM.

### Implementação (Software/Python)
* **RF04 (Logs):** Uso de bibliotecas como `pandas` ou `sqlite3`.
* **RNF01 (Latência):** Uso de `Baud Rate` elevado (ex: 115200) e processamento assíncrono.

---

## 5. Exemplo de Conflito de Requisitos (Estudo de Caso)
> **Cenário:** O cliente quer leitura em tempo real (RF) mas o dispositivo funciona a bateria (Restrição).
>
> **Resolução:** Implementar o modo `Sleep` no Arduino. O requisito funcional de leitura muda para "intervalos de 10 minutos" para atender ao requisito não funcional de autonomia de bateria.

---

## 📝 Atividade de Aula
1.  Escolha um cenário (ex: Automação Residencial ou Estufa Inteligente).
2.  Liste **3 Requisitos Funcionais** essenciais.
3.  Liste **2 Requisitos Não Funcionais** de performance ou segurança.
4.  Defina qual parte do sistema (Arduino/C++ ou PC/Python) será responsável por cada requisito.