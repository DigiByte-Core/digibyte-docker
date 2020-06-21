# digibyte-docker
Run DigiByte easily from within a Docker image

Simply run:
<pre>git clone https://github.com/DigiByte-Core/digibyte-docker
cd digibyte-docker
docker build -t digibyte-docker:0.1 .
docker run digibyte-docker:0.1</pre>

This will download the latest release specified in the file (which can easily be tweaked manually) and get it all spun up and running.
It's also very easy to run it on testnet etc by tweaking the variables at the top of the Dockerfile
