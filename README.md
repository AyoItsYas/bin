# Setting Up
```
cd /home/$USER/
git clone https://github.com/AyoItsYas/bin.git
chmod +x /home/$USER/bin/*
echo "export PATH="/home/$USER/bin:$PATH" >> /home/$USER/.profile # or .zshrc, .profile, etc.
source /home/$USER/.profile
```

# Usage
Batch file operation utility usage examples,
```
find . | grep .mp4 | batch-x265-encoder | batch-rm >> log.txt
find . | grep .png | batch-heic-encoder
find . | grep .pyc | batch-rm
find . | batch-rename -p "x.replace('something', '') + f'count-{i}'"
```
