#! /bin/bash

#source "../config/config.sh"

echo "Bienvenido, formatos aceptados:" 
echo ".mp4, .jpg, .png, .json, .pdf, .txt"
echo "escribe una url: "
read url

download_files() {
  	local date_time=$(date +"%Y-%m-%d %H:%M:%S")

  	while IFS= read -r url; do
    		if [[ $url == *".mp4"* ]]; then
      			wget -P "$VIDEO_DIR" "$url"
    		elif [[ $url == *".jpg"* ]] || [[ $url == *".png"* ]]; then
      			wget -P "$PHOTO_DIR" "$url"
    		else
      			wget -P "$FILE_DIR" "$url"
		fi
  	done < "$url_file"
  	echo "[$date_time] [INFO] [DownloadManager] Download completed" | tee -a ../logs/download.log
}

download_files "$url"
