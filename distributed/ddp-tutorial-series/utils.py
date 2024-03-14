import os

from icecream import ic


def print_nodes_info():
    Node = os.environ['LOCAL_RANK']
    ic(Node, os.environ['LOCAL_RANK'], os.environ['RANK'], os.environ['WORLD_SIZE'], os.environ['MASTER_ADDR'],
       os.environ['MASTER_PORT'])

    # os_env_dict = {k: os.environ[k] for k in os.environ if
    #                k in ['LOCAL_RANK', 'RANK', 'WORLD_SIZE', 'MASTER_ADDR', 'MASTER_PORT']}
    # ic(os_env_dict)
    print()
