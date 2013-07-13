# Checks the status of Skype.
import Skype4Py,time
from os.path import join,normpath,realpath

path = normpath(join(realpath(__file__),'..','..','data','skype_status'))

def write_to_file(text):
    global path
    with open(path,'w') as f:
        f.write(text)

write_to_file('...')

s = Skype4Py.Skype()
s.Attach()

received = True
while True:
    if 'RECEIVED' in {x.Status for x in s.Messages()}:
        if not received:
            received = True
            # Action carried out when you receive a message.
            write_to_file('<fc=#FF9933>Message received!</fc>')
    else:
        if received:
            received = False
            # Action carried out when all current received messages have been read.
            write_to_file('No unread messages.')
    time.sleep(5)
