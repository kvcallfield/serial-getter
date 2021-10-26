# serial-getter
An expect script that scours all GCP projects and compute instances you have access to, and attempts to obtain serial sessions on each.

Often times in a GCP assessment one of your first goals will be to obtain shell access to compute instances.  What do you do if your user doesn't appear to have SSH access to any VMs though?  An effective vector I've found is to go for serial access instead.

If you're unable to view which projects/VMs you have serial access on, the assessment process can get tedious quickly - you have to set your project, attempt to enable serial access for the project or compute instance, list the compute instances, and try serialing in.  If your user has access to many project, that is a *lot* of typing.  That's where this script comes in...

Usage:

- download the .expect and .sh files from this repo
- in the same folder create the files:
  ./passphrase (which contains your GCP SSH key's passphrase for accessing VMs)
  ./username (which contains the username you'll try to OS login with)
  ./password (which contains the password you'll try to OS login with)
- in the .expect script, you can change the commands run on each VM by replacing the instances of "ping"
- run: ./find_serial_handler.expect

As the script runs, you can view output both in your terminal and at ./serial.out

  
  
