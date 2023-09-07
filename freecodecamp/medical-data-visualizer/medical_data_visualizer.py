import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np

# Import data
df = pd.read_csv('medical_examination.csv')

# Add 'overweight' column
df['overweight'] = df.apply(lambda x: 1 if
                            (x['weight'] / (x['height'] / 100)**2) > 25 else 0,
                            axis=1)
#df['overweight'] = (df['weight'] / (df['height'] / 100) ** 2 > 25).astype(int)
# Normalize data by making 0 always good and 1 always bad. If the value of 'cholesterol' or 'gluc' is 1, make the value 0. If the value is more than 1, make the value 1.
df['cholesterol'] = df['cholesterol'].apply(lambda x: 0 if x == 1 else 1)
df['gluc'] = np.where(df['gluc'] == 1, 0, 1)

#df['cholesterol'] = (df['cholesterol'] > 1).astype(int)
#df['gluc'] = (df['gluc'] > 1).astype(int)


# Draw Categorical Plot
def draw_cat_plot():
  # Create DataFrame for cat plot using `pd.melt` using just the values from 'cholesterol', 'gluc', 'smoke', 'alco', 'active', and 'overweight'.
  #df_cat = df[['cholesterol', 'gluc', 'smoke', 'alco', 'active',
  #             'overweight']].copy()
  df_cat = pd.melt(df,
                   id_vars=['cardio'],
                   value_vars=sorted([
                     'cholesterol', 'gluc', 'smoke', 'alco', 'active',
                     'overweight'
                   ]))
  # Group and reformat the data to split it by 'cardio'. Show the counts of each feature. You will have to rename one of the columns for the catplot to work correctly.
  df_cat['total'] = 1
  df_cat = df_cat.groupby(['cardio', 'variable', 'value'],
                          as_index=False).count()
  #df_cat = df_cat.value_counts().reset_index(name="total")
  # Draw the catplot with 'sns.catplot()'

  # Get the figure for the output
  #figure, ax = plt.subplots(figsize=(14, 6))

  fig = sns.catplot(x='variable',
                    y='total',
                    data=df_cat,
                    hue='value',
                    kind='bar',
                    col='cardio').fig
 """fig = sns.catplot(x='variable',
                    y='total',
                    data=df_cat,
                    hue='value',
                    kind='bar',
                    col='cardio').set(title='Result',
                                      xlabel='Variable',
                                      ylabel='Total')"""
  # Do not modify the next two lines
  #fig.figure.savefig('catplot.png')
  fig.savefig('catplot.png')
  return fig


# Draw Heat Map
def draw_heat_map():
  # Clean the data
  df_heat = df.loc[(df['ap_lo'] <= df['ap_hi'])
                   & (df['height'] >= df['height'].quantile(0.025)) &
                   (df["height"] <= df["height"].quantile(0.975)) &
                   (df["weight"] >= df["weight"].quantile(0.025)) &
                   (df["weight"] <= df["weight"].quantile(0.975))]

  # Calculate the correlation matrix
  corr = df_heat.corr(method='pearson')

  # Generate a mask for the upper triangle
  mask = np.triu(np.ones_like(corr))

  # Set up the matplotlib figure
  fig, ax = plt.subplots(figsize=(16, 20))

  # Draw the heatmap with 'sns.heatmap()'
  sns.heatmap(
    corr,
    mask=mask,
    square=True,
    linewidths=0.5,
    annot=True,
    fmt="0.1f",
  )

  ax.set_title('Correlation', weight='bold')
  ax.set_xlabel('Factor')
  ax.set_ylabel('Factor')
  # Do not modify the next two lines
  fig.savefig('heatmap.png')
  return fig
