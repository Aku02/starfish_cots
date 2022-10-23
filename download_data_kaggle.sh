%%bash
WORK_DIR="/kaggle/working"
pip uninstall -y kaggle
pip install kaggle --upgrade

echo "
{
    \"username\":\"ptran1203\",
    \"key\":\"e83c5d942e46aa444be4791d71c47e93\"
}
" > kaggle.json

if [ ! -d ~/.kaggle ]; then
    mkdir ~/.kaggle
    cp kaggle.json ~/.kaggle/
    chmod 600 ~/.kaggle/kaggle.json
fi


function download2 {
  if [ -d $1.zip ]; then
    echo "Unzipping data..."
        unzip -q $1.zip -d $WORK_DIR/$1
    elif [ ! -d $WORK_DIR/$1 ]; then
        kaggle datasets download -d ptran1203/$1
        echo "Unzipping data..."
        unzip -q $1.zip -d $WORK_DIR/$1
        rm $1.zip
    fi
}

download2 "yolov5-cots"