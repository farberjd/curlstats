# curlstats
Using bash, this script will pretty print all the available curl statistics.

# example usage:
```
bash curlstats.sh https://thatvizsla.life/video.mp4
```

# example output:
```
Transfered 2057 KB/sec in 0.296 seconds.
----------------------------------------
  DNS Resolve Time: 0.005 seconds.
   time_namelookup: 0.005 seconds
   time_appconnect: 0.067 seconds
  time_pretransfer: 0.067 seconds
     time_redirect: 0.000 seconds
time_starttransfer: 0.102 seconds
filename_effective: /dev/null
         http_code: 200
      http_connect: 000
      http_version: 1.1
          local_ip: 127.0.0.1
        local_port: 55470
      num_connects: 1
     num_redirects: 0
         remote_ip: 104.16.39.244
       remote_port: 443
     size_download: 609 KB
       size_header: 715
      size_request: 88
       size_upload: 0
    speed_download: 2057 KB
      speed_upload: 0.000
 ssl_verify_result: 0
     url_effective: https://thatvizsla.life/video.mp4
```
