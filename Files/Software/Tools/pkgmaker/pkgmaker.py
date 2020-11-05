import sys
import os, fnmatch;

def bytes_from_file(filename, chunksize=8192):

    with open(filename, "rb") as f:
        while True:
            chunk = f.read(chunksize)
            if chunk:
                for b in chunk:
                    yield b
            else:
                break

def bytes(num):

    return hex(num >> 8), hex(num & 0xFF)
    
def preparefile(path, filename):
    
    summe = 0;
    length = 0;
    txt = ""

    f = open("upload.pkg", "a")
    f.write("A:DOWNLOAD " + filename + "\n")
    f.write("U0" + "\n")
    
    for b in bytes_from_file(sys.argv[1] + "/" + filename):
        txt += "%02X" % b
        summe = summe + b
        length += 1

    sum_high, sum_low = bytes (summe)	
    len_high, len_low = bytes (length)
    
    f.write(":" + txt + ">" +  len_low.upper()[2:].zfill(2) +  sum_low.upper()[2:].zfill(2) + "\n");
    
    f.close()
    
def main():
   
  listOfFiles = os.listdir( sys.argv[1] )
  pattern = "*.*"
  for entry in listOfFiles:
     if fnmatch.fnmatch(entry, pattern):
        preparefile (sys.argv[1], entry)

if __name__=="__main__":
   main();