from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.routes.translate import router as translate_router
from app.routes.dictionary import router as dictionary_router
from app.routes.lessons import router as lessons_router

app = FastAPI(title="LibrasClass AI API", version="0.1.0")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(translate_router, prefix="/translate", tags=["translate"])
app.include_router(dictionary_router, prefix="/dictionary", tags=["dictionary"])
app.include_router(lessons_router, prefix="/lessons", tags=["lessons"])

@app.get("/health")
def health():
    return {"status": "ok"}
