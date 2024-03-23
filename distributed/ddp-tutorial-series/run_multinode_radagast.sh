# --- Environment Variables
export NODE=0

# --- Local Network (USP)
#export IP=10.235.0.9  # Radagast (master)
#export IP=10.235.2.10  # Iluvatar (slave)
# ---

# --- Local Network (Direct connection)
export IP=192.168.0.1  # Radagast (master)
#export IP=192.168.0.2  # Iluvatar (slave)
# ---

#export PORT=29503  # nmap: closed
#export PORT=7070 # nmap: open
export PORT=6817  # nmap: open
#export PORT=24900 # nmap: open
# ---

# --- Print Environment Variables
echo "--- Node ${NODE}"
echo "IP: ${IP}"
echo "PORT: ${PORT}"
echo "---"
# ---

# Following commands are failing
#torchrun --nproc_per_node=2 --nnodes=2 --node_rank=${NODE} --rdzv_id=456 --rdzv_backend=c10d --rdzv_endpoint=${IP}:${PORT} multinode.py 50 10

# For some reason don't specify the rdzv_backend seems to start to work
# The NCCL_SOCKET_IFNAME arguments corresponds to the Radagast's USB Ethernet Interface name.

#NCCL_DEBUG=INFO \
NCCL_SOCKET_IFNAME=enx5ce9315b5950 \
torchrun --nproc_per_node=2 --nnodes=2 --node_rank=${NODE} --rdzv_id=456 --rdzv_endpoint=${IP}:${PORT} multinode.py 50 10
