*** Settings ***
Library    SSHLibrary
Library    SeleniumLibrary

*** Variables ***
${HOST}    10.63.3.199
${PORT}    22
${USER}    ndacblr
${PASSWORD}    ND@CblrSYve
${user_name}    contsyveautomation@nokia.com
&{CUI_Password}    Nokia@1133


*** Test Cases ***
Edge kubectl Back Commands and output

    
    Open Connection    ${HOST}    port=${PORT}
    Login    ${USER}    ${PASSWORD}
    
    ${command}=    Execute Command    kubectl delete pod --field-selector="status.phase==Failed" -A
    Log    ${command}
    ${result}=    Execute Command    kubectl get pods
    Log    ${result}

    ${result}=    Execute Command    kubectl get pods -A
    Log    ${result}

    ${result}=    Execute Command    kubectl get node -o wide
    Log    ${result}

    ${result}=    Execute Command    kubectl get gitops
    Log    ${result}

    ${result}=    Execute Command    kubectl get deploy
    Log    ${result}

    ${result}=    Execute Command    kubectl get nodes
    Log    ${result}

    ${result}=    Execute Command    kubectl get ns
    Log    ${result}


    ${result}=    Execute Command    kubectl get pods | grep -i mcn
    Log    ${result}

    ${result}=    Execute Command    kubectl get pods -l sw=ucore
    Log    ${result}

    ${result}=    Execute Command    kubectl get slice slice
    Log    ${result}

    ${result}=    Execute Command    kubectl get jobs
    Log    ${result}

    ${result}=    Execute Command    kubectl get pods --all-namespaces -o jsonpath="{.items[*].spec.containers[*].image}" |tr -s '[[:space:]]' '\n' |sort |uniq -c
    Log    ${result}

    ${result}=    Execute Command    kubectl exec -it `kubectl get pod | grep oma | cut -d " " -f1` -- /go/bin/mcndebugger command uc_state
    Log    ${result}








    Close Connection