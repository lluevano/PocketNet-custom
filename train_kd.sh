export OMP_NUM_THREADS=2
CUDA_VISIBLE_DEVICES=1,2 python -m torch.distributed.launch --nproc_per_node=2 --nnodes=1 \
--node_rank=0 --master_addr="127.0.0.1" --master_port=1234 train/train_kd.py
ps -ef | grep "train" | grep -v grep | awk '{print "kill -9 "$2}' | sh
