python3 classifier_nn.py --save --balanced=true --epochs=300
python3 classifier_nn.py --save --load --balanced=false
python3 eval.py
