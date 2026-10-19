***Settings***

Library        Browser
Library        Dialogs
Resource       Config.resource


***Keywords***

Login To User Account
    Input Username
    Input User Password
    Inform User To Approve Login
    Wait For Elements State    xpath=//button[contains(text(), 'Trust Device')]    visible  timeout=60
    Click    xpath=//button[contains(text(), 'Trust Device')]

Input Username
    Fill Text    id=user    ${USER}
    Click        button[data-testid=login-new-user-submit]

Input User Password
    Fill Text    id=login-password    ${PASSWORD}
    Click        button[data-testid=login-button]

Inform User To Approve Login
    Log    Please approve the login in the app.
    Execute Manual Step    Please approve the login in the app. Once approved, click on the PASS button to continue.

Logout User
    Go To    ${BASE_URL}
    Click    xpath=//button[contains(@data-uic-component, 'Account.Trigger')]
    Click    xpath=//span[contains(text(), 'Sign Out')]

