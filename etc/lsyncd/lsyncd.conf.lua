--

settings {
        logfile = "/var/log/lsyncd/lsyncd.log",
        statusFile = "/var/run/lsyncd.status",
        insist = true,
        inotifyMode = "CloseWrite or Modify",
        statusInterval = 60
}

local merged = io.popen("/usr/bin/lsyncd-merge-includes"):read("*l")

sync {
        default.rsync,
        source = "/",           -- Change this to satisfy what you want to backup
        target = "/mnt/backup", -- Change this to match your backup destination
        delay = 15,
        rsync = {
                update = true,
                archive = true,
                compress = true,
                links = false,
                verbose = true,
                _extra = {
                    "--include-from=" .. merged,
                    "--exclude=*"
                    --[[ Uncomment this if backup destionation is non-ext4 or NFS and add comma to the end of above line 
                    "--no-owner",
                    "--no-group", 
                    "--no-times"
                    --]]
                },
                --[[ Uncomment this and add your username if user doing backup is non-root
                rsh = "/usr/bin/ssh -l $USERNAME -i /home/$USERNAME/.ssh/id_rsa -o StrictHostKeyChecking=no -o User=$USERNAME"
                --]]
        }
}