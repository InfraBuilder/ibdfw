VER=$(( $(grep "^version:" snapcraft.yaml| grep -o "[1-9][0-9]*") + 1 ))
echo "Building version $VER"
sed -i "s/version: .*/version: '0.0.$VER'/" snapcraft.yaml
#snapcraft clean ibdfw -s pull
snapcraft
rm -rf parts/ prime/ stage/
