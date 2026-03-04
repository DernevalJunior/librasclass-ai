from fastapi import APIRouter
from app.models.schemas import Lesson, LessonItem
from typing import List

router = APIRouter()

LESSONS: List[Lesson] = [
    Lesson(id=1, title="Matemática - Frações", subject="matematica", items=[
        LessonItem(text="Bom dia, turma"),
        LessonItem(text="Hoje vamos estudar frações"),
        LessonItem(text="Abram o caderno"),
        LessonItem(text="Copiem o exercício"),
    ])
]

@router.get("")
def list_lessons():
    return LESSONS

@router.post("")
def create_lesson(lesson: Lesson):
    new_id = max([l.id for l in LESSONS] + [0]) + 1
    lesson.id = new_id
    LESSONS.append(lesson)
    return lesson
