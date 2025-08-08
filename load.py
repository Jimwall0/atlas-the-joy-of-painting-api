import pandas as pd
import mysql.connector
from mysql.connector import Error

# Database connection config
db_config = {
    'host': 'localhost',
    'user': 'bob',
    'password': 'Th1s!stw1lv!',
    'database': 'The_Joy_Of_Painting'
}

# File paths (update if needed)
csv_files = {
    'episodes': 'Painting/cleanEpisodes.csv',
    'colors': 'Painting/cleanColors.csv',
    'features': 'Painting/cleanSubject.csv'
}


# Function to import each CSV into a MySQL table
def import_csv_to_mysql(table_name, file_path, connection):
    print(f"Importing '{file_path}' into '{table_name}'...")
    try:
        df = pd.read_csv(file_path)

        # Replace NaN with None
        df = df.where(pd.notnull(df), None)

        # Normalize column names to lower case (adjust if your DB uses different)
        df.columns = [col.lower() for col in df.columns]

        cursor = connection.cursor()

        if table_name == 'features':
            if 'episode' in df.columns:
                df.rename(columns={'episode': 'episode_code'}, inplace=True)

            # Get valid episode codes from episodes table
            cursor.execute("SELECT episode_code FROM episodes")
            valid_codes = set(row[0] for row in cursor.fetchall())

            # Filter features rows with valid episode_code only
            df = df[df['episode_code'].isin(valid_codes)]

        # Clear table first (optional)
        cursor.execute(f"DELETE FROM {table_name}")
        connection.commit()

        for _, row in df.iterrows():
            placeholders = ', '.join(['%s'] * len(row))
            columns = ', '.join(row.index)
            sql = f"INSERT INTO {table_name} ({columns}) VALUES ({placeholders})"
            cursor.execute(sql, tuple(row.values))

        connection.commit()
        print(f"✅ Successfully imported {len(df)} rows into '{table_name}'.")

    except Exception as e:
        print(f"❌ Error importing '{file_path}':", e)


# Main execution
try:
    conn = mysql.connector.connect(**db_config)
    if conn.is_connected():
        print("Connected to MySQL ✅")

        for table, file in csv_files.items():
            import_csv_to_mysql(table, file, conn)

        conn.close()
        print("All done. MySQL connection closed.")

except Error as e:
    print("❌ MySQL connection error:", e)
