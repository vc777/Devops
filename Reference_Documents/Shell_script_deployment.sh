#!/bin/bash
set -x
abc=$1
sudo rm -rf /opt/mount1/code_coverage/$abc
cd /opt/mount1/code_coverage/
sudo git clone https://9799b48b93754e69cb376d0b55f6b41d9f45b0bf@github.hpe.com/global-it-entmon/$abc.git
cd /opt/mount1/code_coverage/$abc
sudo mkdir -p /opt/mount1/code_coverage/$abc/ssl
sudo cp -rf /opt/mount2/entmon-notification-workflow-config-service1/src/config/local/* /opt/mount1/code_coverage/$abc/ssl
cd /opt/mount1/code_coverage/$abc/ssl/
sudo mv /opt/mount1/code_coverage/$abc/ssl/entmon-notification-workflow-config-service.cer /opt/mount1/code_coverage/$abc/ssl/$abc.cer
sudo mv /opt/mount1/code_coverage/$abc/ssl/entmon-notification-workflow-config-service.key /opt/mount1/code_coverage/$abc/ssl/$abc.key
sudo mv /opt/mount1/code_coverage/$abc/ssl/entmon-notification-workflow-config-service.pem /opt/mount1/code_coverage/$abc/ssl/$abc.pem
cd /opt/mount1/code_coverage/$abc
#sudo /opt/mount1/SWSetup/node-v8.12.0-linux-x64/bin/npm install
sudo npm install
cd /opt/mount1/code_coverage/$abc
sudo npm test |sudo tee /opt/mount1/code_coverage/$abc/ssl/code_coverage_report.txt
status="$(cat /opt/mount1/code_coverage/$abc/ssl/code_coverage_report.txt | grep "tests failed"|awk {'print $5'})"
coverage="$(cat /opt/mount1/code_coverage/$abc/ssl/code_coverage_report.txt | grep "Coverage" | awk {'print $2'} | awk '{ printf "%s\n", substr($1,1,3) }')"
round=${coverage/.*}
test_duriation="$(cat /opt/mount1/code_coverage/$abc/ssl/code_coverage_report.txt | grep "Test duration")"
test_status_pass="$(cat /opt/mount1/code_coverage/$abc/ssl/code_coverage_report.txt | grep "tests complete")"
test_status_fail="$(cat /opt/mount1/code_coverage/$abc/ssl/code_coverage_report.txt | grep "tests failed")"
if [ "$round" -gt 65 -a  "$status" == "" ]
then
            cd /opt/mount2/$abc
                sudo /opt/mount1/SWSetup/node-v8.12.0-linux-x64/bin/node /opt/mount1/SWSetup/node-v8.12.0-linux-x64/bin/forever stop server.js
                echo "stoping already running forever process with using forever PID"
                sudo kill $(/opt/mount1/SWSetup/node-v8.12.0-linux-x64/bin/node /opt/mount1/SWSetup/node-v8.12.0-linux-x64/bin/forever list |grep $abc | awk -F ' ' '{print $6}')
                # stoping already running forever process with using PID
                echo " stoping already running forever process with using PID "
                sudo kill $(ps -ef |grep server.js |grep $abc | awk -F ' ' '{print $2}')
                cd /opt/mount2
                sudo mv $abc /opt/mount1/$1_`date +%d_%m_%y_%H_%M_%S`
                sudo cp -rf /opt/mount1/code_coverage/$abc /opt/mount2
                cd /opt/mount2/$abc
                sudo NODE_ENV=dev_engg /opt/mount1/SWSetup/node-v8.12.0-linux-x64/bin/node /opt/mount1/SWSetup/node-v8.12.0-linux-x64/bin/forever -l /opt/mount1/logs/$abc-`date +%d_%m_%y_%H_%M_%S`.log start server.js
                echo -e "Code coverage test is Passed for $abc, Deployed successfully.\nPlease find the Coverage Details below:\n--------------------------------------------------------------\n      Environment=Dev_Engg\n      Coverage % =$round\n      Test Stauts = $test_status_pass\n      $test_duriation\n--------------------------------------------------------------\nNote : For more information of NPM Test, please find the above attachement" | mailx -vvv -s "Code Coverage of $abc" -a "/opt/mount2/$abc/ssl/code_coverage_report.txt"  -r "entmondevteam@dxc.com" -S smtp="smtp3.hpe.com" entmondevteam@dxc.com
else
        echo "-----------------------------------------------------------------------------------------"
                echo "The test is failed , So we are not going to deploy your service"
                echo "Old Code only deployed and Running , Please fix the problem and ask for deployement again"
                echo "-----------------------------------------------------------------------------------------"
                echo -e "Code Coverage Test is Failed for $abc.So , we are not doing any deployemet.\nPlease find the Coverage Details below:\n--------------------------------------------------------------\n      Environment=Dev_Engg\n      Coverage % =$round\n      Test Stauts = $test_status_fail\n      $test_duriation\n--------------------------------------------------------------\nNote : For more information of NPM Test, please find the above attachement" | mailx -vvv -s "Code Coverage of $abc" -a "/opt/mount1/code_coverage/$abc/ssl/code_coverage_report.txt"  -r "entmondevteam@dxc.com" -S smtp="smtp3.hpe.com" entmondevteam@dxc.com
fi
