import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.stats import linregress


def draw_plot():
  # Read data from file
  df = pd.read_csv('epa-sea-level.csv')
  df.rename(columns={
      'Year': 'year',
      'CSIRO Adjusted Sea Level': 'csiro',
      'Lower Error Bound': 'loer',
      'Upper Error Bound': 'uper',
      'NOAA Adjusted Sea Level': 'noaa'
  },
            inplace=True)

  # Create scatter plot
  fig, ax = plt.subplots(figsize=(40, 15), dpi=200)
  plt.scatter(x=df['year'], y=df['csiro'], s=200, alpha=1)

  # Create first line of best fit
  res_1 = linregress(x=df['year'], y=df['csiro'])
  df_1 = pd.concat([
      df,
      pd.DataFrame({'year': year}
                   for year in range(df['year'].max() + 1, 2051))
  ],
                   axis=0)
  df_1 = df.append(pd.DataFrame({'year': year}
                                for year in range(df['year'].max() + 1, 2051)),
                   ignore_index=True)
  x_1 = df_1['year']
  #x_1=pd.Series([year for year in range(df['year'].min(), 2051)])
  #x_1=np.arrange(df['year'].min(),2051,dtype=int)
  plt.plot(x_1,
           x_1 * res_1.slope + res_1.intercept,
           color='red',
           label='best fit')

  # Create second line of best fit
  df_2 = df[df['year'] >= 2000]
  res_2 = linregress(x=df_2['year'], y=df_2['csiro'])
  x_2 = np.arange(2000, 2051, dtype=int)
  plt.plot(x_2,
           x_2 * res_2.slope + res_2.intercept,
           color='green',
           label='forecast')

  # Add labels and title
  font = {'family': 'serif', 'color': 'blue', 'size': 40}
  #ax.scatter(x=df['year'],y=df['csiro'],s=200, alpha=1)
  #ax.set_title('Rise in Sea Level',fontdict=font)
  #ax.set_xlabel('Year',fontdict=font)
  #ax.set_ylabel('Sea Level (inches)',fontdict=font)
  plt.title('Rise in Sea Level', loc='center', fontdict=font)
  plt.xlabel("Year", fontdict=font)
  plt.ylabel("Sea Level (inches)", fontdict=font)
  plt.xticks(fontsize=30)
  plt.yticks(fontsize=30)

  # Save plot and return data for testing (DO NOT MODIFY)
  plt.savefig('sea_level_plot.png')
  return plt.gca()
