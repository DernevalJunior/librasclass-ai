import json
import os
import re
from typing import Dict, List, Tuple

DATA_DIR = os.path.join(os.path.dirname(__file__), "..", "data")

STOPWORDS = set([
    "vamos","vou","vai","estou","esta","está","um","uma","o","a","os","as","do","da","dos","das",
    "de","para","pra","por","em","no","na","nos","nas","e"
])

def _normalize_text(text: str) -> str:
    text = text.lower().strip()
    text = re.sub(r"[\.,;:!?\(\)\[\]\{\}\"\']", " ", text)
    text = re.sub(r"\s+", " ", text).strip()
    return text

def _normalize_token(token: str) -> str:
    token = token.lower().strip()
    token = re.sub(r"[\.,;:!?\(\)\[\]\{\}\"\']", "", token)
    token = token.replace("ç", "c")
    token = token.replace("á","a").replace("à","a").replace("ã","a").replace("â","a")
    token = token.replace("é","e").replace("ê","e")
    token = token.replace("í","i")
    token = token.replace("ó","o").replace("ô","o").replace("õ","o")
    token = token.replace("ú","u")
    return token

def _load_sign_index() -> Dict[str, dict]:
    path = os.path.join(DATA_DIR, "signs.json")
    with open(path, "r", encoding="utf-8") as f:
        signs = json.load(f)
    index: Dict[str, dict] = {}
    for s in signs:
        index[_normalize_token(s["word_pt"])] = s
    return index

def translate_text(text: str) -> dict:
    index = _load_sign_index()
    normalized = _normalize_text(text)
    raw_tokens = normalized.split(" ")
    tokens = [t for t in raw_tokens if t and t not in STOPWORDS]

    gloss_tokens: List[str] = []
    signs: List[str] = []
    animations: List[str] = []
    missing: List[str] = []

    for t in tokens:
        nt = _normalize_token(t)
        s = index.get(nt)
        if s:
            gloss_tokens.append(s["gloss"])
            signs.append(nt)
            animations.append(s["animation"])
        else:
            missing.append(t)
            signs.append(f"spell:{t}")
            animations.append("spell")
            gloss_tokens.append(t.upper())

    return {
        "normalized": normalized,
        "gloss": " ".join(gloss_tokens),
        "signs": signs,
        "animations": animations,
        "missing": missing,
    }
