output=serial.out
touch $output

for project in $(gcloud projects list | cut -f1 -d' '); do

    if [[ "$project" == "PROJECT_ID" ]]; then
        continue
    fi

    echo "Trying project $project:"
    gcloud config set project $project >/dev/null 2>&1
    instance_try=`gcloud compute instances list | grep NAME`
    if [[ ! -z "$instance_try" ]]; then
        echo | tee -a $output
        echo "-----------------------------------------------------------" | tee -a $output
        echo "Attempting to enable serial for project $project..." | tee -a $output
        echo "-----------------------------------------------------------" | tee -a $output
        enable_try=`gcloud compute project-info add-metadata --metadata serial-port-enable=TRUE`
        if [[ $? -eq 0 ]]; then
            for instance in $(gcloud compute instances list | grep RUNNING | cut -f1 -d' '); do
                echo | tee -a $output
                echo "---------------------------------------------------" | tee -a $output
                echo "Attempting to serial in to $instance..." | tee -a $output
                echo "---------------------------------------------------" | tee -a $output
                gcloud compute connect-to-serial-port $instance | tee -a $output
                
            done
        fi
    fi

done
