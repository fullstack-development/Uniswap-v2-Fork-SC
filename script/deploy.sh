#!/bin/bash

# Загрузка переменных из .env файла
if [ -f ".env" ]; then
  while IFS='=' read -r key value; do
    # Удаление кавычек в начале и в конце значения
    value=$(echo "$value" | cut -d "'" -f 2)
    if [[ $key != '' && $key != \#* ]]; then
      export "$key=$value"
      echo "Exported: $key=$value"
    fi
  done < ".env"
else
  echo ".env файл не найден"
  exit 1
fi

# Проверка наличия необходимых переменных
echo "PRIVATE_KEY is: '$PRIVATE_KEY'"
echo "POLYSCAN_API_KEY is: '$POLYSCAN_API_KEY'"

if [ -z "$PRIVATE_KEY" ]; then
  echo "Ошибка: переменная PRIVATE_KEY не установлена."
  exit 1
fi

if [ -z "$POLYSCAN_API_KEY" ]; then
  echo "Ошибка: переменная POLYSCAN_API_KEY не установлена."
  exit 1
fi

# Получаем адрес как первый аргумент командной строки
ADDRESS=$1

# Определение массива с параметрами
declare -a TOKENS=("src/erc-20-tokens/ARB.sol:ARB" "src/erc-20-tokens/DAI.sol:DAI" "src/erc-20-tokens/GRT.sol:GRT" "src/erc-20-tokens/LINK.sol:LINK" "src/erc-20-tokens/Maker.sol:Maker" "src/erc-20-tokens/METALAMP.sol:METALAMP" "src/erc-20-tokens/TRX.sol:TRX" "src/erc-20-tokens/TUSD.sol:TUSD" "src/erc-20-tokens/USDC.sol:USDC" "src/erc-20-tokens/USDT.sol:USDT")

# Цикл по массиву TOKENS
for TOKEN in "${TOKENS[@]}"; do
  CONTRACT_NAME=$(echo "$TOKEN" | cut -d ':' -f 2)
  CONTRACT_PATH=$(echo "$TOKEN" | cut -d ':' -f 1)
  echo "Deploying contract: $CONTRACT_NAME (Path: $CONTRACT_PATH)"
  forge create ${TOKEN} --rpc-url zkEVMPolygonTestnet --private-key ${PRIVATE_KEY} --constructor-args "${ADDRESS}" --verify --etherscan-api-key ${POLYSCAN_API_KEY}
done
