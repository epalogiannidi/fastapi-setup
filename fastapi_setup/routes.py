from fastapi import APIRouter

from fastapi_setup import logger

router = APIRouter(prefix="/example", tags=["setup, turorial"])


@router.get("/welcome")
def welcome():
    logger.info("Get request @ /example/welcome")
    return {"message": "This is an example for a fast api setup"}
