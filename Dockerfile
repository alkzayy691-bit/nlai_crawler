FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN chmod 400 ssh-key
RUN eval "$(ssh-agent -s)" && ssh-add ssh-key

CMD [ "python", "./src/main.py" ]