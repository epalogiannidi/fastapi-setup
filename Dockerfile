FROM python:3.12.3-slim-bullseye

RUN  apt-get update && apt-get install -y build-essential

# Install & use pipenv
COPY Pipfile Pipfile.lock ./
RUN python -m pip install --upgrade pip
RUN pip install setuptools
RUN pip install pipenv && pipenv install --system --deploy
RUN pip install colorlog
RUN pip install python-multipart

# Set up the work directory
WORKDIR .
COPY ./fastapi_setup /fastapi_setup
COPY ./configs /configs

# Expose the api
EXPOSE 8000
CMD ["uvicorn", "fastapi_setup.__main__:app", "--host", "0.0.0.0", "--port", "8000"]
