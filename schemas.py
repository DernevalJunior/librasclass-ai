from pydantic import BaseModel
from typing import List

class TranslateRequest(BaseModel):
    text: str

class TranslateResponse(BaseModel):
    normalized: str
    gloss: str
    signs: List[str]
    animations: List[str]
    missing: List[str]

class LessonItem(BaseModel):
    text: str

class Lesson(BaseModel):
    id: int
    title: str
    subject: str
    items: List[LessonItem]
