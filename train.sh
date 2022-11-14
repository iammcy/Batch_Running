#!/bin/sh
# chmod +x train.sh

num_exp=5
attack=("none" "target" "notarget")

# 模式1：后台串行执行
# nohup bash train.sh > train.out 2>&1 &
# tail -100f train.out
for att in ${attack[@]}
do
    for lr in $(seq 1 3)
    do
        # lr=[0.01,0.02,0.03]
        lr_float=$(printf "%.2f" `echo "scale=2; $lr/100"|bc`)
        python main.py --lr $lr_float \
                       --attack $att \
                       --num_exp $num_exp
    done
done

# 模式2：后台多进程执行
# bash train.sh > train.out 2>&1 &
# tail -100f train.out
# for lr in $(seq 1 3)
# do
#     # lr=[0.01,0.02,0.03]
#     lr_float=$(printf "%.2f" `echo "scale=2; $lr/100"|bc`)
#     nohup python main.py --lr $lr_float --attack ${attack[0]} --num_exp $num_exp
#     nohup python main.py --lr $lr_float --attack ${attack[1]} --num_exp $num_exp
#     nohup python main.py --lr $lr_float --attack ${attack[2]} --num_exp $num_exp
# done