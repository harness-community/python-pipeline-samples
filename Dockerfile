FROM python:3.10.6-alpine
WORKDIR /py-sample-proj
ADD . /py-sample-proj
RUN pip install -r requirements.txt
CMD ["python" , "app.py"]
