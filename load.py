import pandas as pd
from sqlalchemy import create_engine

# Replace with your actual DB config
username = 'root'
password = 'your_password'
host = 'localhost'
port = 5000
database = 'The_Joy_Of_Painting'

# Create SQLAlchemy engine
engine = create_engine(f'mysql+mysqlconnector://{username}:{password}@{host}:{port}/{database}')

# Load your CSV into a DataFrame
df = pd.read_csv('Painting/cleanColors.csv')  # replace with your actual CSV path

# Optional: Preview the data
print(df.head())

# Upload to SQL table (append or replace)
df.to_sql('Colors', con=engine, if_exists='append', index=False)
