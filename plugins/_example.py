"""示例默认不加载。复制为 custom_temperature.py 可在无 Python 的便携包中启用。
插件是可信本地 Python 代码，拥有与主程序相同权限，请勿加载不可信文件。
"""
from monitoring.models import Instrument
from monitoring.instruments import number


def calculate(context):
    resistance = number(context.record['电阻'])
    temp = number(context.record['温度'])
    context.log(f'自定义算法：电阻={resistance}，温度={temp}')
    return {2: resistance, 3: temp}


def register(registry):
    # 同名 id 替换“温度计”；修改 id 可新增一种仪器。
    registry.register(Instrument('temperature', '温度计（自定义算法）',
        {'电阻': 4, '温度': 5}, calculate, '自定义插件示例：按原值写入，可在 calculate 中修改算法。'))
