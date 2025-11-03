# PowerShell Automation Restore Instructions

## 🧭 How to Restore the Xanthus Automation Setup on a New PC

### 1️⃣ Install Prerequisites
Make sure the new machine has:

```powershell
# Install Git (if needed)
winget install --id Git.Git -e

# Install Python 3 (if needed)
winget install --id Python.Python.3.12 -e

# Install the required Python module
pip install python-docx
```

---

### 2️⃣ Clone the GitHub repository
```powershell
cd "$HOME\Desktop"
git clone https://github.com/bdaumit/powershell-automation.git
```

This will create a folder like:
```
C:\Users\<username>\Desktop\powershell-automation\
├── Microsoft.PowerShell_profile.ps1
└── docx_to_txt.py
```

---

### 3️⃣ Copy the PowerShell profile into place
For PowerShell **5.1**:
```powershell
$src = "$HOME\Desktop\powershell-automation\Microsoft.PowerShell_profile.ps1"
$dest = "$HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
New-Item -ItemType Directory -Force -Path (Split-Path $dest)
Copy-Item $src $dest -Force
```

For PowerShell **7+**:
```powershell
Copy-Item $src "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -Force
```

---

### 4️⃣ Reload or restart PowerShell
```powershell
. $PROFILE
```

---

### 5️⃣ Test it
```powershell
xanthus "Restored setup test"
```

If it prints conversion and push messages, you're fully set up again!
