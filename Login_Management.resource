***Settings***

Library        Browser
Library        Dialogs
Library        library/otp.py
Resource       Config.resource


***Keywords***

Login To User Account
    Input Username
    Input User Password
    Enter Otp Code
    Wait For Elements State    xpath=//button[contains(text(), 'Trust Device')]    visible  timeout=60
    Click    xpath=//button[contains(text(), 'Trust Device')]

Input Username
    Fill Text    id=user    ${USER}
    Click        button[data-testid=login-new-user-submit]

Input User Password
    Fill Text    id=login-password    ${PASSWORD}
    Click        button[data-testid=login-button]

Enter Otp Code
    ${otp_code}=    Get Otp Code
    ${length}=    Get Length    ${otp_code}
    FOR  ${index}  IN RANGE  ${length}
        ${digit}=    Evaluate    "${otp_code}"[${index}]
        ${position}=    Evaluate    ${index} + 1
        ${locator}=    Set Variable    xpath=(//input[contains(@class, 'confirmationCodeItem_')])[${position}]
        Fill Text    ${locator}    ${digit}
    END

Logout User
    Go To    ${BASE_URL}
    Click    xpath=//button[contains(@data-uic-component, 'Account.Trigger')]
    Click    xpath=//span[contains(text(), 'Sign Out')]

