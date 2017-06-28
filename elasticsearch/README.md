# docker-compose Elasticsearch

Elasticsearch uses a hybrid mmapfs / niofs directory by default to store its indices. The default operating system limits on mmap counts is likely to be too low, which may result in out of memory exceptions. On Linux, you can increase the limits by running the following command as root:

One time:
sysctl -w vm.max_map_count=262144

Persistant:
echo 'vm.max_map_count=262144' >> /etc/sysctl.conf
