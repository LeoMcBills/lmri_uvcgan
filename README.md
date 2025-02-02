# lmri uvcgan
Project uvcgan2 for lfmri uganda

# How to run this model for development for now.

1. Clone the repo
```bash
git clone https://github.com/LeoMcBills/lmri_uvcgan.git
```

2. Move to the lmri_uvcgan directory
```bash
cd lmri_uvcgan
```

3. Create a virtual environment using anaconda
```bash
conda create --name lmri python=3.10
```

4. Activate the virtual environment using conda
```bash
conda activate lmri
```
5. Create your git branch from which you shall be working
```bash
git checkout -b yourname
```
6. If you check your branches using
```bash
git branch
```
For example my branch name is `leo` so the following is what I see
```bash
(lmri) leo@mcbills:~/Desktop/lmri_uvcganmri/lmri_uvcgan$ git branch
* leo
  main
```

# Now let us set up the model under developement
So this below should be your code structure
```bash
(base) leo@mcbills:~/Desktop/lmri_uvcganmri$ tree -d
.
└── lmri_uvcgan
    ├── contrib
    ├── scripts
    │   └── afhq
    ├── tests
    ├── uvcganmri
    │   ├── base
    │   ├── cgan
    │   ├── config
    │   ├── data
    │   │   └── datasets
    │   ├── eval
    │   ├── models
    │   │   ├── discriminator
    │   │   └── generator
    │   ├── __pycache__
    │   ├── torch
    │   │   ├── layers
    │   │   │   └── __pycache__
    │   │   └── __pycache__
    │   ├── train
    │   │   ├── callbacks
    │   │   └── metrics
    │   └── utils
    └── uvcganmri.egg-info

26 directories
```

The most important file for now is the pyproject.toml file which I wrote to replace the setup.py used in the original uvcgan2 because the latter is deprecated and will not be maintained in the future. You can find that file in the root of the project otherwise the project tree displayed here is only for the directories for simplicity.

## What is the importance of the pyproject.toml file?
Well, it sets up our project, most importantly stating the modules we are to install for the project and turns `uvcganmri` into a module too.

Below are the contents represented in the pyproject.toml file
```toml
[build-system]
requires = ["setuptools>=64", "wheel"]
build-backend = "setuptools.build_meta"

[project]
name = "uvcganmri"
version = "0.0.1"
description = "A Python project for UVCGAN MRI models."
authors = [{name = "Leo Kinyera", email = "leokinyera81@gmail.com"}, 
           {name = "Asiimwe Robert", email = "asiimwerobert69@gmail.com"},
           {name = "Joachim Musiimenta", email = "musiimentajoachim10@gmail.com"},
          ]
dependencies = [
    "torch>=1.8.0",
    "torchvision",
    "numpy",
    "matplotlib>=3.9.1",
    "pyparsing>=2.3.1"  # Resolves your missing dependency
]
```

So to set the project up, just use the following command in terminal
```bash
pip3 install -e . --use-pep517
```

### *You are now ready to contribute, thanks and sorry for the inconveniences brought about by the late README update*

# Why the `conda activate $myenv` command was actually not activating the environment?
Apparently by default, Conda doesn't automatically integrate with non-iteractive shell scripts. Therefore, a command; `eval "$(conda shell.bash hook)"` ensures that Conda commands, like `activate`, will work within the script.

**NOTE**: The stated command only initializes the Conda environment in the current Bash session.