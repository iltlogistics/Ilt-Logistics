# Read the file
 = Get-Content gipro.html -Raw -Encoding UTF8

# Replace video element with animation
 =  -replace '<video class="intro-video"[^>]*>[\s\S]*?</video>', '<div class="intro-animation"><div class="truck-container"><div class="truck"><div class="truck-body"></div><div class="truck-cab"></div><div class="truck-wheels"><div class="wheel"></div><div class="wheel"></div></div></div></div><div class="intro-text">ILT LOGISTICS</div></div>'

# Add CSS for animation
 =  -replace '\.intro-video \{[^}]+\}', '.intro-animation { position: relative; width: 100%; max-width: 600px; height: 200px; display: flex; flex-direction: column; align-items: center; justify-content: center; } .truck-container { width: 100%; height: 100px; position: relative; overflow: hidden; } .truck { position: absolute; left: -200px; animation: driveTruck 4s ease-in-out forwards; width: 180px; height: 80px; } .truck-body { position: absolute; width: 120px; height: 50px; background: linear-gradient(135deg, #0ea5e9 0%, #0284c7 100%); border-radius: 5px; top: 10px; left: 0; } .truck-cab { position: absolute; width: 50px; height: 60px; background: linear-gradient(135deg, #0284c7 0%, #0369a1 100%); border-radius: 5px; top: 0; right: 0; } .truck-wheels { position: absolute; bottom: 0; width: 100%; display: flex; justify-content: space-between; padding: 0 20px; } .wheel { width: 25px; height: 25px; background: #333; border-radius: 50%; border: 3px solid #666; animation: rotateWheel 0.5s linear infinite; } .intro-text { font-size: 3rem; font-weight: bold; color: #0ea5e9; text-shadow: 0 0 20px rgba(14, 165, 233, 0.5); opacity: 0; animation: fadeInText 1s ease-out 2s forwards; letter-spacing: 5px; } @keyframes driveTruck { 0% { left: -200px; } 60% { left: calc(100% + 50px); } 100% { left: calc(100% + 50px); } } @keyframes rotateWheel { from { transform: rotate(0deg); } to { transform: rotate(360deg); } } @keyframes fadeInText { from { opacity: 0; transform: scale(0.8); } to { opacity: 1; transform: scale(1); } }'

# Rename function
 =  -replace 'onVideoEnded', 'onAnimationEnded'

# Update JavaScript - replace video play with animation trigger
 =  -replace '// Avvia il video quando non è in modalità tracking\s+const video = Utils\.id\(''intro-video''\);\s+if \(video\) \{\s+video\.play\(\)\.catch\(e => \{\s+console\.log\(''Autoplay video bloccato:'', e\);\s+// Se l''autoplay è bloccato, mostra un pulsante per avviare il video\s+video\.style\.cursor = ''pointer'';\s+video\.addEventListener\(''click'', \(\) => \{\s+video\.play\(\);', '// Avvia l''animazione quando non è in modalità tracking\nsetTimeout(() => { Auth.onAnimationEnded(); }, 3500);'

# Update console log
 =  -replace "console\.log\('Video intro terminato, avvio il processo di login'\);", "console.log('Animazione intro terminata, avvio il processo di login');"

# Update comment
 =  -replace '// Non nascondere la schermata subito, aspetta la fine del video', '// Non nascondere la schermata subito, aspetta la fine dell''animazione'

# Write the file
Set-Content gipro.html -Value  -Encoding UTF8

Write-Host "File updated successfully"
