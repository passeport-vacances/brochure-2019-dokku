FROM python:3-stretch

LABEL maintainer="jacques@supcik.net"

RUN apt-get update && apt-get install -y \
      git wget curl unzip \
      texlive \
      texlive-latex-extra \
      texlive-xetex \
      texlive-lang-french \
      latexmk \
      fontconfig \
  && python -m pip install --upgrade pip setuptools

COPY fonts/* /usr/local/share/fonts/
RUN fc-cache -fv

RUN python -m pip install \
  git+https://github.com/passeport-vacances/brochure-2019@v1.1.4 \
  gunicorn

COPY app /app
WORKDIR /app

ENTRYPOINT []
CMD ["bin/run-dev.sh"]
