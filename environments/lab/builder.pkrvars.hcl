source_image_name = "openhpc-RL9-241009-1523-354b048a" # v1.154
networks = ["82e1f751-26f2-4257-ae84-c9cf49e78dcb"] # slurm-workshop

groups = {
    openhpc-extra = []
}
flavor = "general.v1.2cpu.4gb"
volume_size = {
    openhpc-extra = 15 # GB
}
