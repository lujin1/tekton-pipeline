import requests
from requests.auth import HTTPBasicAuth
import json


# r = requests.get('https://harbor.com/api/labels/1', auth=HTTPBasicAuth('test', 'Test123456'))
# print (r.json())

def addImageLabel(image_label_url, label):
    try:
        r = requests.post(image_label_url, data=json.dumps(label), auth=HTTPBasicAuth(harbor_username, harbor_password))
        print(r.text)
    except Exception as e:
        print(e)


def addChartLabel(chart_label_url, label):
    try:
        r = requests.post(chart_label_url, data=json.dumps(label), auth=HTTPBasicAuth(harbor_username, harbor_password))
        print(r.status_code)
    except Exception as e:
        print(e)


if __name__ == "__main__":
    harbor_url = "https://harbor.com"
    harbor_username = ""
    harbor_password = ""
    image_repo = "library/api"
    image_version = "1.1.0.2"
    chart_repo = "library"
    chart_name = "api"
    chart_version = "1.3.1"
    image_label_url = harbor_url + "/api/repositories/" + image_repo + "/tags/" + image_version + "/labels"
    chart_label_url = harbor_url + "/api/chartrepo/" + chart_repo + "/charts/" + chart_name + "/" + chart_version + "/labels"
    label = {'id': 1}
    addImageLabel(image_label_url, label)
    addChartLabel(chart_label_url, label)
