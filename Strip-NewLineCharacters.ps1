using Assembly PresentationCore

# Get clipboard text
$clipText = [Windows.Clipboard]::GetText()

# Replace line returns with single space (while stripping out multiple spaces)
$clipText = $clipText -replace "\s*`r?`n\s*", " "

# Set clipboard text
[Windows.Clipboard]::SetText($clipText)
