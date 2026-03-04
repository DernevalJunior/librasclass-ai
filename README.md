# LibrasClass AI — Projeto pronto para programar (Starter Kit)

Este pacote contém:
- `app_flutter/` — App Flutter (UI + chamadas de API + estrutura de telas)
- `backend_fastapi/` — API FastAPI (tradução MVP, dicionário, aulas)
- `unity_avatar/` — estrutura mínima do Unity (scripts e contrato JSON)

## Requisitos
- Flutter 3.x
- Python 3.11+
- Unity 2022 LTS+

## Como rodar (local)
### Backend
```bash
cd backend_fastapi
python -m venv .venv
source .venv/bin/activate  # Windows: .venv\Scripts\activate
pip install -r requirements.txt
uvicorn app.main:app --reload
```

### App
```bash
cd app_flutter
flutter pub get
flutter run
```

> Android Emulator usa `http://10.0.2.2:8000`. Ajuste em `app_flutter/lib/services/api_config.dart` para dispositivo físico.

## Unity
Veja `unity_avatar/README_UNITY.md`.
