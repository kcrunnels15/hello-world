import webbrowser
import os
import sys
from tkinter import Tk
from tkinter.filedialog import askopenfilename

Tk().withdraw() # we don't want a full GUI, so keep the root window from appearing
filename = askopenfilename() # show an "Open" dialog box and return the path to the selected file
myinput = open(filename, 'r')
myurl = myinput.read()
webbrowser.open_new(myurl)
