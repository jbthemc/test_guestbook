FROM python:3.4

ARG GIT_REPO
ARG GIT_BRANCH
ARG PRIVATE_KEY

ENV GIT_REPO=${GIT_REPO}
ENV GIT_BRANCH=${GIT_BRANCH}

ADD . /code
WORKDIR /code

RUN eval $(ssh-agent -s)
RUN "echo '' | ssh-add <(echo \"${PRIVATE_KEY}\")"
RUN git clone --single-branch -b ${GIT_BRANCH} ${GIT_REPO}
RUN pip install -r requirements.txt

CMD ["python", "app.py"]