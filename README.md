
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
    - [后续的话](#后续的话)

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
pip install kashgari-tf==0.5.5 -i https://mirrors.aliyun.com/pypi/simple/
```

### set PYTHONPATH
```
export PYTHONPATH=/path/to/your/component
 export PYTHONPATH=/opt/mt/rasa/rasa50/components
```
上面完成后所需要的环境就搭建完成，下面就可以开始训练了，当然你需要在config.yml里面将bert的预训练路径指定下。

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
可以使用postman去请求调用。

