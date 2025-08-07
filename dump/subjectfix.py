import csv

input_file = 'Painting/Subject.csv'
output_file = 'Painting/cleanSubject.csv'

with open(input_file, 'r', encoding='utf-8') as infile, \
     open(output_file, 'w', newline='', encoding='utf-8') as outfile:

    reader = csv.DictReader(infile)
    fieldnames = reader.fieldnames  # keep headers from input

    writer = csv.DictWriter(outfile, fieldnames=fieldnames)
    writer.writeheader()

    for row in reader:
        # Clean the TITLE field: strip quotes and whitespace
        row['TITLE'] = row['TITLE'].replace('"', '').strip()

        # Ensure all feature fields are 0 or 1 integers (optional)
        for key in row:
            if key not in ('EPISODE', 'TITLE'):
                row[key] = '1' if row[key].strip() == '1' else '0'

        writer.writerow(row)

print(f"✅ Features CSV cleaned and written to {output_file}")
