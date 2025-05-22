echo "Downloading HERE SDK from Google Drive..."

FILE_ID=1y7WC1Fj_Ok3hTbd4J0Th2ZsHqCvLhSMJ
FILE_NAME=heresdk.zip

# Google Drive’dan indirme
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${FILE_ID}" > temp.html
CONFIRM_CODE=$(grep -o 'confirm=[^&]*' temp.html | sed 's/confirm=//')
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=${CONFIRM_CODE}&id=${FILE_ID}" -o ${FILE_NAME}

# Temizleme ve unzip işlemi
rm -f temp.html cookie
unzip -q ${FILE_NAME} -d WfmUser/SDKs/HERESDK/
rm ${FILE_NAME}

echo "HERE SDK ready."
