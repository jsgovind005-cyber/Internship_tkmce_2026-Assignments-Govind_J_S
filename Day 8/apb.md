# APB (Advanced Peripheral Bus) Protocol using Verilog

## Overview

This project implements the AMBA APB (Advanced Peripheral Bus) protocol using Verilog HDL. APB is a simple, low-power bus used for communication between processors and peripheral devices.

The design demonstrates APB write and read transactions using standard APB control and data signals.

---

## Features

- APB compliant interface
- Read operation support
- Write operation support
- Address and data transfer
- Ready signal handling
- Error indication support
- Verilog testbench for verification

---

## APB Signals

### Inputs

| Signal | Description |
|----------|-------------|
| PCLK | APB clock |
| PRESETN | Active-low reset |
| PSEL | Peripheral select |
| PENABLE | Transfer enable |
| PWRITE | Write/Read control |
| PADDR[31:0] | Address bus |
| PWDATA[31:0] | Write data bus |

### Outputs

| Signal | Description |
|----------|-------------|
| PRDATA[31:0] | Read data bus |
| PREADY | Transfer complete signal |
| PSLVERR | Error indication |

---

## APB Transfer Phases

### 1. Setup Phase

The master:

- Selects the slave using `PSEL`
- Places the address on `PADDR`
- Sets `PWRITE`
- Places write data on `PWDATA` (for write operation)

```text
PSEL = 1
PENABLE = 0
```

---

### 2. Enable Phase

The master asserts `PENABLE` to start the transfer.

```text
PSEL = 1
PENABLE = 1
```

The slave responds by asserting `PREADY`.

---

### 3. Transfer Complete

When `PREADY = 1`:

- Write data is accepted by the slave.
- Read data is returned on `PRDATA`.
- Transfer is completed.

---

## Simulation Transactions

### Write Transaction

| Address | Data |
|----------|-------------|
| 0x66 | 0x01911B97 |

Operation:

```text
PSEL = 1
PWRITE = 1
PENABLE = 1
```

Data is successfully written to the selected address.

---

### Read Transactions

| Address | Operation |
|----------|-----------|
| 0x7E | Read |
| 0x19 | Read |

Operation:

```text
PSEL = 1
PWRITE = 0
PENABLE = 1
```

The slave returns data on `PRDATA` when `PREADY` is asserted.

---

## Simulation Waveform
<img width="1862" height="786" alt="apb " src="https://github.com/user-attachments/assets/235f741b-b454-4187-8f9a-374de79db58b" />

The waveform verifies:

- APB setup phase
- APB enable phase
- Read transactions
- Write transactions
- Proper generation of `PREADY`
- Correct address and data transfers
- No slave error (`PSLVERR = 0`)

Observed addresses:

```text
0x7E
0x66
0x19
```

Observed write data:

```text
0x01911B97
```

---

## Applications

- Microcontroller peripherals
- UART interfaces
- Timers and counters
- GPIO controllers
- Memory-mapped registers
- AMBA-based SoC designs

---

## Result

The APB protocol was successfully implemented and verified using Verilog HDL. Simulation results confirm correct APB read and write transactions with proper handshaking through `PSEL`, `PENABLE`, and `PREADY` signals.


