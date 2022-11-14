import argparse
import numpy as np
import random


def test(args):
    return args.lr + random.random()


if __name__ == "__main__":
    parser = argparse.ArgumentParser()

    # arg setting
    parser.add_argument('--lr', default=0.1, type=float)
    parser.add_argument('--attack', default='none', type=str, choices=['none', 'target', 'notarget'])
    # the number of exp
    parser.add_argument('--num_exp', default=1, type=int) 

    args = parser.parse_args()
    print(args)
    
    # run exps
    rets = []
    for run in range(args.num_exp):
        r = test(args)
        rets.append(r)
        print('the {} exp: {:.4f}'.format(run, r))
    rets = np.array(rets)
    print('final result: {:.4f} ± {:.4f}'.format(rets.mean(), rets.std()))