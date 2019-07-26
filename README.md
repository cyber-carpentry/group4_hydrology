# group4_hydrology
Goal: to replicate analysis from the Sadler et al (2018) study of flooding in a coastal city. Running the code correctly will result in the production of 5 csv files in the output_data folder

### Instructions:
On either a local or virtual machine, navigate to a convenient folder for cloning this repo
In a terminal:
```
git clone https://github.com/cyber-carpentry/group4_hydrology.git
cd group4_hydrology

wget -O input_data/hampt_rd_data.sqlite https://www.hydroshare.org/resource/9e1b23607ac240588ba50d6b5b9a49b5/data/contents/hampt_rd_data.sqlite

docker build --tag=data_cleaning . 
docker run -it -v $(pwd)/:/home/jovyan/project_hydrology data_cleaning bash
snakemake -s Snakefile_datacleaning
exit
```
