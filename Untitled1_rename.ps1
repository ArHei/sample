# https://www.youtube.com/watch?v=QOGKcVsieio

Add-Type -Path "D:\Downloads\itextsharp.dll"
$filep = "D:\Downloads\sample.pdf"

$pdf = New-Object iTextSharp.text.pdf.PdfReader -ArgumentList $filep
# $pdf
# $pdf.NumberOfPages
$exp = ""
foreach($page in 1..$($pdf.NumberOfPages)){
  $text = [iTextSharp.text.pdf.parser.PdfTextExtractor]::GetTextFromPage($pdf, $page)
  # Write-Output $text
  $exp += $text
}
$pdf.Close()

$exp | Out-File "D:\Downloads\test_file.txt"

# add I_ prefix
Get-ChildItem $filep | Rename-Item $filep -NewName { "I_" + $_.Name }


