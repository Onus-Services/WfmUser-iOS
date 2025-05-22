#!/bin/bash

set -e  # Script hata durumunda dursun

# Script'in çalıştığı dizinden proje root'una geç
cd "$(dirname "$0")/.."

echo "Current working directory: $(pwd)"
echo "Downloading HERE SDK from GitHub Releases..."

DOWNLOAD_URL="https://github.com/Onus-Services/WfmUser-iOS/releases/download/0.0.0.1/heresdk.zip"
DESTINATION="ThirdParty/HERESDK"
EXPECTED_FRAMEWORK_PATH="$DESTINATION/heresdk/frameworks/heresdk.xcframework"

# Eski dosyaları temizle
rm -rf "$DESTINATION"
rm -f heresdk.zip

echo "Creating destination directory: $DESTINATION"
mkdir -p "$DESTINATION"

# ZIP dosyasını indir
echo "Downloading from: $DOWNLOAD_URL"
curl -L -o heresdk.zip "$DOWNLOAD_URL"

# ZIP dosyası boyutunu kontrol et
FILESIZE=$(stat -f%z heresdk.zip 2>/dev/null || stat -c%s heresdk.zip)
echo "Downloaded file size: $FILESIZE bytes"

if [ "$FILESIZE" -eq 0 ]; then
    echo "Error: Downloaded file is empty!"
    exit 1
fi

# ZIP geçerliliğini kontrol et
if unzip -t heresdk.zip >/dev/null 2>&1; then
    echo "ZIP file is valid, extracting to $DESTINATION..."
    unzip -o heresdk.zip -d "$DESTINATION"
    
    echo "Extraction completed. Listing directory structure:"
    find "$DESTINATION" -type d -name "*.xcframework" 2>/dev/null || echo "No .xcframework directories found"
    
    # Dizin yapısını kontrol et ve debug bilgisi ver
    echo "Full directory structure of $DESTINATION:"
    ls -la "$DESTINATION" || echo "Cannot list $DESTINATION"
    
    # Eğer heresdk klasörü varsa içeriğini göster
    if [ -d "$DESTINATION/heresdk" ]; then
        echo "Contents of $DESTINATION/heresdk:"
        ls -la "$DESTINATION/heresdk"
        
        if [ -d "$DESTINATION/heresdk/frameworks" ]; then
            echo "Contents of $DESTINATION/heresdk/frameworks:"
            ls -la "$DESTINATION/heresdk/frameworks"
        fi
    fi
    
    # Beklenen konumda framework var mı kontrol et
    if [ -d "$EXPECTED_FRAMEWORK_PATH" ]; then
        echo "✅ HERE SDK XCFramework found at expected location: $EXPECTED_FRAMEWORK_PATH"
    else
        echo "❌ XCFramework not found at expected location: $EXPECTED_FRAMEWORK_PATH"
        
        # Alternatif konumları ara
        echo "Searching for .xcframework files in extracted content:"
        find "$DESTINATION" -name "*.xcframework" -type d 2>/dev/null
        
        # Eğer farklı bir konumda bulunursa taşımayı dene
        FOUND_FRAMEWORK=$(find "$DESTINATION" -name "heresdk.xcframework" -type d | head -1)
        if [ -n "$FOUND_FRAMEWORK" ]; then
            echo "Found framework at: $FOUND_FRAMEWORK"
            echo "Moving to expected location..."
            
            # Gerekli dizinleri oluştur
            mkdir -p "$DESTINATION/heresdk/frameworks"
            
            # Framework'ü doğru konuma taşı
            mv "$FOUND_FRAMEWORK" "$DESTINATION/heresdk/frameworks/"
            echo "✅ Framework moved to: $EXPECTED_FRAMEWORK_PATH"
        else
            echo "❌ No heresdk.xcframework found in extracted content!"
            exit 1
        fi
    fi
    
    echo "HERE SDK setup completed successfully."
else
    echo "Error: heresdk.zip is not a valid zip file!"
    
    # Debug için dosya tipini kontrol et
    file heresdk.zip 2>/dev/null || echo "Cannot determine file type"
    
    # İlk birkaç byte'ı kontrol et (HTML error sayfası olabilir)
    echo "First 100 characters of downloaded file:"
    head -c 100 heresdk.zip 2>/dev/null || echo "Cannot read file content"
    
    exit 1
fi

# Temizlik
rm -f heresdk.zip

echo "Script completed successfully."
