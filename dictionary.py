import json
import os
from fastapi import APIRouter, Query
from typing import List, Optional

router = APIRouter()
DATA_DIR = os.path.join(os.path.dirname(__file__), "..", "data")

@router.get("/signs")
def list_signs(category: Optional[str] = Query(default=None)):
    with open(os.path.join(DATA_DIR, "signs.json"), "r", encoding="utf-8") as f:
        items = json.load(f)
    if category:
        items = [i for i in items if i.get("category") == category]
    return items

@router.get("/phrases")
def list_phrases(category: Optional[str] = Query(default=None)):
    with open(os.path.join(DATA_DIR, "phrases.json"), "r", encoding="utf-8") as f:
        items = json.load(f)
    if category:
        items = [i for i in items if i.get("category") == category]
    return items
