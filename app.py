from flask import Flask, jsonify, send_from_directory
from flask_cors import CORS
import psycopg2
import os
from pathlib import Path
from dotenv import load_dotenv

load_dotenv()
app = Flask(__name__)
CORS(app, origins=['http://localhost:3000'])

# Folder where images are stored (files live under product_images/<id>/...)
S3_BASE_URL = os.getenv("S3_BASE_URL")
IMAGE_FOLDER = os.path.join(S3_BASE_URL, "product_images")


# def image_url_from_db(db_path: str) -> str:
#     """Turn DB paths like /product_images/1/1.jpeg into a servable URL."""
#     path = db_path.replace("\\", "/").lstrip("/")
#     prefix = "product_images/"
#     if path.startswith(prefix):
#         path = path[len(prefix) :]
#     return f"http://127.0.0.1:5000/images/{path}"


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
        pid = row[0]

        if pid not in products:
            products[pid] = {
                "id": pid,
                "name": row[1],
                "brand": row[2],
                "category": row[3],
                "description": row[4],
                "images": []
            }
        

        # row[5] = image path from DB (e.g. /product_images/1/1.jpeg)
        # if row[5]:
            # products[pid]["images"].append(image_url_from_db(row[5]))

    return list(products.values())


# Serve images
# @app.route('/images/<path:filename>')
# def serve_image(filename):
#     return send_from_directory(IMAGE_FOLDER, filename)


# Get all products
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
        RIGHT JOIN product_images pi
        ON p.id = pi.product_id
        ORDER BY p.id
    """)

    records = cursor.fetchall()
    print("records => ", records)


    cursor.close()
    conn.close()

    return jsonify(format_products(records))


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
