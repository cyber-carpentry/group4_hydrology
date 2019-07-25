rule all:
  input: "output_hydrology/poisson_out_test.csv",
          "output_hydrology/poisson_out_train.csv",
          "output_hydrology/rf_out_test.csv",
          "output_hydrology/rf_out_train.csv",
          "output_hydrology/rf_impo_out.csv"

rule model_flood_rf_ps:
  input: "input_hydrology/for_model_avgs.csv"
  output: "output_hydrology/poisson_out_test.csv",
          "output_hydrology/poisson_out_train.csv",
          "output_hydrology/rf_out_test.csv",
          "output_hydrology/rf_out_train.csv",
          "output_hydrology/rf_impo_out.csv"
  shell: "Rscript model_flood_counts_rf_ps_cln.r"

rule by_event_for_model:
  input: 
    "input_hydrology/nor_daily_observations_standalone.csv",
    "input_hydrology/flood_events.csv"
  output: "input_hydrology/for_model_avgs.csv"
  shell:"python by_event_for_model.py"

rule prepare_flood_events:
  input: "input_hydrology/STORM_data_flooded_streets_2010-2016.csv"
  output: "input_hydrology/flood_events.csv"
  shell:"python prepare_flood_events_table.py"

rule make_dly_obs_tbl:
  input: "input_hydrology/hampt_rd_data.sqlite"
  output: "input_hydrology/nor_daily_observations_standalone.csv"
  shell:"python make_dly_obs_table_standalone.py"

# if data is not present, download it
rule download_db:
  input:
  output: "input_hydrology/hampt_rd_data.sqlite"
  shell:"wget https://www.hydroshare.org/resource/9e1b23607ac240588ba50d6b5b9a49b5/data/contents/hampt_rd_data.sqlite"
