
FROM ubuntu:latest
MAINTAINER Tuan Thai "tuanthai@example.com"


RUN apt update -y
RUN apt install -y python3-pip python3-venv python3-dev build-essential

ADD . /flask_app
WORKDIR /flask_app

RUN python3 -m venv venv
RUN . venv/bin/activate && pip install --upgrade pip && pip install -r requirements.txt

ENV PATH="/flask_app/venv/bin:$PATH"

ENTRYPOINT ["python3"]
CMD ["flask_docker.py"]
