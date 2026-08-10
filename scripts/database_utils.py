from sqlalchemy import create_engine
import pandas as pd

def get_engine():
    return create_engine("sqlite:///../notebooks/superstore.db")

def run_query(query):
    engine = get_engine()
    return pd.read_sql(query, engine)

def load_data(file_path):
    engine = get_engine()
    df = pd.read_csv(file_path)
    df.to_sql("sales", engine, if_exists="replace", index=False)
    return df