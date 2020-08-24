
###########
conda的环境：  
```
conda create -n rasapip python=3/7  
conda activate rasapip  
```

###########
安装基础包  
```
pip install rasa
pip install rasa_nlu_gao
```

检查tf版本是不是1.14.0    
```
pip freeze |grep tensorflow  
tensorflow==1.14.0  
tensorflow-addons==0.7.1  
tensorflow-estimator==1.14.0  
tensorflow-hub==0.8.0  
tensorflow-probability==0.9.0  
```

下载源码  
https://github.com/killinux/rasa_bert  

cd rasa_bert  

下载 chinese_wwm_ext_L-12_H-768_A-12 的预训练模型到 rasa_bert/google下  
这里下载  
https://github.com/ymcui/Chinese-BERT-wwm#%E4%B8%AD%E6%96%87%E6%A8%A1%E5%9E%8B%E4%B8%8B%E8%BD%BD  

###################  
1 增加自己的intent  
```
vim  data/nlu/nlu.md  
```

2.fine-tune的训练：  
```
rasa train nlu -u data/nlu -c config.yml --out models/nlu   
```
如果有问题 仔细观察config.yml  配置中的内容  

模型生成到models/nlu中

3.用生成的模型起服务  
```
rasa run --enable-api -m  models/nlu/nlu-20200816-184316.tar.gz  -p 5500 --cors "*" --log-file out.log &   
```
4.测试：  
```
curl localhost:5500/model/parse -d '{"text":"你好"}‘|jq 
```

5.目录结构：
```
tree
.
├── Makefile
├── README.md
├── __init__.py
├── actions
│   ├── __pycache__
│   │   └── actions.cpython-37.pyc
│   └── actions.py
├── components
│   ├── __init__.py
│   ├── __pycache__
│   │   ├── __init__.cpython-37.pyc
│   │   ├── kashgari_entity_extractor.cpython-37.pyc
│   │   └── kashgari_intent_classifier.cpython-37.pyc
│   ├── kashgari_entity_extractor.py
│   └── kashgari_intent_classifier.py
├── config.yml
├── configs
│   └── endpoints.yml
├── data
│   ├── core
│   │   └── stories.md
│   └── nlu
│       └── nlu.md
├── domain.yml
├── google
│   └── chinese_wwm_ext_L-12_H-768_A-12
│       ├── bert_config.json
│       ├── bert_model.ckpt.data-00000-of-00001
│       ├── bert_model.ckpt.index
│       ├── bert_model.ckpt.meta
│       ├── chinese_wwm_ext_L-12_H-768_A-12.zip
│       └── vocab.txt
├── models
│   ├── 20200816-153124.tar.gz
│   └── nlu
│       ├── nlu-20200817-193941.tar.gz
│       ├── nlu-20200818-134939.tar.gz
│       ├── nlu-20200824-113059.tar.gz
│       └── nlu-20200824-143311.tar.gz
├── out.log
├── policy
│   ├── __init__.py
│   ├── __pycache__
│   │   ├── __init__.cpython-37.pyc
│   │   └── policy.cpython-37.pyc
│   └── policy.py
├── rasa_core.log
└── requirements.txt

```
