
- [Running by command](#running-by-command)    
    - [require environment](#require-environment)    
    - [install python venv](#install-python-venv)   
    - [convert to test_venv](#convert-to-test_venv)   
    - [install packages](#install-packages)    
    - [set PYTHONPATH](#set-pythonpath)    
    - [train model](#train-model)    
    - [run model](#run-model)    
    - [test in cmdline](#test-in-cmdline)    
    - [test by http server](#test-by-http-server)    

## Running by command
### require environment
 - python >= 3.6

### install python venv
```
python3 -m venv test_venv
```

### convert to test_venv
```
source test_venv/bin/activate
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
some error:
ERROR: After October 2020 you may experience errors when installing or updating packages. This is because pip will change the way that it resolves dependency conflicts.

We recommend you use --use-feature=2020-resolver to test your packages with the new resolver before it becomes the default.

rasa 1.1.8 requires tensorflow~=1.13.0, which is not installed.
rasa 1.1.8 requires scikit-learn~=0.20.0, but you'll have scikit-learn 0.23.2 which is incompatible.
rasa 1.1.8 requires scikit-learn~=0.20.2, but you'll have scikit-learn 0.23.2 which is incompatible.
keras-bert 0.86.0 requires Keras>=2.4.3, but you'll have keras 2.2.4 which is incompatible.

### train model
```
make train
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

### test by http server
`http://localhost:5005/webhooks/rest/webhook` post请求，请求参数例如：
```
{
    "sender": "0001",
    "message": "你好"
}
```

