# PowerShell Shellcode Loader

This project demonstrates a simple PowerShell script that:
- Downloads a raw shellcode binary from a remote server
- Allocates executable memory in the current process
- Copies the shellcode into memory
- Sets memory protection to executable
- Executes the shellcode using a managed delegate

> ⚠️ This repository is created for **educational and research purposes only**.

---

## 🔧 How It Works

The script follows these steps:

1. **Download** the shellcode from a remote URL using `System.Net.WebClient`.
2. **Allocate** memory in the process using `Marshal.AllocHGlobal`.
3. **Copy** the bytes of the shellcode into the allocated memory.
4. **Change** the memory protection to `PAGE_EXECUTE_READWRITE (0x40)` using `VirtualProtect`.
5. **Create** a delegate pointing to the shellcode location and execute it.

---

⚠️ Disclaimer
This script is designed for ethical hacking, red teaming, and research purposes only.

Do not use this script against any system without explicit authorization.

The author is not responsible for any misuse or damages caused by this code.
