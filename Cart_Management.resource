**Settings***

Library           Browser
Resource          Config.resource


***Keywords***

Open Product Page
    New Page    ${PRODUCT_URL}

Select Product And Add To Cart
    [Arguments]    ${product_name}
    # Check for the cookie consent dialog and accept it if present
    Handle Cookie Consent
    Wait For Elements State    xpath=//div[contains(text(), '${product_name}')]    visible
    # Click the "Add to Cart" button corresponding to the product
    Click    xpath=//div[contains(text(), '${product_name}')]/ancestor::a//button[normalize-space()='Add to Cart']

Handle Cookie Consent
    # Wait for the cookie consent dialog to be visible
    Wait For Elements State    xpath=//div[contains(@id, 'onetrust-banner-sdk')]    visible    timeout=5
    Click    xpath=//button[contains(text(), 'Accept All Cookies')]

Open Cart And Verify Product In Cart
    [Arguments]    ${product_name}
    New Page    ${CART_URL}
    Wait For Elements State    xpath=//form[contains(@id, 'ac-form--cart')]    visible
    ${product_in_cart}=    Get Elements    xpath=//div[contains(@title, '${product_name}')]
    Run Keyword If    ${product_in_cart} == []    Fail    Product '${product_name}' not found in the cart.
    ${product_quantity}=    Get Text    xpath=//div[contains(text(), 'Order Details')]/following-sibling::div
    Log    Product '${product_name}' is in the cart with quantity: ${product_quantity}

Empty Cart
    Go To    ${CART_URL}
    Wait For Elements State    xpath=//form[contains(@id, 'ac-form--cart')]    visible
    ${remove_buttons}=    Get Elements    xpath=//img[contains(@alt, 'Remove icon')]
    FOR    ${button}    IN    @{remove_buttons}
        Click    ${button}
    END
