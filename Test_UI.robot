***Settings***

Library            Browser
Resource           Cart_Management.resource
Resource           Login_Management.resource

Suite Setup     New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown  Close Browser


***Variables***

${BROWSER}      chromium
${HEADLESS}     True


***Test Cases***

Add Product To Cart
    [Metadata]    Test Type=Semi-automated
    [Metadata]    Interaction    Requires user interaction to approve login in the app.
    [Documentation]    Test adding a product to the cart and verify it stays in the cart after
    ...    user logs out and logs back in.
    New Page    ${LOGIN_URL}
    Login To User Account
    Open Product Page
    Select Product And Add To Cart  ${PRODUCT_NAME}
    Open Cart And Verify Product In Cart  ${PRODUCT_NAME}
    Logout User
    # Ensure the OTP code is regenerated so we don't use the same one for second login
    Sleep  30s
    # Create a new context to clear cookies and local storage
    New Context
    New Page    ${LOGIN_URL}
    Login To User Account
    Open Cart And Verify Product In Cart  ${PRODUCT_NAME}

    [Teardown]    Run Keywords  Empty Cart  AND  Logout User
