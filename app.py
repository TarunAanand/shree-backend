from flask import Flask, jsonify
from flask_cors import CORS
import psycopg2
import os
from dotenv import load_dotenv

load_dotenv()

app = Flask(__name__)
CORS(app, origins=['http://localhost:3000'])

S3_BASE_URL = os.getenv("S3_BASE_URL")


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
        product_id = row[0]

        if product_id not in products:
            products[product_id] = {
                "id": row[0],
                "name": row[1],
                "brand": row[2],
                "category": row[3],
                "description": row[4],
                "images": []
            }

        if row[5]:
            image_url = f"{S3_BASE_URL.rstrip('/')}/{row[5].lstrip('/')}"
            products[product_id]["images"].append(image_url)

    return list(products.values())


@app.route("/api/products")
def products():
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
        ORDER BY p.id
    """)

    rows = cursor.fetchall()

    cursor.close()
    conn.close()

    return jsonify(format_products(rows))


@app.route("/api/products/<int:product_id>")
def get_product(product_id):
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
    """, (product_id,))

    rows = cursor.fetchall()

    cursor.close()
    conn.close()

    if not rows:
        return jsonify({"error": "Product not found"}), 404

    product = format_products(rows)[0]

    return jsonify(product)


if __name__ == "__main__":
    app.run(debug=True)