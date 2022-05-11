FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ARG SSH_PRIVATE_KEY
RUN mkdir ~/.ssh/
RUN echo "${SSH_PRIVATE_KEY}" > ~/.ssh/id_ed25519
RUN chmod 600 ~/.ssh/id_ed25519
RUN ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
RUN git config --global user.email "hamidrezabayat76@gmail.com" && git config --global user.name "Hamidreza Bayat"

CMD [ "python", "./src/main.py" ]