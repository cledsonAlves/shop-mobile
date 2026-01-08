#!/bin/bash

echo "🛍️  Jarinu Shop - Setup Script"
echo "==============================="
echo ""

# Check if Flutter is installed
if ! command -v flutter &> /dev/null
then
    echo "❌ Flutter não está instalado ou não está no PATH"
    echo "   Por favor, instale o Flutter: https://flutter.dev/docs/get-started/install"
    exit 1
fi

echo "✅ Flutter detectado: $(flutter --version | head -n 1)"
echo ""

# Clean previous builds
echo "🧹 Limpando builds anteriores..."
flutter clean

# Get dependencies
echo "📦 Instalando dependências..."
flutter pub get

if [ $? -ne 0 ]; then
    echo "❌ Erro ao instalar dependências"
    exit 1
fi

# Run code generation
echo "⚙️  Gerando código (Freezed, JSON Serializable, Retrofit, Riverpod)..."
echo "    Isso pode levar alguns minutos..."
flutter pub run build_runner build --delete-conflicting-outputs

if [ $? -ne 0 ]; then
    echo "❌ Erro na geração de código"
    exit 1
fi

echo ""
echo "✅ Setup concluído com sucesso!"
echo ""
echo "📱 Para executar o app:"
echo "   flutter run"
echo ""
echo "🔍 Para desenvolvimento com watch (auto-rebuild):"
echo "   flutter pub run build_runner watch --delete-conflicting-outputs"
echo ""
echo "🧪 Para executar testes:"
echo "   flutter test"
echo ""
