
import platform
import time
import sys

from emokit.emotiv import Emotiv

if platform.system() == "Windows":
    pass


if __name__ == "__main__":
    with Emotiv(display_output=True, verbose=True, write=True) as headset:
        print("Serial Number: %s" % headset.serial_number)
        print("Exporting data... press control+c to stop.")
        initialtime = time.time()
        while headset.running:
                if time.time() - initialtime > float(sys.argv[1]):
                    exit()
                else:
                    packet = headset.dequeue()