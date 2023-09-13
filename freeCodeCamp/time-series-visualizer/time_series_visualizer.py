import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
from pandas.plotting import register_matplotlib_converters
from datetime import datetime

register_matplotlib_converters()

# Import data (Make sure to parse dates. Consider setting index column to 'date'.)
#custom_date_parser = lambda x: datetime.strptime(x, '%Y-%m-%d')
df = pd.read_csv('fcc-forum-pageviews.csv',
                 index_col=['date'],
                 parse_dates=['date'])
#date_format=custom_date_parser)
#df.index=pd.to_datetime(df.index, format='%Y-%m-%d')
#df['date']=pd.to_datetime(df['date'], format='%Y-%m-%d')
#df=df.set_index(['date'], inplace = True)
# Clean data
df = df.loc[(df['value'] >= df['value'].quantile(0.025))
            & (df['value'] <= df['value'].quantile(0.975))]


def draw_line_plot():
  # Draw line plot
  fig, ax = plt.subplots(figsize=(40, 15), dpi=200)
  ax = sns.lineplot(data=df, x='date', y='value', color='red', linewidth=1)
  ax.set(title='Daily freeCodeCamp Forum Page Views 5/2016-12/2019',
         xlabel='Date',
         ylabel='Page Views')
  #fig = sns.lineplot(data=df, x='date', y='value', color='red', linewidth=1)
  #fig.set(title='Daily freeCodeCamp Forum Page Views 5/2016-12/2019',xlabel='Date',ylabel='Page Views')
  #fig.fig.suptitle('Daily freeCodeCamp Forum Page Views 5/2016-12/2019')

  # Save image and return fig (don't change this part)
  #fig.figure.savefig('line_plot.png')
  fig.savefig('line_plot.png')
  return fig


def draw_bar_plot():
  # Copy and modify data for monthly bar plot
  df_bar = df.copy()
  df_bar['month'] = df_bar.index.strftime('%B')
  df_bar['year'] = df_bar.index.strftime('%Y')
  #df_bar['month'] = pd.DatetimeIndex(df_bar.index).month_name
  #df_bar['year'] = pd.DatetimeIndex(df_bar.index).year
  df_bar = df_bar.groupby(['year', 'month']).mean().round()
  df_bar = df_bar.reset_index()
  #df_bar = df_bar.groupby(['year', 'month']).agg({'value':[mean]})
  #df_bar = df_bar.sort_values(['year', 'month'], ascending=True)
  month_order = [
      "January", "February", "March", "April", "May", "June", "July", "August",
      "September", "October", "November", "December"
  ]
  # Draw bar plot
  fig, ax = plt.subplots(figsize=(15, 20), dpi=200)
  ax = sns.barplot(data=df_bar,
                   x='year',
                   y='value',
                   hue='month',
                   hue_order=month_order,
                   errorbar=None)
  #ax.set(title='Average Page Views by month and year',xlabel='Years',ylabel='Average Page Views')
  ax.set_title('Average Page Views by month and year', fontsize=20)
  ax.set_xlabel('Years', fontsize=15)
  ax.set_ylabel('Average Page Views', fontsize=15)
  plt.xticks(rotation=90, fontsize=10)
  plt.yticks(rotation=0, fontsize=10)
  plt.legend(loc='upper left',
             title='Months',
             fontsize='medium',
             title_fontsize='10')

  # Save image and return fig (don't change this part)
  fig.savefig('bar_plot.png')
  return fig


def draw_box_plot():
  # Prepare data for box plots (this part is done!)
  df_box = df.copy()
  df_box.reset_index(inplace=True)
  df_box['year'] = [d.year for d in df_box.date]
  df_box['month'] = [d.strftime('%b') for d in df_box.date]

  # Draw box plots (using Seaborn)
  fig, ax = plt.subplots(1, 2, figsize=(40, 15), dpi=200)
  #fig.suptitle('Bigger 1 row x 2 columns axes with no data')
  sns.boxplot(data=df_box, x='year', y='value', ax=ax[0])
  #ax[0].set(title='Year-wise Box Plot (Trend)',xlabel='Year',ylabel='Page Views')
  ax[0].set_title('Year-wise Box Plot (Trend)', fontsize=20)
  ax[0].set_xlabel('Year', fontsize=15)
  ax[0].set_ylabel('Page Views', fontsize=15)
  month_order = [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct",
      "Nov", "Dec"
  ]
  sns.boxplot(data=df_box, x='month', y='value', order=month_order, ax=ax[1])
  #ax[1].set(title='<Month-wise Box Plot (Seasonality)', xlabel='Month',ylabel='Page Views')
  ax[1].set_title('Month-wise Box Plot (Seasonality)', fontsize=20)
  ax[1].set_xlabel('Month', fontsize=15)
  ax[1].set_ylabel('Page Views', fontsize=15)
  # Save image and return fig (don't change this part)
  # Save image and return fig (don't change this part)
  fig.savefig('box_plot.png')
  return fig
