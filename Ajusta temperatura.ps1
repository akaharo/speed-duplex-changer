Add-Type -AssemblyName System.Windows.Forms

$form = New-Object System.Windows.Forms.Form
$form.Text = "Ajustar Desempenho do Processador"
$form.Size = New-Object System.Drawing.Size(400,200)
$form.StartPosition = "CenterScreen"

$label = New-Object System.Windows.Forms.Label
$label.Text = "Escolha o limite de desempenho máximo do processador:"
$label.AutoSize = $true
$label.Location = New-Object System.Drawing.Point(30,20)
$form.Controls.Add($label)

$button90 = New-Object System.Windows.Forms.Button
$button90.Text = "90%"
$button90.Location = New-Object System.Drawing.Point(50,70)
$button90.Size = New-Object System.Drawing.Size(100,30)
$button90.Add_Click({
    Start-Process -FilePath "powercfg.exe" -ArgumentList "-setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX 90" -Verb RunAs
    Start-Process -FilePath "powercfg.exe" -ArgumentList "-setdcvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX 90" -Verb RunAs
    Start-Process -FilePath "powercfg.exe" -ArgumentList "-setactive SCHEME_CURRENT" -Verb RunAs
    [System.Windows.Forms.MessageBox]::Show("Desempenho ajustado para 90%")
})
$form.Controls.Add($button90)

$button100 = New-Object System.Windows.Forms.Button
$button100.Text = "100%"
$button100.Location = New-Object System.Drawing.Point(200,70)
$button100.Size = New-Object System.Drawing.Size(100,30)
$button100.Add_Click({
    Start-Process -FilePath "powercfg.exe" -ArgumentList "-setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX 100" -Verb RunAs
    Start-Process -FilePath "powercfg.exe" -ArgumentList "-setdcvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX 100" -Verb RunAs
    Start-Process -FilePath "powercfg.exe" -ArgumentList "-setactive SCHEME_CURRENT" -Verb RunAs
    [System.Windows.Forms.MessageBox]::Show("Desempenho ajustado para 100%")
})
$form.Controls.Add($button100)

$form.Topmost = $true
$form.Add_Shown({$form.Activate()})
[void]$form.ShowDialog()
