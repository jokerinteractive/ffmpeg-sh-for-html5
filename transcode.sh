## Transcode shell

# Uncomment this and the last two lines to put results to S3 bucket (Requires configures s3cmd)
#bucket=''

transcode=$(date +"%d-%m-%Y-transcode-$1")
threads='4'

mkdir $transcode

# iPhone 480x272

#ffmpeg -i "$1" -s 480x272 -aspect 480:272 -r 30000/1001 -b 360k -bt 416k -vcodec libx264 -threads $threads -pass 1 -vpre medium_firstpass -an "$transcode/$1"-480x272.mp4 && ffmpeg -y -i "$1" -s 480x272 -aspect 480:272 -r 30000/1001 -b 360k -bt 416k -vcodec libx264 -threads $threads -pass 2 -vpre medium -acodec libmp3lame -ab 64k "$transcode/$1"-480x272.mp4

## MP4 Web

#ffmpeg -i "$1" -s 640x352 -aspect 640:352 -r 30000/1001 -b 360k -bt 416k -vcodec libx264 -threads $threads -pass 1 -vpre medium_firstpass -an "$transcode/$1"-640x352.mp4 && ffmpeg -y -i "$1" -s 640x352 -aspect 640:352 -r 30000/1001 -b 360k -bt 416k -vcodec libx264 -threads $threads -pass 2 -vpre medium -acodec libmp3lame -ac 2 -ar 44100 -ab 64k "$transcode/$1"-640x352.mp4
#ffmpeg -i "$1" -s 864x480 -aspect 864:480 -r 30000/1001 -b 360k -bt 416k -vcodec libx264 -threads $threads -pass 1 -vpre medium_firstpass -an "$transcode/$1"-864x480.mp4 && ffmpeg -y -i "$1" -s 864x480 -aspect 864:480 -r 30000/1001 -b 360k -bt 416k -vcodec libx264 -threads $threads -pass 2 -vpre medium -acodec libmp3lame -ac 2 -ar 44100 -ab 96k "$transcode/$1"-864x480.mp4
#ffmpeg -i "$1" -s 1280x720 -aspect 1280:720 -r 30000/1001 -b 360k -bt 416k -vcodec libx264 -threads $threads -pass 1 -vpre medium_firstpass -an "$transcode/$1"-1280x720.mp4 && ffmpeg -y -i "$1" -s 1280x720 -aspect 1280:720 -r 30000/1001 -b 360k -bt 416k -vcodec libx264 -threads $threads -pass 2 -vpre medium -acodec libmp3lame -ac 2 -ar 44100 -ab 128k "$transcode/$1"-1280x720.mp4
ffmpeg -i "$1" -s 1920x1080 -aspect 1920:1080 -r 30000/1001 -b 360k -bt 416k -vcodec libx264 -threads $threads -pass 1 -vpre medium_firstpass -an "$transcode/$1"-1920x1080.mp4 && ffmpeg -y -i "$1" -s 1920x1080 -aspect 1920:1080 -r 30000/1001 -b 360k -bt 416k -vcodec libx264 -threads $threads -pass 2 -vpre medium -acodec libmp3lame -ac 2 -ar 44100 -ab 256k "$transcode/$1"-1920x1080.mp4


## WebM
#ffmpeg -i "/home/user/input_video.mpg" -codec:v libvpx -quality good -cpu-used 0 -b:v 600k -qmin 10 -qmax 42 -maxrate 500k -bufsize 1000k -threads 2 -vf scale=-1:480 -an -pass 1 -f webm /dev/null
#ffmpeg -i "/home/user/input_video.mpg" -codec:v libvpx -quality good -cpu-used 0 -b:v 600k -qmin 10 -qmax 42 -maxrate 500k -bufsize 1000k -threads 2 -vf scale=-1:480 -codec:a libvorbis -b:a 128k -pass 2 -f webm output.webm


## OGG

#ffmpeg -y -i "$1" -s 640x352 -aspect 640:352 -r 30000/1001 -b 360k -bt 416k -vcodec libtheora -threads $threads -acodec libvorbis -ac 2 -ar 44100 -ab 64k "$transcode/$1"-640x352.ogg
#ffmpeg -y -i "$1" -s 864x480 -aspect 864:480 -r 30000/1001 -b 360k -bt 416k -vcodec libtheora -threads $threads -acodec libvorbis -ac 2 -ar 44100 -ab 96k "$transcode/$1"-864x480.ogg
#ffmpeg -y -i "$1" -s 1280x720 -aspect 1280:720 -r 30000/1001 -b 360k -bt 416k -vcodec libtheora -threads $threads -acodec libvorbis -ac 2 -ar 44100 -ab 128k "$transcode/$1"-1280x720.ogg
ffmpeg -y -i "$1" -s 1920x1080 -aspect 1920:1080 -r 30000/1001 -b 360k -bt 416k -vcodec libtheora -threads $threads -acodec libvorbis -ac 2 -ar 44100 -ab 256k "$transcode/$1"-1920x1080.ogg


## FLV (Fallback) Formats

#ffmpeg -i "$1" -s 640x352 -aspect 640:352 -r 30000/1001 -b 360k -bt 416k -vcodec libx264 -threads $threads -pass 1 -vpre medium_firstpass -an "$transcode/$1"-640x352.flv && ffmpeg -y -i "$1" -s 640x352 -aspect 640:352 -r 30000/1001 -b 360k -bt 416k -vcodec libx264 -threads $threads -pass 2 -vpre medium -acodec libmp3lame -ac 2 -ar 44100 -ab 64k "$transcode/$1"-640x352.flv
#ffmpeg -i "$1" -s 864x480 -aspect 864:480 -r 30000/1001 -b 360k -bt 416k -vcodec libx264 -threads $threads -pass 1 -vpre medium_firstpass -an "$transcode/$1"-864x480.flv && ffmpeg -y -i "$1" -s 864x480 -aspect 864:480 -r 30000/1001 -b 360k -bt 416k -vcodec libx264 -threads $threads -pass 2 -vpre medium -acodec libmp3lame -ac 2 -ar 44100 -ab 96k "$transcode/$1"-864x480.flv
#ffmpeg -i "$1" -s 1280x720 -aspect 1280:720 -r 30000/1001 -b 360k -bt 416k -vcodec libx264 -threads $threads -pass 1 -vpre medium_firstpass -an "$transcode/$1"-1280x720.flv && ffmpeg -y -i "$1" -s 1280x720 -aspect 1280:720 -r 30000/1001 -b 360k -bt 416k -vcodec libx264 -threads $threads -pass 2 -vpre medium -acodec libmp3lame -ac 2 -ar 44100 -ab 128k "$transcode/$1"-1280x720.flv
ffmpeg -i "$1" -s 1920x1080 -aspect 1920:1080 -r 30000/1001 -b 360k -bt 416k -vcodec libx264 -threads $threads -pass 1 -vpre medium_firstpass -an "$transcode/$1"-1920x1080.flv && ffmpeg -y -i "$1" -s 1920x1080 -aspect 1920:1080 -r 30000/1001 -b 360k -bt 416k -vcodec libx264 -threads $threads -pass 2 -vpre medium -acodec libmp3lame -ac 2 -ar 44100 -ab 256k "$transcode/$1"-1920x1080.flv

## MP3

#ffmpeg -i "$1" -acodec libmp3lame -threads $threads -ac 2 -ab 128k -vn -y "$transcode/$1"-128k.mp3
#ffmpeg -i "$1" -acodec libmp3lame -threads $threads -ac 2 -ab 256k -vn -y "$transcode/$1"-256k.mp3

# Cleanup

#mv $1 "$transcode/original-$1"

#s3cmd put -r $transcode $bucket
#rm -r $transcode
