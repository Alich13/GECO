import argparse
from Bio import SeqIO

def create_parser():
	parser = argparse.ArgumentParser()
	parser.add_argument('-i', '--inputfile', type=str, required=True)
	return parser

def main():
	parser = create_parser()
	args = parser.parse_args()
	args = args.__dict__
	records = list(SeqIO.parse(args['inputfile'], "fasta"))
	cds_mean_len = 0
	for i in range(0, len(records)):
		cds_mean_len += len(records[i].seq)
	print("CDS mean length = " + str(cds_mean_len / len(records)))

if __name__ == '__main__':
	main()