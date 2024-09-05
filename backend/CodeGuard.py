import requests
import os
import spacy
import tokenize
import ast
from io import BytesIO
import subprocess

def tokenize_code(code):
    """Tokenizes the code and returns a list of token strings."""
    tokens = tokenize.tokenize(BytesIO(code.encode('utf-8')).readline)
    return [token.string for token in tokens if token.type == tokenize.NAME]

def get_ast_tree(code):
    """Parses the code into an AST tree."""
    return ast.parse(code)

def compare_asts(tree1, tree2):
    """Compares two ASTs and returns True if they are structurally identical."""
    return ast.dump(tree1) == ast.dump(tree2)

# Load English NLP model
nlp = spacy.load("en_core_web_sm")

# Function to get similarity score between two texts
def get_similarity(text1, text2):
    doc1 = nlp(text1)
    doc2 = nlp(text2)
    return doc1.similarity(doc2)

def submit_to_dolos(name, zipfile_path):
    response = requests.post(
        'https://dolos.ugent.be/api/reports',
        files={'dataset[zipfile]': open(zipfile_path, 'rb')},
        data={'dataset[name]': name}
    )
    json = response.json()
    return json["html_url"]

def zip_folder(output_zip, folder_to_zip):
    command = [f'tar.exe-c']

    # non blocking
    proc = subprocess.Popen(command)

# Example usage:
folder_to_zip = "C:/Users/daksh/Desktop/1100100/PythonScratch/ML/HackX/simple-dataset"  # Folder you want to zip
output_zip = "C:/Users/daksh/Desktop/1100100/PythonScratch/ML/HackX/simple-dataset.zip"  # Name of the output zip file

if __name__ == "__main__":
    knowledgebasedir = "C:/Users/daksh/Desktop/1100100/PythonScratch/ML/HackX/knowledgebase"
    knowledgebase = os.listdir(knowledgebasedir)
    inputdir = "C:/Users/daksh/Desktop/1100100/PythonScratch/ML/HackX/inputs"
    inputs = os.listdir(inputdir)
    
    for _ in inputs:
        f1 = open(os.path.join(inputdir, _), "r")
        code1 = f1.read()
        f1.close()
        
        for __ in knowledgebase:
            f2 = open(os.path.join(knowledgebasedir, __), "r")
            code2 = f2.read()
            f2.close()

            tokens1 = tokenize_code(code1)
            tokens2 = tokenize_code(code2)

            tree1 = get_ast_tree(code1)
            tree2 = get_ast_tree(code2)

            # AST Comparison
            if compare_asts(tree1, tree2) < 0.8:
                print("AST failed")
                if get_similarity(code1, code2) < 0.8:
                    print("NLP failed, Now using DOLOS")
                    zip_folder(output_zip, folder_to_zip)
                    print(submit_to_dolos("info.csv", "C:/Users/daksh/Desktop/1100100/PythonScratch/ML/HackX/simple-dataset.zip"))
                else:
                    print("Caught using NLP")
            else:
                print("Caught using AST")
                break
        print("finished\n")