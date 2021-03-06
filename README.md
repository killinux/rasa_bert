
- [Running by command](#running-by-command)    
    - [require environment](#require-environment)    
    - [install python venv](#install-python-venv)   
    - [convert to test_venv](#convert-to-test_venv)   
    - [install packages](#install-packages)    
    - [set PYTHONPATH](#set-pythonpath)    
    - [train model](#train-model)    
    - [run model](#run-model)  
    - [test](#test)    
    - [起服务](#起服务) 
    - [客户端](#客户端) 
    - [参考我的博客](#参考我的博客)    
## 说明
- rasa-nlu 使用bert的例子,先train进行自定义预料的fine-tune，在用rasa启动nlu服务
- 需要自己下载bert的预训练模型chinese_wwm_ext_L-12_H-768_A-1 
- https://github.com/ymcui/Chinese-BERT-wwm#%E4%B8%AD%E6%96%87%E6%A8%A1%E5%9E%8B%E4%B8%8B%E8%BD%BD
- 放到代码中的google目录下，具体检查配置文件config.yml
- 自定义预料放在data/nlu/nlu.md中 配置intent和对应的话术

## Running by command
### require environment
 - python == 3.7

### install python venv
```
conda create -n rasa_bert python=3.7
```

### convert to test_venv
```
conda activate rasa_bert
```

### install packages
```
pip install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple/
#in linux
pip uninstall tensorflow
pip install tensorflow-gpu=1.14.0
#in mac
pip install tensorflow==1.14.0
#in all
pip install kashgari-tf==0.5.5 -i https://mirrors.aliyun.com/pypi/simple/
```

### set PYTHONPATH
```
export PYTHONPATH=/path/to/your/component
export PYTHONPATH=/opt/mt/rasa/rasa_bert/components
```
上面完成后所需要的环境就搭建完成，下面就可以开始训练了，当然你需要在config.yml里面将bert的预训练路径指定下。
这个不需要也可以，看是否能找到源码下的component目录即可

###some error when you install kashgari-tf in linux:
```
ERROR: After October 2020 you may experience errors when installing or updating packages. This is because pip will change the way that it resolves dependency conflicts.

We recommend you use --use-feature=2020-resolver to test your packages with the new resolver before it becomes the default.

rasa 1.1.8 requires tensorflow~=1.13.0, which is not installed.
rasa 1.1.8 requires scikit-learn~=0.20.0, but you'll have scikit-learn 0.23.2 which is incompatible.
rasa 1.1.8 requires scikit-learn~=0.20.2, but you'll have scikit-learn 0.23.2 which is incompatible.
keras-bert 0.86.0 requires Keras>=2.4.3, but you'll have keras 2.2.4 which is incompatible.
```

### train model
```
make train
如果只训练nlu：
rasa train nlu -u data/nlu -c config.yml --out models/nlu
```
训练nlu和core模型，新版本中会将模型自动打包成zip文件。

### run model
```
make run
```

### test in cmdline
```
make run-cmdline
```
可以在命令行中测试



### test:
```
 rasa shell -m models/nlu/nlu-20200816-165652.tar.gz
```

### 起服务:
```
export PYTHONPATH=/opt/mt/rasa/rasa_bert/components

rasa run --enable-api -m  models/nlu/nlu-20200816-165652.tar.gz
或：
rasa run --enable-api -m  models/nlu/nlu-20200818-134939.tar.gz -p 5500 --cors "*" --log-file out.log &
```
### 客户端：
```
curl localhost:5005/model/parse -d '{"text":"你好"}'|jq
```


### 参考我的博客：
https://www.iteye.com/blog/haoningabc-2516308
简易安装参考 INSTALL.md 注意tensorflow要用1.14.0的版本
检查 
pip freeze|grep tensorflow
