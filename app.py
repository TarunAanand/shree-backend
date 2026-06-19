from flask import Flask, jsonify, send_from_directory
from flask_cors import CORS
import psycopg2
import os
from pathlib import Path
from dotenv import load_dotenv

load_dotenv()
app = Flask(__name__)
CORS(app, origins=['http://localhost:3000'])

S3_BASE_URL = os.getenv("S3_BASE_URL")
IMAGE_FOLDER = os.path.join(S3_BASE_URL, "product_images")

def get_connection():
    return psycopg2.connect(
        database="shree_mobiles",
        user="postgres",
        password="postgres",
        host="localhost",
        port="5432"
    )


def format_products(rows):
    products = {}

    for row in rows:
        products[row[0]] = {
            "id": row[0],
            "name": row[1],
            "brand": row[2],
            "category": row[3],
            "description": row[4],
            "images": row[5]
        }

    return list(products.values())

@app.route("/api/products")
def products():
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute("""
        SELECT
            id,
            product_name,
            brand,
            category,
            description
        FROM products
        ORDER BY id
    """)

    rows = cursor.fetchall()

    k = []
    for row in rows:
        row_list = list(row)
        id = row[0]

        cursor.execute(f"select image_url from product_images where product_id={id}")

        images = cursor.fetchall()
        
        images_list = []
        for t in images:
            for image in t:
                s3_url = S3_BASE_URL + image
                images_list.append(s3_url)

        row_list.append(images_list)

        print(row_list, '\n\n')
        k.append(row_list)
        
    formatted_rows = format_products(k)
    records = jsonify(formatted_rows)
    cursor.close()
    conn.close()

    return records


# Get single product
@app.route("/api/products/<id>")
def get_product(id):
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute("""
        SELECT
            p.id,
            p.product_name,
            p.brand,
            p.category,
            p.description,
            pi.image_url
        FROM products p
        LEFT JOIN product_images pi
        ON p.id = pi.product_id
        WHERE p.id = %s
    """, (id,))

    records = cursor.fetchall()

    cursor.close()
    conn.close()

    if not records:
        return jsonify({"error": "Product not found"}), 404

    products = format_products(records)
    return jsonify(products[0] if products else {"error": "Product not found"})


if __name__ == "__main__":
    app.run(debug=True)
