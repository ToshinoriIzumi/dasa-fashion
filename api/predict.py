import os
from PIL import Image

import torch.nn as nn
from torch.autograd import Variable
import torch

import torchvision.transforms as transforms
import torchvision.models as models

from flask import Flask, jsonify, request

app = Flask(__name__)

def image_loader(image_name, test_loader):
    image = Image.open(image_name).convert("RGB")
    image = test_loader(image)
    image = Variable(image, requires_grad=True)
    image = image.unsqueeze(0)
    return image.cpu()

def predict_image(image_path):
    model = models.resnet18()
    model.fc = nn.Linear(512, 2)
    model.load_state_dict(torch.load('./fashion_check_model.pth'))
    model.cpu()
    model.eval()
    imsize = 256
    test_loader = transforms.Compose([
                                    transforms.Resize((imsize, imsize)),
                                    transforms.ToTensor(),
                                    transforms.Normalize(0.5, 0.5)
                                ])
    softmax = nn.Softmax(dim=1)
    image = image_loader(image_path, test_loader=test_loader)
    return softmax(model(image)).detach().numpy()[0][1] * 100

@app.route("/", methods=["POST"])
def index():
    image = request.files['image']
    file_name = os.path.join('img', 'upload.jpg')
    image.save(file_name)
    return jsonify({"point": predict_image(file_name)})

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8888, debug=True)