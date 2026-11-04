if {[llength [get_projects -quiet]] == 0} {
    create_project -in_memory FDW_POSTROUTE_RESUME -part xc7z030ffg676-2
    puts "FDW_POSTROUTE_EMPTY_PROJECT_INITIALIZED"
}
