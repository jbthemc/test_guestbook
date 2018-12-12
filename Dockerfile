FROM python:3.4

ARG GIT_REPO
ARG GIT_BRANCH
ARG PRIVATE_KEY

ENV GIT_REPO=${GIT_REPO}
ENV GIT_BRANCH=${GIT_BRANCH}

# Partea asta seteaza WORKING DIRECTORY -> /code (toate comenzile se vor executa in /code)
WORKDIR /code

RUN mkdir ~/.ssh/ && echo "${PRIVATE_KEY}" > ~/.ssh/id_rsa && chmod 600 ~/.ssh/id_rsa
RUN echo 'Host *\n  StrictHostKeyChecking no' > ~/.ssh/config
RUN eval $(ssh-agent -s) && ssh-add ~/.ssh/id_rsa && git clone --single-branch -b ${GIT_BRANCH} ${GIT_REPO} .
RUN pip install -r requirements.txt

CMD ["python", "app.py"]

