# Trabalho 01 – Lógica de Controle de Elevador

**UNIVERSIDADE FRANCISCANA**
**Curso:** Ciência da Computação – 2025-02.  
**Disciplina:** Sistemas Digitais.  
**Professor:** André Flores dos Santos.

---

- **Aluno:** Gabriel Teixeira
- **Data:** 27/08/2025

---

> ### **🎯 Objetivo**
> Projetar e implementar a lógica de controle de um elevador utilizando apenas portas lógicas, com base nas regras de operação fornecidas.

### **1. Tabela-Verdade**

A tabela-verdade completa, baseada nas regras de operação, é a seguinte:

| D | U | L | UP | DOWN | Justificativa |
|---|---|---|:--:|:----:|---------------|
| 0 | 0 | 0 | 0  | 0    | Regra 1: Porta aberta, elevador parado. |
| 0 | 0 | 1 | 0  | 0    | Regra 1: Porta aberta, elevador parado. |
| 0 | 1 | 0 | 0  | 0    | Regra 1: Porta aberta, elevador parado. |
| 0 | 1 | 1 | 0  | 0    | Regra 1: Porta aberta, elevador parado. |
| 1 | 0 | 0 | 0  | 0    | Porta fechada, sem pedidos. |
| 1 | 0 | 1 | 0  | 1    | Regra 3: Pedido para descer. |
| 1 | 1 | 0 | 1  | 0    | Regra 2: Pedido para subir. |
| 1 | 1 | 1 | 1  | 0    | Regra 4: Conflito, prioridade para subir. |

### **2. Mintermos**

Os mintermos são as combinações de entrada para as quais cada saída é ativada (resulta em 1).

- **Para a saída `UP`:**
    - `D.U.L'` (linha 110, mintermo m6)
    - `D.U.L` (linha 111, mintermo m7)
- **Para a saída `DOWN`:**
    - `D.U'.L` (linha 101, mintermo m5)

### **3. Equação Canônica (Soma de Produtos - SOP)**

A equação canônica para cada saída é a soma de seus mintermos.

- **Equação para `UP`:** `UP = D.U.L' + D.U.L`
- **Equação para `DOWN`:** `DOWN = D.U'.L`

### **4. Simplificação (Álgebra Booleana)**

As equações canônicas podem ser simplificadas para otimizar o circuito.

- **Simplificação de `UP`:**
    ```
    UP = D.U.L' + D.U.L
    UP = D.U . (L' + L)
    UP = D.U . (1)
    UP = D.U
    ```
- **Simplificação de `DOWN`:**
    - A equação `DOWN = D.U'.L` já está em sua forma mínima.

### **5. Implementação no Logisim Evolution**

Descrição do circuito final baseado nas equações simplificadas:

- **Entradas:**
    - Crie três pinos de entrada (Inputs) e rotule-os como `D`, `U` e `L`.

- **Saída `UP` (`UP = D.U`):**
    1.  Adicione uma porta **AND** de duas entradas.
    2.  Conecte a entrada `D` e a entrada `U` a esta porta AND.
    3.  Conecte a saída da porta AND a um pino de saída (Output) rotulado como `UP`.

- **Saída `DOWN` (`DOWN = D.U'.L`):**
    1.  Adicione uma porta **NOT**.
    2.  Conecte a entrada `U` à porta NOT para obter o sinal `U'`.
    3.  Adicione uma porta **AND** de três entradas.
    4.  Conecte a entrada `D`, a saída da porta NOT (`U'`) e a entrada `L` a esta porta AND.
    5.  Conecte a saída da porta AND a um pino de saída (Output) rotulado como `DOWN`.

### **6. Registro de Testes**

Validação da lógica do circuito com base nas equações simplificadas.

- **(i) Porta Aberta (D=0):**
    - `UP = 0 . U = 0`
    - `DOWN = 0 . U' . L = 0`
    - **Resultado:** Correto. Ambas as saídas são 0.

- **(ii) Pedido para Subir (D=1, U=1, L=0):**
    - `UP = 1 . 1 = 1`
    - `DOWN = 1 . (1)' . 0 = 1 . 0 . 0 = 0`
    - **Resultado:** Correto. `UP` é 1 e `DOWN` é 0.

- **(iii) Pedido para Descer (D=1, U=0, L=1):**
    - `UP = 1 . 0 = 0`
    - `DOWN = 1 . (0)' . 1 = 1 . 1 . 1 = 1`
    - **Resultado:** Correto. `UP` é 0 e `DOWN` é 1.

- **(iv) Conflito - Prioridade Subir (D=1, U=1, L=1):**
    - `UP = 1 . 1 = 1`
    - `DOWN = 1 . (1)' . 1 = 1 . 0 . 1 = 0`
    - **Resultado:** Correto. A prioridade é mantida, com `UP=1` e `DOWN=0`.

### **7. Print do Circuito no Logisim**

*(Insira aqui o print do seu circuito montado no Logisim, conforme a descrição na seção 5)*.

---
> ### **📢 Lembrete**
> Não se esqueça de preencher seu nome e a data, gerar o print do Logisim e entregar tanto o arquivo `.docx` preenchido quanto o arquivo `.circ` na plataforma Minha UFN.
