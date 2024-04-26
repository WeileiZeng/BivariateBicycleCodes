py=./env/bin/python
setup:
	$(py) decoder_setup.py --code_flag 6 --error_rate 0.003 
clean-log:
	rm log/*.log
sbatch:
	sbatch sbatch.sh
