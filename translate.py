from fastapi import APIRouter
from app.models.schemas import TranslateRequest, TranslateResponse
from app.services.translation_engine import translate_text

router = APIRouter()

@router.post("", response_model=TranslateResponse)
def translate(req: TranslateRequest):
    return translate_text(req.text)
