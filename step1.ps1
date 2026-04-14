# Read the file
 = Get-Content gipro.html -Raw -Encoding UTF8

# Replace video element with animation
 = '<video class="intro-video" autoplay muted playsinline onended="Auth.onVideoEnded()">'
 = '<div class="intro-animation"><div class="truck-container"><div class="truck"><div class="truck-body"></div><div class="truck-cab"></div><div class="truck-wheels"><div class="wheel"></div><div class="wheel"></div></div></div></div><div class="intro-text">ILT LOGISTICS</div></div>'
 = .Replace(, )

# Remove video source and closing tag
 = .Replace('<source src="loading-video.mp4.mp4" type="video/mp4">Il tuo browser non supporta il video.</video>', '')

# Write the file
Set-Content gipro.html -Value  -Encoding UTF8

Write-Host "Step 1 complete: Video replaced with animation HTML"
