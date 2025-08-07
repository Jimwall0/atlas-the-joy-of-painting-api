import csv
import re
from datetime import datetime

input_file = 'Painting/Episodes.csv'
output_file = 'Painting/cleanEpisodes.csv'


def parse_line(line):
    # Match title in quotes, optional comma, then date parentheses, then optional comment
    match = re.match(r'^"?([^"]+)"?\s*,?\s*\(([^)]+)\)\s*(.*)$', line.strip())
    if not match:
        print(f"❌ Skipping invalid line: {line.strip()}")
        return None

    title, raw_date, comment = match.groups()

    # Clean comment: remove outer parentheses if they exist
    comment = comment.strip()
    if comment.startswith('(') and comment.endswith(')'):
        comment = comment[1:-1].strip()

    try:
        parsed_date = datetime.strptime(raw_date.strip(), '%B %d, %Y').strftime('%Y-%m-%d')
    except ValueError:
        print(f"❌ Invalid date format: {raw_date}")
        return None

    return [title.strip(), parsed_date, comment]



total_lines = 0
parsed_lines = 0
skipped_lines = 0
# Process the file
with open(input_file, 'r', encoding='utf-8') as infile, \
     open(output_file, 'w', newline='', encoding='utf-8') as outfile:

    writer = csv.writer(outfile)
    writer.writerow(['title', 'date', 'comment'])

    for line_number, line in enumerate(infile, 1):
        if line.strip() == '' or line.lower().startswith('title'):
            # skip empty or header lines
            continue

        parsed = parse_line(line)
        if parsed:
            writer.writerow(parsed)
            parsed_lines += 1
        else:
            skipped_lines += 1
            print(f"❌ Skipping invalid line {line_number}: {line.strip()}")


print(f'✅ Cleaned CSV written to {output_file}')
print(f'Total lines read: {total_lines}')
print(f'Lines parsed: {parsed_lines}')
print(f'Lines skipped: {skipped_lines}')
