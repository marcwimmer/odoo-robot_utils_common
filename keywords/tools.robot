*** Settings ***
Documentation                Some Tools
Library                      ../library/odoo.py
Library                      Collections


*** Keywords ***

Set Dict Key      [Arguments]
                  ...          ${data}
                  ...          ${key}
                  ...          ${value}
    tools.Set Dict Key        ${data}  ${key}  ${value}

Get Now As String       [Arguments]
                        ...           ${dummy}=${FALSE}
  ${result}=    tools.Get Now
  ${result}=    Set Variable          ${result.strftime("%Y-%m-%d %H:%M:%S")}
  [return]      ${result}

Get Guid        [Arguments]
                ...           ${dummy}=${FALSE}
  ${result}=    tools.Do Get Guid
  [return]      ${result}

Odoo Sql            [Arguments]
                    ...        ${sql}
                    ...        ${dbname}=${ODOO_DB}
                    ...        ${host}=${ODOO_URL}
                    ...        ${user}=${ODOO_USER}
                    ...        ${pwd}=${ODOO_PASSWORD}
                    ...        ${context}=${None}
    ${result}=  tools.Execute Sql    ${host}  ${dbname}  ${user}  ${pwd}  ${sql}  context=${context}
    [return]                  ${result}


Output Source  [Arguments]
    ${myHtml} =    Get Source
    Log To Console  ${myHtml}


# For Stresstests suitable
Wait For Marker  [Arguments]  
                    ...        ${appendix}
                    ...        ${dbname}=${ODOO_DB}
                    ...        ${host}=${ODOO_URL}
                    ...        ${user}=${ODOO_USER}
                    ...        ${pwd}=${ODOO_PASSWORD}
  tools.Wait For Marker  ${host}  ${dbname}  ${user}  ${pwd}  ${TEST_NAME}${appendix}


Set Wait Marker  [Arguments]  
                    ...        ${appendix}
                    ...        ${dbname}=${ODOO_DB}
                    ...        ${host}=${ODOO_URL}
                    ...        ${user}=${ODOO_USER}
                    ...        ${pwd}=${ODOO_PASSWORD}
  tools.Set Wait Marker  ${host}  ${dbname}  ${user}  ${pwd}  ${TEST_NAME}${appendix}