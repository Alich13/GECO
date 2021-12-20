import  pandas as pd 
import seaborn as sns
import matplotlib.pyplot as plt
plt.figure(figsize=(25,18))

plt.xlabel('organisms', fontsize=25)
plt.ylabel('Ratio (observed/expected)', fontsize=25)
df = pd.read_csv("/home/ali/Desktop/Rapport Geco/data/box_dinu.txt" , sep ="\t")
sns.set_theme(style="whitegrid")
ax = sns.violinplot( data=df, linewidth=2.5)
ax.tick_params(axis='x', rotation=90 ,labelsize=25)
ax.tick_params(axis='y',labelsize=15)
plt.show()
print(df.columns)