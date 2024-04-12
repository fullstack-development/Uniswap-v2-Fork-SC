const { ethers } = require('ethers');
const fs = require('fs');
const path = require('path');

const jsonFilePath = path.resolve(__dirname, '../out/UniswapV2Pair.sol/UniswapV2Pair.json');

// Асинхронная функция для чтения ABI JSON файла и вычисления INIT_CODE_HASH
async function computeInitCodeHash() {
  try {
    // Чтение ABI JSON файла
    const contractJson = JSON.parse(fs.readFileSync(jsonFilePath, 'utf8'));
    
    // Проверка наличия байткода в ABI JSON файле
    if (!contractJson.bytecode.object) {
      throw new Error('Байткод не найден в ABI JSON файле.');
    }

    // Вычисление INIT_CODE_HASH с использованием байткода контракта
    const computedInitCodeHash = ethers.keccak256(contractJson.bytecode.object);
    
    // Вывод результата
    console.log('INIT_CODE_HASH:', computedInitCodeHash);
    return computedInitCodeHash;
  } catch (error) {
    console.error('Ошибка при вычислении INIT_CODE_HASH:', error);
  }
}

// Вызов функции
computeInitCodeHash();
