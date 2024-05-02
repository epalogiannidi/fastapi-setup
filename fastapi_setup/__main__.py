import uvicorn
from fastapi import FastAPI

from fastapi_setup import api_config, routes

app = FastAPI()
app.include_router(routes.router)

if __name__ == "__main__":
    uvicorn.run(app, host=api_config["host"], port=api_config["port"])
