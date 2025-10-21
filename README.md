# 🎬 Rick and Morty App

Aplicação Flutter que consome a [Rick and Morty API](https://rickandmortyapi.com), exibindo personagens com padrão **MVVM** e testes automatizados.

## ✅ O que foi entregue

- ✅ Consumo da API com páginação
- ✅ Listagem de personagens
- ✅ Detalhes dos personagens
- ✅ Arquitetura MVVM limpa e escalável
- ✅ Interface responsiva (mobile/tablet/desktop)
- ✅ testes automatizados
- ✅ Tratamento de erros
- ✅ Rate limiting (300 req/min)

## 🚀 Quick Start

```bash
# Instalar dependências
flutter pub get

# Executar
flutter run

# Rodar testes
flutter test
```

## 📁 Estrutura

```
lib/
├── domain/          # Modelos e enums
├── data/            # Repositórios e API
├── ui/
│     ├── core/      # Temas e widgets
└── core/            # Serviços e utilidades
```

## 🛠 Tech Stack

- Flutter 3.32.5 | Dart 3.8.1
- Dio (HTTP Client)
- GetIt (Dependency Injection)
- Mocktail (Testes)

## 🏗 Arquitetura

3 camadas bem separadas:
- **Domain**: Modelos, enums
- **Data**: repositórios
- **UI**: ViewModels com ChangeNotifier, widgets, telas e temas


## 📱 Responsividade

Grid adaptativa:
- Mobile: 1 coluna
- Tablet: 2 colunas
- Desktop: 3+ colunas

## 🔒 Tratamento de Erros

- TimeoutException → "Tempo esgotado"
- SocketException → "Sem conexão"
- TypeError → "Erro de tipo"
- Erros customizados tratados

## ⏱ Rate Limiting

Máximo 300 requisições/minuto. Reseta automaticamente a cada minuto.

## 📞 Autor

- 🔗 [LinkedIn](https://www.linkedin.com/in/lucas-gean-dos-santos/)

## 🎥 Demonstração

Assista ao vídeo de demonstração completa da aplicação:



---


