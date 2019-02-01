FROM localhost:32000/python:3
COPY . .
RUN pip install --index-url http://172.17.0.1:32001/simple --trusted-host 172.17.0.1 -r requirements.txt
CMD python hello-world.py
