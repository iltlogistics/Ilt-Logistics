import codecs

# Read the file
with codecs.open('gipro.html', 'r', 'utf-8') as f:
    content = f.read()

# Replace video element with animation
content = content.replace('<video class="intro-video" autoplay muted playsinline onended="Auth.onVideoEnded()">', '<div class="intro-animation"><div class="truck-container"><div class="truck"><div class="truck-body"></div><div class="truck-cab"></div><div class="truck-wheels"><div class="wheel"></div><div class="wheel"></div></div></div></div><div class="intro-text">ILT LOGISTICS</div></div>')

# Remove video source and closing tag
content = content.replace('<source src="loading-video.mp4.mp4" type="video/mp4">Il tuo browser non supporta il video.</video>', '')

# Write the file
with codecs.open('gipro.html', 'w', 'utf-8') as f:
    f.write(content)

print("Step 1: Video element replaced with animation")
