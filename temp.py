import os

path = r"C:\Users\Tarun\Desktop\projects\shree\product_images"

queries = []

for root, dirs, files in os.walk(path):
    for filename in files:
        full_path = os.path.join(root, filename)


        product_id = os.path.basename(root)

        image_url = f"/product_images/{product_id}/{filename}"

        single_query = f"INSERT INTO product_images (product_id, image_url) VALUES ({product_id}, '{image_url}');"

        queries.append(single_query)



with open("insert_query.txt", "w") as f:
    f.write("\n".join(queries))
