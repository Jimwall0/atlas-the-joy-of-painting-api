import csv
import re
from datetime import datetime

input_file = 'Painting/Episodes.csv'
output_file = 'Painting/cleanEpisodes.csv'


def parse_line(line):
    # Match title in quotes or not, date in first parentheses, then everything else as comment
    match = re.match(r'^"?([^"]+)"?\s+\(([^)]+)\)\s*(.*)$', line.strip())
    if not match:
        print(f"❌ Skipping invalid line: {line.strip()}")
        return None

    title, raw_date, comment = match.groups()

    # Clean comment: remove outer parentheses if they exist
    comment = comment.strip()
    if comment.startswith('(') and comment.endswith(')'):
        comment = comment[1:-1].strip()

    # Parse date
    try:
        parsed_date = datetime.strptime(raw_date.strip(), '%B %d, %Y').strftime('%Y-%m-%d')
    except ValueError:
        print(f"❌ Invalid date format: {raw_date}")
        return None

    return [title.strip(), parsed_date, comment]


# Process the file
with open(input_file, 'r', encoding='utf-8') as infile, \
     open(output_file, 'w', newline='', encoding='utf-8') as outfile:

    writer = csv.writer(outfile)
    writer.writerow(['title', 'date', 'comment'])

    for line in infile:
        if line.strip() == '':
            continue
        parsed = parse_line(line)
        if parsed:
            writer.writerow(parsed)

print(f'✅ Cleaned CSV written to {output_file}')
