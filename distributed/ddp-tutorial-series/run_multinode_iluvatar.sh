# --- Environment Variables
export NODE=1

# --- Local Network (USP)
#export IP=10.235.0.9  # Radagast (master)
#export IP=10.235.2.10  # Iluvatar (slave)
# ---

# --- Local Network (Direct connection)
export IP=192.168.0.1  # Radagast (master)
#export IP=192.168.0.2  # Iluvatar (slave)
# ---

#export PORT=29503  # nmap: closed
export PORT=6818  # nmap: open
# ---

# --- Print Environment Variables
echo "--- Node ${NODE}"
echo "IP: ${IP}"
echo "PORT: ${PORT}"
echo "---"
# ---

# Following commands are failing
# torchrun --nproc_per_node=2 --nnodes=2 --node_rank=${NODE} --rdzv_id=456 --rdzv_backend=c10d --rdzv_endpoint=${IP}:${PORT} multinode.py 50 10

# For some reason don't specify the rdzv_backend seems to start to work
torchrun --nproc_per_node=2 --nnodes=2 --node_rank=${NODE} --rdzv_id=456 --rdzv_endpoint=${IP}:${PORT} multinode.py 50 10
