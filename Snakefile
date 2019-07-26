rule all:
  input: "output_data/poisson_out_test.csv",
          "output_data/poisson_out_train.csv",
          "output_data/rf_out_test.csv",
          "output_data/rf_out_train.csv",
          "output_data/rf_impo_out.csv"

rule model_flood_rf_ps:
  input: "input_data/for_model_avgs.csv"
  output: "output_data/poisson_out_test.csv",
          "output_data/poisson_out_train.csv",
          "output_data/rf_out_test.csv",
          "output_data/rf_out_train.csv",
          "output_data/rf_impo_out.csv"
  shell: "Rscript model_flood_counts_rf_ps_cln.r"


# rule to run model analysis

rule process_data:
  input: "input_data/hampt_rd_data.sqlite",
         "input_data/STORM_data_flooded_streets_2010-2016.csv"
  output: "input_data/for_model_avgs.csv"
  shell: "docker build --tag=data_cleaning -f Dockerfile . 
          docker run -v $(pwd)/:/home/jovyan/project_hydrology"


# if data is not present, download it
rule download_db:
  input:
  output: "input_data/hampt_rd_data.sqlite"
  shell:"wget -O input_data/hampt_rd_data.sqlite https://www.hydroshare.org/resource/9e1b23607ac240588ba50d6b5b9a49b5/data/contents/hampt_rd_data.sqlite"
