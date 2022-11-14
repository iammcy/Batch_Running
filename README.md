# Batch Running
The repository is a demo for batch running.

## Dependencies
- Python 3.6+
- Numpy

##  Useage
Two patterns can be used, see the shell file for details
```shell
chmod +x train.sh
nohup bash train.sh > train.out 2>&1 &
tail -100f train.out
```

## Citation
```
@software{Batch Running,
  author = {Chengyuan Mai (Chy Mai)},
  title = {{Batch Running}},
  url = {https://github.com/iammcy/Batch_Running},
  version = {1.0.1},
  year = {2022}
}
```