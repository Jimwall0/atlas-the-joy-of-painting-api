import csv

input_file = 'Painting/Colors.csv'
output_file = 'Painting/cleanColors.csv'

with open(input_file, 'r', encoding='utf-8') as infile, \
     open(output_file, 'w', newline='', encoding='utf-8') as outfile:

    reader = csv.DictReader(infile)
    fieldnames = reader.fieldnames  # keep original headers
    
    writer = csv.DictWriter(outfile, fieldnames=fieldnames)
    writer.writeheader()

    for row in reader:
        # Example: clean the 'colors' and 'color_hex' columns by removing newlines or unwanted chars
        row['colors'] = row['colors'].replace('\r\n', '').replace('\n', '').strip()
        row['color_hex'] = row['color_hex'].replace('\r\n', '').replace('\n', '').strip()

        # You can add any other cleaning or transformations here
        
        writer.writerow(row)

print(f"✅ Cleaned CSV saved to {output_file}")
