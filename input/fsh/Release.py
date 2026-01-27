import os
from collections import defaultdict

def extract_resources_from_files():
    """
    Extract resource IDs from FSH files and organize by type.
    Returns formatted string similar to package change log format.
    """
    # Dictionary to store resources by type
    resources = defaultdict(list)
    
    # Walk through current directory and all subdirectories
    for root, dirs, files in os.walk('.'):
        for filename in files:
            if filename.endswith('.fsh'):
                filepath = os.path.join(root, filename)
                try:
                    with open(filepath, 'r', encoding='utf-8') as file:
                        lines = file.readlines()
                        
                        if len(lines) < 3:
                            continue
                        
                        # Get first line and extract first word
                        first_line = lines[0].strip()
                        if not first_line:
                            continue
                        
                        first_word = first_line.split()[0].lower()
                        
                        # Determine resource type
                        if first_word in ['profile', 'extension']:
                            resource_type = 'StructureDefinition'
                        else:
                            # Capitalize first letter for consistency
                            resource_type = first_word.capitalize()
                        
                        # Find line starting with "Id: " (case-insensitive)
                        resource_id = None
                        for line in lines:
                            line = line.strip()
                            if line.lower().startswith('id: '):
                                # Extract ID (everything after "id: ")
                                resource_id = line[4:].strip()
                                break
                        
                        if resource_id:
                            resources[resource_type].append(resource_id)
                        else:
                            print(f"Warning: File {filepath} does not have 'Id: ' line")
                                
                except Exception as e:
                    print(f"Error processing file {filepath}: {e}")
                    continue
    
    # Format output with StructureDefinition first
    output_lines = []
    
    # Sort with StructureDefinition first, then alphabetically
    resource_types = sorted(resources.keys())
    if 'StructureDefinition' in resource_types:
        resource_types.remove('StructureDefinition')
        resource_types.insert(0, 'StructureDefinition')
    
    for resource_type in resource_types:
        output_lines.append(f"\t{resource_type}:")
        for resource_id in sorted(resources[resource_type]):
            output_lines.append(f"\t\t{resource_id}")
    
    return '\n'.join(output_lines)

def main():
    """Main function to generate package changes and write to file."""
    print("Extracting resources from FSH files in current directory and subdirectories...")
    
    result = extract_resources_from_files()
    
    if result:
        output_content = "1. Added the following resources:\n" + result + "\n"
        
        # Append to file
        with open('Release-Notes-HDP.txt', 'a', encoding='utf-8') as f:
            f.write(output_content)
        
        print("Release notes appended to Release-Notes-HDP.txt")
        print("\nContent added:")
        print(output_content.rstrip())
    else:
        print("No resources found in FSH files.")

if __name__ == "__main__":
    main()