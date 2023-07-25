$PROCESS_NAME = "msedge"
$WIDTH = 1920*0.5
$HEIGHT = 1080*0.75

Add-Type -Namespace Win32 -Name NativeMethods -MemberDefinition @"
    [DllImport("user32.dll", SetLastError=true)]
    public static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter, int x, int y, int cx, int cy, uint uFlags);
"@

(Get-Process -Name $PROCESS_NAME).MainWindowHandle | ForEach-Object {
    $size = New-Object System.Drawing.Size($Width, $Height)
    [Win32.NativeMethods]::SetWindowPos($_, [IntPtr]::Zero, 0, 0, $size.Width, $size.Height, 0x0040) | Out-Null
}
