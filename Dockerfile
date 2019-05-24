FROM python:3.6-slim

LABEL "com.github.actions.name"="ghub"
LABEL "com.github.actions.description"="Run ghub"
LABEL "com.github.actions.icon"="check-square"
LABEL "com.github.actions.color"="green"

LABEL "repository"="https://github.com/smehboub/ghub"
LABEL "maintainer"="smehboub <sophiemehboub@gmail.com>"

RUN pip install ghub

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
